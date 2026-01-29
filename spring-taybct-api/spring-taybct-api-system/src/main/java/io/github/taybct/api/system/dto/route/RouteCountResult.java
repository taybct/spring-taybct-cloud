package io.github.taybct.api.system.dto.route;

import io.swagger.v3.oas.annotations.media.Schema;

import java.io.Serial;
import java.io.Serializable;

/**
 *
 * <pre>
 * 路由计数结果
 * </pre>
 *
 * @param name 路由名
 * @param total 计数量
 * @param userId 当前登录用户 ID
 * @author XiJieYin
 * @since 2026/1/27 17:15
 */
@Schema(description = "路由计数结果")
public record RouteCountResult<T extends Number>(
        @Schema(description = "路由名")
        String name,
        @Schema(description = "计数量")
        T total,
        @Schema(description = "当前登录用户 ID")
        Long userId) implements Serializable {

    @Serial
    private static final long serialVersionUID = -5606493263756508336L;

}
