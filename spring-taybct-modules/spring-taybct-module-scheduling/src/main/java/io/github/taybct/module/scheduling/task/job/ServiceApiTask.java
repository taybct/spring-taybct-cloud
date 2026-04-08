package io.github.taybct.module.scheduling.task.job;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.lang.UUID;
import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.taybct.common.constants.JwtTokenKeyConstants;
import io.github.taybct.module.scheduling.service.IScheduledLogService;
import io.github.taybct.module.scheduling.task.support.ServiceApiTaskParams;
import io.github.taybct.module.scheduling.task.support.TempAuthDTO;
import io.github.taybct.tool.core.annotation.Scheduler;
import io.github.taybct.tool.core.constant.TokenConstants;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.util.sm.SM2Coder;
import io.github.taybct.tool.scheduling.job.AbstractScheduledTaskJob;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

/**
 *
 * <pre>
 * 服务接口定时任务
 *
 * 通过指定需要的服务名，接口名来调用接口，需要配置如下一些参数：
 *
 * {
 *     "serviceId": "服务名",
 *     "method": "请求方式",
 *     "mapping": "接口映射",
 *     "queryParams": {
 *         "k1":"v1",
 *         "k2":"v2"
 *     },
 *     "queryBody": {
 *         "k1":"v1",
 *         "k2":"v2"
 *     }
 * }
 *
 * serviceId：服务名，也就是注册在注册中心中的服务名，程序会用这个服务名来去注册中心中寻找服务实例然后循环访问这些服务直到找到一个可用的为止
 * method：请求方式，例如 GET POST PUT DELETE，注意，必须要大写
 * mapping：接口映射，例如 /user/name/1，也就是接口的访问地址，也可以在地址中使用 {id} 的方式来动态指定参数，例如 /user/name/{id}?q={q}，那么接口调用的时候就可以传入参数 id 的值了
 * queryParams：get 请求参数，结合上面的 mapping 使用, 例如 {"id":1, "q": "what"}
 * queryBody：post 请求体，例如 {"name":"张三", "age": 28}
 * </pre>
 * <p>
 *
 * @author xijieyin
 * @since 2026/4/3 15:08
 */
@Slf4j
@ConditionalOnClass(DiscoveryClient.class)
@Scheduler("serviceApiTask")
public class ServiceApiTask extends AbstractScheduledTaskJob {

    final IScheduledLogService scheduledLogService;

    final DiscoveryClient discoveryClient;

    public ServiceApiTask(IScheduledLogService scheduledLogService, DiscoveryClient discoveryClient) {
        this.scheduledLogService = scheduledLogService;
        this.discoveryClient = discoveryClient;
    }

    @Override
    protected Consumer<JSONObject> getLogRecorder() {
        return scheduledLogService::logRecorder;
    }

    @Override
    public void run(Map<String, Object> params) throws Exception {
        log.info("serviceApiTask => 当前线程名称 {} ", Thread.currentThread().getName());
        log.info("任务描述：{}", getTaskConfig().getDescription());
        log.info(">>>>>> 服务接口定时任务开始 >>>>>> ");
        ServiceApiTaskParams apiTaskParams = JSONObject.from(params).toJavaObject(ServiceApiTaskParams.class);
        String serviceId = apiTaskParams.getServiceId();
        String method = apiTaskParams.getMethod();
        String mapping = apiTaskParams.getMapping();
        if (serviceId == null || mapping == null || method == null) {
            throw new RuntimeException(String.format("缺少必须的参数 serviceId[%s] method[%s] mapping[%s]", serviceId, method, mapping));
        }
        // 接口请求参数
        Map<String, Object> queryParams = apiTaskParams.getQueryParams();
        JSONObject from = new JSONObject();
        if (queryParams != null) {
            from = JSONObject.from(queryParams);
        }
        Map<String, Object> queryBody = apiTaskParams.getQueryBody();

        List<ServiceInstance> instances = discoveryClient.getInstances((String) serviceId);
        String path = (String) mapping;
        if (path.startsWith("/")) {
            path = path.substring(1);
        }
        for (ServiceInstance instance : instances) {
            R<?> result = new RestTemplate().execute("http://" + instance.getHost() + ":" + instance.getPort() + "/" + path
                    , HttpMethod.valueOf((String) method)
                    , request -> {
                        Map<String, String> headerParams = apiTaskParams.getHeaderParams();
                        if (headerParams != null) {
                            for (Map.Entry<String, String> entry : headerParams.entrySet()) {
                                request.getHeaders().add(entry.getKey(), entry.getValue());
                            }
                        }
                        if (queryBody != null) {
                            // 设置请求头
                            request.getHeaders().setContentType(MediaType.APPLICATION_JSON);

                            TempAuthDTO autoDTO = TempAuthDTO.createDefaultRootUser();
                            TempAuthDTO auth = apiTaskParams.getAuth();
                            if (auth != null){
                                if (auth.getUserId() != null && auth.getUsername() != null){
                                    // 用户 id 和用户名不能为空才对应得上
                                    BeanUtil.copyProperties(auth, autoDTO, CopyOptions.create().ignoreNullValue());
                                }
                            }
                            String payload = createNoAuthToken(autoDTO);
                            request.getHeaders().add(TokenConstants.JWT_PAYLOAD_KEY, payload);
                            // 写入请求体
                            request.getBody().write(JSONObject.toJSONString(queryBody).getBytes(StandardCharsets.UTF_8));
                            request.getBody().flush();
                        }
                    }, response -> {
                        // 自定义解析响应
                        ObjectMapper mapper = new ObjectMapper();
                        return mapper.readValue(response.getBody(), R.class);
                    }, from);
            if (result != null && result.isOk()) {
                break;
            }
        }
        log.info(">>>>>> 服务接口定时任务结束 >>>>>> ");
    }

    /**
     * 创建无鉴权访问的 token
     *
     * <pre>
     *  jwt token payload
     *  iss: jwt签发者
     *  sub: jwt所面向的用户
     *  aud: 接收jwt的一方
     *  exp: jwt的过期时间，这个过期时间必须要大于签发时间
     *  nbf: 定义在什么时间之前，该jwt都是不可用的.
     *  iat: jwt的签发时间
     *  jti: jwt的唯一身份标识，主要用来作为一次性token,从而回避重放攻击。
     * </pre>
     *
     * @param dto 鉴权信息
     * @return token payload
     */
    @SneakyThrows
    public static String createNoAuthToken(TempAuthDTO dto){
        JSONObject body = new JSONObject();
        long now = System.currentTimeMillis() / 1000;
        long exp = now + dto.getExp();
        body.put(JwtTokenKeyConstants.USER_ID, dto.getUserId());
        body.put(TokenConstants.NBF, now);
        body.put(JwtTokenKeyConstants.GRANT_TYPE, dto.getGrantType());
        body.put(JwtTokenKeyConstants.USERNAME, dto.getUsername());
        body.put(TokenConstants.SCOPE_KEY, dto.getScope());
        body.put(TokenConstants.AUTHENTICATION_METHOD, dto.getAtm());
        body.put(TokenConstants.JWT_EXP, exp);
        body.put(TokenConstants.IAT, now);
        body.put(TokenConstants.JWT_JTI, UUID.randomUUID().toString(true));
        body.put(TokenConstants.CLIENT_ID_KEY, dto.getClientId());
        body.put(TokenConstants.JWT_AUTHORITIES_KEY, dto.getRole());
        body.put(TokenConstants.TENANT_ID_KEY, dto.getTenantId());
        return SM2Coder.encryptBase64StringByPublicKey(body.toJSONString());
    }

}
