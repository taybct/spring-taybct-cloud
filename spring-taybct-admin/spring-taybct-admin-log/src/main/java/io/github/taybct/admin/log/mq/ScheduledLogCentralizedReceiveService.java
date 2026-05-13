package io.github.taybct.admin.log.mq;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.rabbitmq.client.Channel;
import io.github.taybct.admin.log.service.IScheduledLogCentralizedService;
import io.github.taybct.tool.scheduledlogcentralized.entity.ScheduledLogCentralized;
import io.github.taybct.tool.scheduledlogcentralized.service.IScheduledLogCentralizedFinishedActionService;
import io.github.taybct.tool.core.message.scheduledLogCentralized.ScheduledLogCentralizedSendMQConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 接收定时任务消息 写日志
 *
 * @author xieaixi
 * @since 2026/12/30 11:30
 */
@Slf4j
@AutoConfiguration
@ConditionalOnClass(RabbitTemplate.class)
@RequiredArgsConstructor
public class ScheduledLogCentralizedReceiveService {

    private final IScheduledLogCentralizedService scheduledLogCentralizedService;
    private final IScheduledLogCentralizedFinishedActionService scheduledLogCentralizedFinishedActionService;

    /**
     * 从 mq 读取消息
     *
     * @param message 消息体
     * @param channel 通道
     * @author xieaixi
     * @since 2026/12/30 11:30
     */
    @RabbitHandler
    @RabbitListener(bindings = @QueueBinding(
            exchange = @Exchange(value = ScheduledLogCentralizedSendMQConfig.def.EXCHANGE, type = "x-delayed-message"),
            value = @Queue(value = ScheduledLogCentralizedSendMQConfig.def.QUEUE)
    ), ackMode = "MANUAL")
    public void scheduledLogCentralizedResults(Message message, Channel channel) throws IOException {
        LocalDateTime now = LocalDateTime.now();
        String json = new String(message.getBody(), StandardCharsets.UTF_8);

        // 这里存入到数据库去
        try {
            JSONArray jsonArray = JSONArray.parseArray(json);
            List<ScheduledLogCentralized> javaList = jsonArray.toJavaList(ScheduledLogCentralized.class);
            for (ScheduledLogCentralized item : javaList) {
                item.setId(IdWorker.getId());
                item.setInsertTime(now);
            }
            try {
                scheduledLogCentralizedService.saveBatch(javaList);
            } finally {
                //插入的数据是调用成功/失败，之后需要做什么
                scheduledLogCentralizedFinishedActionService.afterFailedCollections(javaList);
            }
        } catch (Exception e) {
            log.trace("保存失败！", e);
            log.trace("接收到的不是集合?");
        }
        try {
            ScheduledLogCentralized scheduledLogCentralized = JSONObject.parseObject(json, ScheduledLogCentralized.class);
            scheduledLogCentralized.setId(IdWorker.getId());
            scheduledLogCentralized.setInsertTime(now);
            try {
                scheduledLogCentralizedService.save(scheduledLogCentralized);
            } finally {
                //插入的数据是调用成功/失败，之后需要做什么
                scheduledLogCentralizedFinishedActionService.afterFailed(scheduledLogCentralized);
            }
        } catch (Exception e) {
            log.trace("保存失败！", e);
            log.trace("接收到的不是对象?");
        }

        log.debug("\r\n==== 接收到定时任务日志管理 MQ消息 \r\n==== {}", json);
        channel.basicAck(message.getMessageProperties().getDeliveryTag(), true);
    }

}
