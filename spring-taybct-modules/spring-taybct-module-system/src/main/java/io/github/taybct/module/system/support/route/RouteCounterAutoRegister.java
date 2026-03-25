package io.github.taybct.module.system.support.route;

import io.github.taybct.api.system.feign.IWebSocketClient;
import io.github.taybct.common.constants.CacheConstants;
import io.github.taybct.module.system.service.ISysRoleService;
import io.github.taybct.module.system.service.ISysUserService;
import io.github.taybct.module.system.support.route.def.WebSocketNoticeHandler;
import io.github.taybct.tool.core.constant.ISysParamsObtainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.AutoConfiguration;

/**
 *
 * <pre>
 * 路由计数自动注册
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/27 16:21
 */
@AutoConfiguration
@Slf4j
@RequiredArgsConstructor
public class RouteCounterAutoRegister implements ApplicationRunner {

    final ISysUserService sysUserService;
    final ISysRoleService sysRoleService;
    final ISysParamsObtainService sysParamsObtainService;
    @DubboReference
    private IWebSocketClient webSocketClient;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        // 获取消息通知延时
        RouteCounter.DEFAULT_DELAY = sysParamsObtainService.getObject(CacheConstants.Params.ROUTE_AUTO_NOTICE_DELAY, Long.class, 5000L);
        // 先注册消息通知处理器（统计完结果之后怎么发送通知到调用端）
        RouteCounter.register(new WebSocketNoticeHandler(webSocketClient));

        // 注册路由统计处理器, 多个路由就注册多个处理器
        RouteCounter.<Long>register("user", config -> sysUserService.count());
        RouteCounter.<Long>register("role", config -> sysRoleService.count());
    }

}
