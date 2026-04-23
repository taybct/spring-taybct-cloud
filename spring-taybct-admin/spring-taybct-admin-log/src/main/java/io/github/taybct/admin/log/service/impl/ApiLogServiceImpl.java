package io.github.taybct.admin.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.taybct.admin.log.domain.ApiLog;
import io.github.taybct.admin.log.dto.ApiLogQueryDTO;
import io.github.taybct.admin.log.mapper.ApiLogMapper;
import io.github.taybct.admin.log.service.IApiLogService;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * {@inheritDoc}
 * <p>
 * 这里不要实现 BaseServiceImpl 因为有默认的更新人，这样的操作，日志也有登录日志，刚登录的时候是没有用户信息的，所以不要实现
 *
 * @author xijieyin <br> 2022/8/4 19:22
 * @since 1.0.0
 */
@AutoConfiguration
@Service
public class ApiLogServiceImpl extends ServiceImpl<ApiLogMapper, ApiLog>
        implements IApiLogService {

    @Override
    public IPage<? extends ApiLog> page(ApiLogQueryDTO dto, SqlPageParams sqlPageParams) {
        sqlPageParams.allowedSort(ApiLog.class);
        Page<ApiLog> page = sqlPageParams.genPage();
        QueryWrapper<ApiLog> apiLogWrapper = new QueryWrapper<>(dto);
        LambdaQueryWrapper<ApiLog> logLambdaQueryWrapper = apiLogWrapper.lambda();
        // 开始时间
        Optional.ofNullable(dto.getStartTime())
                .ifPresent(timeBegin -> logLambdaQueryWrapper.ge(ApiLog::getCreateTime, timeBegin));
        // 结束时间
        Optional.ofNullable(dto.getEndTime())
                .ifPresent(timeEnd -> logLambdaQueryWrapper.le(ApiLog::getCreateTime, timeEnd));
        return page(page, logLambdaQueryWrapper);
    }
}




