package io.github.taybct.admin.log.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.github.taybct.admin.log.service.IScheduledLogCentralizedService;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.tool.scheduledlogcentralized.dto.ScheduledLogCentralizedQueryDTO;
import io.github.taybct.tool.scheduledlogcentralized.entity.ScheduledLogCentralized;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Tag(name = "定时任务日志管理控制器")
@RestController
@RequestMapping(ServeConstants.SCHEDULED_LOG_CENTRALIZED + "{version}/log")
@RequiredArgsConstructor
@ApiVersion
public class ScheduledLogCentralizedController {
    private final IScheduledLogCentralizedService scheduledLogCentralizedService;

    /**
     * 获取分页
     *
     * @param queryParams            {@literal 请求参数}
     * @param sqlPageParams {@literal 分页参数}
     * @return {@code R<IPage < ? extends T>>}
     * @author xijieyin <br> 2022/8/4 18:36
     * @since 1.0.0
     */
    @Operation(summary = "获取分页")
    @PostMapping("page")
    @WebLog
    public R<IPage<? extends ScheduledLogCentralized>> page(@RequestBody ScheduledLogCentralizedQueryDTO queryParams, SqlPageParams sqlPageParams) {
        Page<ScheduledLogCentralized> pageData = scheduledLogCentralizedService.getPage(sqlPageParams,queryParams);
        return R.data(pageData);
    }
}
