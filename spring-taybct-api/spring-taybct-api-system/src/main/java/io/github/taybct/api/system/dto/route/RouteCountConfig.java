package io.github.taybct.api.system.dto.route;

import io.swagger.v3.oas.annotations.media.Schema;

import java.io.Serial;
import java.io.Serializable;
import java.util.Map;

/**
 * 路由计数类型
 * @param name 路由名
 * @param params 参数
 * @param userId 需要通知的用户 ID 一般是当前登录用户 ID
 * @author xijieyin
 */
@Schema(description = "路由计数类型")
public record RouteCountConfig(
        @Schema(description = "路由名")
        String name,
        @Schema(description = "计数参数配置")
        Map<String,Object> params,
        @Schema(description = "需要通知的用户 ID 一般是当前登录用户 ID")
        Long userId) implements Serializable {

    @Serial
    private static final long serialVersionUID = -5606493263756508335L;

}
