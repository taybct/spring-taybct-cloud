package io.github.taybct.admin.ws.dubbo;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.admin.ws.handle.WebSocketHandler;
import io.github.taybct.api.system.feign.IWebSocketClient;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.websocket.support.WSR;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.ConfigCenterConfig;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;

/**
 * <pre>
 * 消息通知接口实现
 * </pre>
 *
 * @author XiJieYin
 * @since 2025/8/21 18:11
 */
@DubboService(protocol = "dubbo")
@RequiredArgsConstructor
@AutoConfiguration
@ConditionalOnClass(ConfigCenterConfig.class)
public class WebsocketClientImpl implements IWebSocketClient {

    final WebSocketHandler webSocketHandler;

    @Override
    public R<?> sendCurrentUserMessage(String message) {
        return webSocketHandler.sendCurrentUserMessage(message) ? R.ok("发送成功") : R.fail("发送失败");
    }

    @Override
    public R<?> sendMessage(String message) {
        WSR<?> wsr = JSONObject.parseObject(message, WSR.class);
        return webSocketHandler.sendMessage(wsr) ? R.ok("发送成功") : R.fail("发送失败");
    }

    @Override
    public R<?> sendAllMessage(String message) {
        WSR<?> wsr = JSONObject.parseObject(message, WSR.class);
        return webSocketHandler.sendAllMessage(wsr) ? R.ok("发送成功") : R.fail("发送失败");
    }
}
