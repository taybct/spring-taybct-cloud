package io.github.taybct.admin.ws.handle;

import io.github.taybct.tool.core.bean.ISecurityUtil;
import io.github.taybct.tool.core.websocket.endpoint.IWebSocketServer;
import io.github.taybct.tool.core.websocket.support.WSR;
import jakarta.websocket.Session;
import lombok.RequiredArgsConstructor;

/**
 *
 * <pre>
 * websocket service
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/3/25 15:31
 */
@RequiredArgsConstructor
public class WebSocketHandler {

    final IWebSocketServer<Session> webSocketServer;

    final ISecurityUtil securityUtil;


    /**
     * 发送当前用户消息
     *
     * @param message 消息内容
     * @return boolean 是否发送成功
     * @author xijieyin <br> 2025/08/22 09:38:46
     * @since 3。2。4
     */
    public boolean sendCurrentUserMessage(String message) {
        if (webSocketServer != null) {
            webSocketServer.sendSimpleMessage(message, securityUtil.getLoginUser().getUserId());
        }
        return true;
    }

    /**
     * <pre>
     * 发送消息
     * </pre>
     *
     * @param message 消息
     * @return boolean
     * @author xijieyin
     * @since 3。2。4
     */
    public <E> boolean sendMessage(WSR<E> message) {
        if (webSocketServer != null) {
            webSocketServer.sendMessage(message);
        }
        return true;
    }

    /**
     * <pre>
     * 发送消息给所有人
     * </pre>
     *
     * @param message 消息
     * @return boolean
     * @author xijieyin
     * @since 3。2。4
     */
    public <E> boolean sendAllMessage(WSR<E> message) {
        if (webSocketServer != null) {
            webSocketServer.sendAllMessage(message);
        }
        return true;
    }

}
