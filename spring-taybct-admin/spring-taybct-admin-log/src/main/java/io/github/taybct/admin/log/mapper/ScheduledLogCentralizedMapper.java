package io.github.taybct.admin.log.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.taybct.scheduledLogCentralized.dto.ScheduledLogCentralizedQueryDTO;
import io.github.taybct.scheduledLogCentralized.entity.ScheduledLogCentralized;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 定时任务日志管理 Mapper 接口
 * </p>
 *
 * @author xieaixi
 * @since 2025-12-18
 */
public interface ScheduledLogCentralizedMapper extends BaseMapper<ScheduledLogCentralized> {

    void insertLog(@Param("data") ScheduledLogCentralized scheduledLogCentralized);

    Long pageDataCount(@Param("queryParams") ScheduledLogCentralizedQueryDTO queryParams);

    List<ScheduledLogCentralized> getPageData(@Param("queryParams") ScheduledLogCentralizedQueryDTO queryParams
            , @Param("offset") Long offset
            , @Param("size") Long size);
}
