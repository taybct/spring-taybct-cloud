package io.github.taybct.api.system.feign;

import io.github.taybct.api.system.feign.factory.WebSocketClientFallbackFactory;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.common.message.websocket.WebSocketMessageApi;
import io.github.taybct.tool.core.constant.AppConstants;
import io.github.taybct.tool.core.result.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * <pre>
 * WebSocket 客户端
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/3/25 15:14
 */
@FeignClient(primary = false, contextId = "webSocketClient", value = ServeConstants.SERVE_ID_ADMIN_WEBSOCKET, fallbackFactory = WebSocketClientFallbackFactory.class)
public interface IWebSocketClient extends WebSocketMessageApi {


//    @Override
//    default boolean sendCurrentUser(String message) {
//        return sendCurrentUserMessage(message).isOk();
//    }
//
//    @Override
//    default boolean send(WSR<?> message) {
//        return sendMessage(message).isOk();
//    }
//
//    @Override
//    default boolean sendAll(WSR<?> message) {
//        return sendAllMessage(message).isOk();
//    }
//
//    default R<?> sendMessage(WSR<?> message){
//        return sendMessage(JSONObject.toJSONString(message));
//    }
//    default R<?> sendAllMessage(WSR<?> message){
//        return sendMessage(JSONObject.toJSONString(message));
//    }

    /**
     * 发送即时消息
     *
     * @param message 消息内容
     */
    @PostMapping("v" + AppConstants.DEFAULT_API_VERSION + "/ws/sendMessage")
    @Override
    R<?> sendMessage(@RequestParam String message);

    /**
     * 发送当前用户消息
     *
     * @param message 消息内容
     */
    @PostMapping("v" + AppConstants.DEFAULT_API_VERSION + "/ws/sendCurrentUserMessage")
    @Override
    R<?> sendCurrentUserMessage(@RequestParam String message);

    /**
     * 发送所有用户消息
     *
     * @param message 消息内容
     */
    @PostMapping("v" + AppConstants.DEFAULT_API_VERSION + "/ws/sendAllMessage")
    @Override
    R<?> sendAllMessage(@RequestParam String message);
}
