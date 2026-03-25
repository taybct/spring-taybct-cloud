package io.github.taybct.api.system.feign.factory;

import io.github.taybct.api.system.feign.IWebSocketClient;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.result.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.cloud.openfeign.FallbackFactory;

/**
 *
 * <pre>
 * WebSocket 客户端接口调用失败回调
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/3/25 15:19
 */
@AutoConfiguration
@Slf4j
@ConditionalOnClass({FallbackFactory.class})
public class WebSocketClientFallbackFactory implements FallbackFactory<IWebSocketClient> {
    @Override
    public IWebSocketClient create(Throwable cause) {
        log.error("WebSocket 客户端接口 - IWebSocketClient 调用失败！", cause);
        return new IWebSocketClient() {

            @Override
            public R<?> sendCurrentUserMessage(String message) {
                return getR("发送当前用户消息失败！");
            }

            @Override
            public R<?> sendMessage(String message) {
                return getR("发送消息失败！");
            }

            @Override
            public R<?> sendAllMessage(String message) {
                return getR("发送所有消息失败！");
            }
        };
    }

    private <S> R<S> getR(String message) {
        log.error(message);
        return R.fail(ResultCode.FEIGN_ERROR.getCode(), message);
    }
}
