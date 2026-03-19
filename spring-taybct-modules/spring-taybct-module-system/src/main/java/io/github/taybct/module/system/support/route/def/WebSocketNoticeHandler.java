package io.github.taybct.module.system.support.route.def;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.api.system.dto.route.RouteCountResult;
import io.github.taybct.module.system.support.route.NoticeHandler;
import io.github.taybct.module.system.support.route.RouteCounter;
import io.github.taybct.tool.core.websocket.endpoint.IWebSocketServer;
import io.github.taybct.tool.core.websocket.enums.MessageUserType;
import io.github.taybct.tool.core.websocket.support.MessageUser;
import io.github.taybct.tool.core.websocket.support.WSR;
import jakarta.websocket.Session;

import java.util.Collection;
import java.util.LinkedHashSet;

/**
 *
 * <pre>
 * 使用 websocket 通知前端
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/1/28 10:32
 */
public class WebSocketNoticeHandler implements NoticeHandler<Number> {

    final IWebSocketServer<Session> webSocketServer;

    public WebSocketNoticeHandler(IWebSocketServer<Session> webSocketServer) {
        this.webSocketServer = webSocketServer;
    }

    @Override
    public void accept(Collection<RouteCountResult<Number>> resultCollection, Long delay) {
        JSONObject data = new JSONObject();
        LinkedHashSet<MessageUser> toUser = new LinkedHashSet<>();
        resultCollection
                .forEach(result -> {
                    data.put(result.name(), result.total());
                    // 虽然可以确定大概一般只会是一个用户，但是也不确定，所以这里还是用Set
                    toUser.add(new MessageUser(MessageUserType.USER, result.userId(), null));
                });
        try {
            if (delay > 0) {
                Thread.sleep(delay);
            }
                /*
                存在用户才发送，如果不存在就等待几秒,再发送，如果一直不存在，超过3次就再也不发送了，这里的这个延迟时间要根据应用场景来定，要看实际 websocket 登录连接上需要的时间而定不然会发送不了：
                第一种情况：没有用户连接，发送不了
                第二种情况：有用户连接，但是是上一个 session 的，需要最新的 session
                 */
            webSocketServer.sendMessage(WSR.<JSONObject>ok("路由数据统计")
                    .setTitle("路由数据统计")
                    .setTopic(RouteCounter.Constant.TOPIC)
                    .setData(data)
                    .setToUser(toUser));
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
