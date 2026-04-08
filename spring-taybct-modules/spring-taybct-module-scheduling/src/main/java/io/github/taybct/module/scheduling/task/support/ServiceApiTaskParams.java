package io.github.taybct.module.scheduling.task.support;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serial;
import java.io.Serializable;
import java.util.Map;

/**
 *
 * <pre>
 * 接口参数
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/4/8 10:34
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ServiceApiTaskParams implements Serializable {

    @Serial
    private static final long serialVersionUID = 4861917752048678247L;

    /**
     * 服务 id
     */
    private String serviceId;

    /**
     * 方法名称
     */
    private String method;

    /**
     * 映射路径
     */
    private String mapping;

    /**
     * 查询参数
     */
    private Map<String, Object> queryParams;

    /**
     * 请求体
     */
    private Map<String, Object> queryBody;

    /**
     * 请求头
     */
    private Map<String, String> headerParams;

    /**
     * 鉴权信息
     */
    private TempAuthDTO auth;

}
