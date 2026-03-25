package io.github.taybct.common.message.websocket;

import io.github.taybct.tool.core.result.R;

/**
 * <pre>
 * websocket 消息 api
 * </pre>
 *
 * @author XiJieYin
 * @since 2025/10/31 17:08
 */
public interface WebSocketMessageApi {

    /**
     * 发送当前用户消息
     *
     * @param message 消息内容
     */
    R<?> sendCurrentUserMessage(String message);

    /**
     * 发送简单消息
     *
     * @param message 消息内容
     */
    R<?> sendMessage(String message);

    /**
     * 发送所有用户消息
     *
     * @param message 消息内容
     */
    R<?> sendAllMessage(String message);
}
