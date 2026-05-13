package io.github.taybct.admin.log.service.impl;

import io.github.taybct.tool.scheduledlogcentralized.entity.ScheduledLogCentralized;
import io.github.taybct.tool.scheduledlogcentralized.service.IScheduledLogCentralizedFinishedActionService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Collection;

@AutoConfiguration
@Service
@Async
public class ScheduledLogCentralizedFinishedActionServiceImpl implements IScheduledLogCentralizedFinishedActionService {
    @Override
    public void afterFailedCollections(Collection<ScheduledLogCentralized> scheduledLogCentralizeds) {
        if (this.isFail(scheduledLogCentralizeds)) {}
    }

    @Override
    public void afterFailed(ScheduledLogCentralized scheduledLogCentralized) {
        if (this.isFail(scheduledLogCentralized)) {}
    }

    @Override
    public void afterSuccessedCollections(Collection<ScheduledLogCentralized> scheduledLogCentralizeds) {
        if (this.isSuccess(scheduledLogCentralizeds)) {}
    }

    @Override
    public void afterSuccessed(ScheduledLogCentralized scheduledLogCentralized) {
        if (this.isSuccess(scheduledLogCentralized)) {}
    }
}
