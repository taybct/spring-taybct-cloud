package io.github.taybct.common.message.cheduledlog;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.github.taybct.tool.core.message.Message;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 定时任务控制台日志
 * </p>
 *
 * @author xieaixi
 * @since 2025-12-18
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduledLogCentralizedDTO implements Message {

    private static final long serialVersionUID = -2710074899213437355L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    @Schema(description = "生成日志时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime successTime;

    @Schema(description = "本次运行id")
    private String runId;

    @Schema(description = "模块名称")
    private String moduleName;

    @Schema(description = "方法名称")
    private String methodName;

    @Schema(description = "是否成功")
    private String status;

    @Schema(description = "日志内容")
    private String log;

    @Schema(description = "插入时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime insertTime;

    @Schema(description = "父级调用runId")
    private String parentRunId;
}
