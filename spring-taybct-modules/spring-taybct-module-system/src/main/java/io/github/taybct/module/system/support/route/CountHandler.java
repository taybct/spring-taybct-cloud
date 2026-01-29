package io.github.taybct.module.system.support.route;

import io.github.taybct.api.system.dto.route.RouteCountConfig;

import java.util.function.Function;

/**
 *
 * <pre>
 * 统计处理器
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/27 15:33
 */
public interface CountHandler<T extends Number> extends Function<RouteCountConfig, T> {

}
