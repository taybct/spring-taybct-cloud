package io.github.taybct.admin.log.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.taybct.admin.log.mapper.ScheduledLogCentralizedMapper;
import io.github.taybct.admin.log.service.IScheduledLogCentralizedService;
import io.github.taybct.tool.scheduledlogcentralized.dto.ScheduledLogCentralizedQueryDTO;
import io.github.taybct.tool.scheduledlogcentralized.entity.ScheduledLogCentralized;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@AutoConfiguration
@Service
@RequiredArgsConstructor
public class ScheduledLogCentralizedServiceImpl extends ServiceImpl<ScheduledLogCentralizedMapper, ScheduledLogCentralized>
        implements IScheduledLogCentralizedService {

    @Override
    public Page<ScheduledLogCentralized> getPage(SqlPageParams sqlPageParams, ScheduledLogCentralizedQueryDTO queryParams) {
        sqlPageParams.allowedSort(ScheduledLogCentralized.class);
        Page<ScheduledLogCentralized> pageParams = sqlPageParams.genPage();
        Long total = baseMapper.pageDataCount(queryParams);
        if (total > 0) {
            List<ScheduledLogCentralized> pageData = baseMapper.getPageData(queryParams,
                    Optional.of(pageParams.getCurrent()).map(c -> (c - 1) * pageParams.getSize()).orElse(null),
                    pageParams.getSize());
            pageParams.setRecords(pageData);
            pageParams.setTotal(total);
        }
        return pageParams;
    }
}




