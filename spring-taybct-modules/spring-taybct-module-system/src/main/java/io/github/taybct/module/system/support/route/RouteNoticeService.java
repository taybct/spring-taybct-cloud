package io.github.taybct.module.system.support.route;

import io.github.taybct.api.system.dto.route.RouteCountResult;
import io.github.taybct.tool.core.bean.ISecurityUtil;
import lombok.RequiredArgsConstructor;

import java.util.Collections;
import java.util.List;

/**
 *
 * <pre>
 * 路由通知服务，后续可以通过 RPC 调用来将数量统计发送给前端
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/29 09:30
 */
@RequiredArgsConstructor
public class RouteNoticeService {

    final ISecurityUtil securityUtil;

    /**
     * 通知前端
     *
     * @param resultCollection 结果列表
     */
    public void notice(List<RouteCountResult<Number>> resultCollection) {
        notice(resultCollection, 0L);
    }

    /**
     * 通知前端
     *
     * @param resultCollection 结果列表
     * @param delay 延迟
     */
    public void notice(List<RouteCountResult<Number>> resultCollection, Long delay) {
        RouteCounter.notice(resultCollection, delay);
    }

    /**
     * 仅通知指定路由到当前用户的前端
     *
     * @param routeName 路由名称
     * @param count     数量
     */
    public void notice(String routeName, Number count) {
        notice(routeName, count, 0L);
    }

    /**
     * 仅通知指定路由到当前用户的前端
     *
     * @param routeName 路由名称
     * @param count     数量
     * @param delay 延迟
     */
    public void notice(String routeName, Number count, Long delay) {
        RouteCounter.notice(Collections.singletonList(new RouteCountResult<>(routeName, count, securityUtil.getLoginUser().getUserId())), delay);
    }

}
