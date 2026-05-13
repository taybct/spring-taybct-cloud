package io.github.taybct.admin.log.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import io.github.taybct.tool.scheduledlogcentralized.dto.ScheduledLogCentralizedQueryDTO;
import io.github.taybct.tool.scheduledlogcentralized.entity.ScheduledLogCentralized;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;

public interface IScheduledLogCentralizedService extends IService<ScheduledLogCentralized> {

    Page<ScheduledLogCentralized> getPage(SqlPageParams sqlPageParams, ScheduledLogCentralizedQueryDTO queryParams);
}
