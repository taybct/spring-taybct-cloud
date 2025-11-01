package io.github.taybct.module.scheduling.task.job;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.common.message.websocket.WebSocketMessageDTO;
import io.github.taybct.module.scheduling.service.IScheduledLogService;
import io.github.taybct.tool.core.annotation.Scheduler;
import io.github.taybct.tool.core.constant.DateConstants;
import io.github.taybct.tool.core.message.IMessageSendService;
import io.github.taybct.tool.core.util.StringPool;
import io.github.taybct.tool.core.websocket.enums.MessageUserType;
import io.github.taybct.tool.core.websocket.support.MessageUser;
import io.github.taybct.tool.core.websocket.support.WSR;
import io.github.taybct.tool.scheduling.job.AbstractScheduledTaskJob;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfiguration;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.function.Consumer;

/**
 * 测试任务
 *
 * @author xijieyin <br> 2022/11/1 11:37
 * @since 1.1.0
 */
@AutoConfiguration
@RequiredArgsConstructor
@Slf4j
@Scheduler("demo1")
public class Demo1Task extends AbstractScheduledTaskJob {

    final IScheduledLogService scheduledLogService;

    @Resource
    private IMessageSendService messageSendService;

    @Override
    protected Consumer<JSONObject> getLogRecorder() {
        return scheduledLogService::logRecorder;
    }

    @Override
    public void run(Map<String, Object> params) throws Exception {
        log.info("demo1 task => 当前线程名称 {} ", Thread.currentThread().getName());
        params.forEach((k, v) -> log.info("{} >>>> {}", k, v));
        log.info(">>>>>> 测试任务开始 >>>>>> ");

        WSR<Object> message = WSR.ok("发送消息：" + params.get("message") + "[" + LocalDateTime.now().format(DateTimeFormatter.ofPattern(DateConstants.format.YYYY_MM_DD_HH_mm_ss)) + "]");
        if (params.get("toUserId") != null) {
            String toUserId = (String) params.get("toUserId");
            message.setToUser(new LinkedHashSet<>(Arrays.stream(toUserId.split(StringPool.COMMA))
                    .map(Long::parseLong)
                    .map(id -> new MessageUser(MessageUserType.USER, id, null)).toList()));
        }
        messageSendService.send(new WebSocketMessageDTO(message, true));
//        stopRecord(OperateStatus.SUCCESS.getCode(), "我自己记录一个消息");
//        throw new RuntimeException("最后个报错");
    }

}
