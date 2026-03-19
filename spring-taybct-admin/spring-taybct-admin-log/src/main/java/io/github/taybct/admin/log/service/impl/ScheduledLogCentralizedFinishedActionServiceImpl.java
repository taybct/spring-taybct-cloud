package io.github.taybct.admin.log.service.impl;

import io.github.taybct.scheduledLogCentralized.service.IScheduledLogCentralizedFinishedActionService;
import io.github.taybct.scheduledLogCentralized.service.entity.ScheduledLogCentralized;

import java.util.Collection;

public class ScheduledLogCentralizedFinishedActionServiceImpl implements IScheduledLogCentralizedFinishedActionService {
    @Override
    public void atferFailedCollections(Collection<ScheduledLogCentralized> scheduledLogCentralizeds) {
        if (this.isFail(scheduledLogCentralizeds)) {}
    }

    @Override
    public void atferFailed(ScheduledLogCentralized scheduledLogCentralized) {
        if (this.isFail(scheduledLogCentralized)) {}
    }

    @Override
    public void atferSuccessedCollections(Collection<ScheduledLogCentralized> scheduledLogCentralizeds) {
        if (this.isSuccess(scheduledLogCentralizeds)) {}
    }

    @Override
    public void atferSuccessed(ScheduledLogCentralized scheduledLogCentralized) {
        if (this.isSuccess(scheduledLogCentralized)) {}
    }
}
