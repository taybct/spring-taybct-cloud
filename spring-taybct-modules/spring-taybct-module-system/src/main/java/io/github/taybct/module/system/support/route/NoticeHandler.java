package io.github.taybct.module.system.support.route;

import io.github.taybct.api.system.dto.route.RouteCountResult;

import java.util.Collection;
import java.util.function.BiConsumer;

/**
 *
 * <pre>
 * 消息通知处理器
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/27 17:08
 */
public interface NoticeHandler<T extends Number> extends BiConsumer<Collection<RouteCountResult<T>>, Long> {
}
