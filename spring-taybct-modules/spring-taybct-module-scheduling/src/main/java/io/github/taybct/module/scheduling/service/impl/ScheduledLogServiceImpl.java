package io.github.taybct.module.scheduling.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.taybct.module.scheduling.domain.ScheduledLog;
import io.github.taybct.module.scheduling.dto.ScheduledLogQueryDTO;
import io.github.taybct.module.scheduling.mapper.ScheduledLogMapper;
import io.github.taybct.module.scheduling.service.IScheduledLogService;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

/**
 * 针对表【scheduled_log(调度日志)】的数据库操作Service实现
 *
 * @author 24154
 */
@Service
@AutoConfiguration
public class ScheduledLogServiceImpl extends ServiceImpl<ScheduledLogMapper, ScheduledLog>
        implements IScheduledLogService {

    @Override
    public void logRecorder(JSONObject record) {
        JSONObject params = record.getJSONObject("params");
        ScheduledLog scheduledLog = record.toJavaObject(ScheduledLog.class);
        assert scheduledLog != null;
        scheduledLog.setUpdateTime(LocalDateTime.now());
        String tenantId = params.getString("tenantId");
        scheduledLog.setTenantId(tenantId);
        scheduledLog.setId(IdWorker.getId());
        save(scheduledLog);
    }

    @Override
    public IPage<ScheduledLog> page(Map<String, Object> sqlPageParams) {
        SqlPageParams pageParams = SqlPageParams.of(sqlPageParams);
        pageParams.allowedSort(ScheduledLog.class);
        QueryWrapper<ScheduledLog> queryWrapper = (QueryWrapper<ScheduledLog>) pageParams.genQueryWrapper(JSONObject.parseObject(JSONObject.toJSONString(sqlPageParams)).toJavaObject(getEntityClass()));

        LambdaQueryWrapper<ScheduledLog> logLambdaQueryWrapper = queryWrapper.lambda();
        ScheduledLogQueryDTO dto = JSONObject.parseObject(JSONObject.toJSONString(sqlPageParams), ScheduledLogQueryDTO.class);
        // 开始时间
        Optional.ofNullable(dto.getTimeBegin())
                .ifPresent(timeBegin -> logLambdaQueryWrapper.ge(ScheduledLog::getStartTime, timeBegin));
        // 结束时间
        Optional.ofNullable(dto.getTimeEnd())
                .ifPresent(timeEnd -> logLambdaQueryWrapper.le(ScheduledLog::getStartTime, timeEnd));
        return page(pageParams.genPage(), logLambdaQueryWrapper);
    }

}




