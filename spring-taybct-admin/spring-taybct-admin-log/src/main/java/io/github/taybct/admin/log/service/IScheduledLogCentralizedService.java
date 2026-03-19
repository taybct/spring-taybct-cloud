package io.github.taybct.admin.log.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import io.github.taybct.scheduledLogCentralized.dto.ScheduledLogCentralizedQueryDTO;
import io.github.taybct.scheduledLogCentralized.service.entity.ScheduledLogCentralized;
import io.github.taybct.tool.core.request.SqlQueryParams;

public interface IScheduledLogCentralizedService extends IService<ScheduledLogCentralized> {

    Page<ScheduledLogCentralized> getPage(SqlQueryParams sqlQueryParams, ScheduledLogCentralizedQueryDTO queryParams);
}
