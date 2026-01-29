package io.github.taybct.module.system.support.route;

import cn.hutool.core.collection.CollectionUtil;
import io.github.taybct.api.system.dto.route.RouteCountConfig;
import io.github.taybct.api.system.dto.route.RouteCountResult;
import lombok.Getter;
import org.springframework.boot.system.JavaVersion;
import org.springframework.core.task.SimpleAsyncTaskExecutor;
import org.springframework.core.task.TaskExecutor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Supplier;

/**
 *
 * <pre>
 * 路由统计处理器
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/27 15:29
 */
public class RouteCounter {

    @Getter
    private static final ConcurrentHashMap<String, CountHandler<Number>> COUNTER_MAP = new ConcurrentHashMap<>();

    private static final List<NoticeHandler<Number>> NOTICE_HANDLER_LIST = new ArrayList<>();

    /**
     * 默认的延迟时间
     */
    public static Long DEFAULT_DELAY = 0L;

    /**
     * 静态常量
     */
    public interface Constant {
        /**
         * 路由统计配置的键，用于配置的菜单的 props 字段的配置中
         */
        String ROUTE_COUNT_KEY = "routeCountConfig";
        /**
         * 路由名称的键
         */
        String ROUTE_NAME_KEY = "name";
        /**
         * 用户 ID 的键
         */
        String USER_ID_KEY = "userId";
        /**
         * 通知主题
         */
        String TOPIC = "route-notice";
    }

    /**
     * 任务执行器
     */
    private final static Supplier<TaskExecutor> executor = () -> {
        SimpleAsyncTaskExecutor simpleAsyncTaskExecutor = new SimpleAsyncTaskExecutor("RouteCounterTask");
        // 如果是 JDK 21 可以设置 true 来开启虚拟线程，如果是 JDK 17 以下，需要设置成 false
        simpleAsyncTaskExecutor.setVirtualThreads(JavaVersion.getJavaVersion().isEqualOrNewerThan(JavaVersion.TWENTY_ONE));
        return simpleAsyncTaskExecutor;
    };

    /**
     * 统计
     *
     * @param config 配置
     */
    public static void count(Collection<RouteCountConfig> config) {
        if (CollectionUtil.isNotEmpty(config)) {
            executor.get().execute(() -> {
                List<RouteCountResult<Number>> list = config.stream().filter(c -> COUNTER_MAP.get(c.name()) != null)
                        .map(c -> {
                            CountHandler<? extends Number> handler = COUNTER_MAP.get(c.name());
                            Number result = handler.apply(c);
                            return new RouteCountResult<>(c.name(), result, c.userId());
                        })
                        .toList();
                notice(list, DEFAULT_DELAY);
            });
        }
    }

    /**
     * 通知前端
     *
     * @param list 结果列表
     */
    public static void notice(List<RouteCountResult<Number>> list, Long delay) {
        if (CollectionUtil.isNotEmpty(list)) {
            executor.get().execute(() -> NOTICE_HANDLER_LIST.forEach(handler -> handler.accept(list, delay)));
        }
    }

    /**
     * 注册消息通知处理器
     *
     * @param handler 处理器
     */
    public static void register(NoticeHandler<Number> handler) {
        NOTICE_HANDLER_LIST.add(handler);
    }

    /**
     * 注册路由统计处理器
     *
     * @param route   路由
     * @param handler 处理器
     */
    public static void register(String route, CountHandler<Number> handler) {
        COUNTER_MAP.put(route, handler);
    }

}
