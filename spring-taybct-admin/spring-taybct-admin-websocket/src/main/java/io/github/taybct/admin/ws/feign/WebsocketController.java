package io.github.taybct.admin.ws.feign;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.admin.ws.handle.WebSocketHandler;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.websocket.support.WSR;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 *
 * <pre>
 * websocket 控制器
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/3/25 15:37
 */
@Tag(name = "websocket 控制器")
@RequestMapping(ServeConstants.CONTEXT_PATH_ADMIN_WEBSOCKET + "{version}/ws")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class WebsocketController {

    final WebSocketHandler webSocketHandler;

    /**
     * 发送当前用户消息
     *
     * @param message 消息内容
     */
    @Operation(summary = "发送当前用户消息")
    @PostMapping("sendCurrentUserMessage")
    @WebLog
    public R<?> sendCurrentUserMessage(@RequestParam String message) {
        return webSocketHandler.sendCurrentUserMessage(message) ? R.ok("操作%s成功！") : R.fail("操作%s失败！");
    }

    /**
     * 发送简单消息
     *
     * @param message 消息内容
     */
    @Operation(summary = "发送简单消息")
    @PostMapping("sendMessage")
    @WebLog
    public R<?> sendMessage(@RequestParam String message) {
        WSR<?> wsr = JSONObject.parseObject(message, WSR.class);
        return webSocketHandler.sendMessage(wsr) ? R.ok("操作%s成功！") : R.fail("操作%s失败！");
    }

    /**
     * 发送所有用户消息
     *
     * @param message 消息内容
     */
    @Operation(summary = "发送所有用户消息")
    @PostMapping("sendAllMessage")
    @WebLog
    public R<?> sendAllMessage(@RequestParam String message) {
        WSR<?> wsr = JSONObject.parseObject(message, WSR.class);
        return webSocketHandler.sendAllMessage(wsr) ? R.ok("操作%s成功！") : R.fail("操作%s失败！");
    }

}


