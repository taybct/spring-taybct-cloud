package io.github.taybct.module.scheduling.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.scheduling.domain.ScheduledLog;
import io.github.taybct.module.scheduling.domain.ScheduledTask;
import io.github.taybct.module.scheduling.service.IScheduledLogService;
import io.github.taybct.module.scheduling.service.IScheduledTaskService;
import io.github.taybct.module.scheduling.vo.ScheduledTaskVO;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.scheduling.service.ISchedulingService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

/**
 * @author XiJieYin <br> 2023/7/26 11:14
 */
@RestController
@Tag(name = "任务调度相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SCHEDULING + "{version}/scheduling")
@ApiVersion
@RequiredArgsConstructor
public class ScheduledTaskController implements BaseController<ScheduledTask, IScheduledTaskService> {

    @Getter
    final IScheduledLogService scheduledLogService;

    @Getter
    final ISchedulingService schedulingService;

    final IScheduledTaskService scheduledTaskService;

    public IScheduledTaskService getBaseService() {
        return scheduledTaskService;
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends ScheduledTask> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends ScheduledTask> add(@Valid @NotNull @RequestBody ScheduledTask domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends ScheduledTask> updateAllField(@Valid @NotNull @RequestBody ScheduledTask domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends ScheduledTask> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends ScheduledTask> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    @Operation(summary = "获取分页(带启动状态)")
    @GetMapping("task/page")
    @WebLog
    public R<IPage<ScheduledTaskVO>> taskPage(@RequestParam(required = false) Map<String, Object> sqlPageParams) {
        return R.data(getBaseService().taskPage(sqlPageParams));
    }

    @Operation(summary = "尝试执行一次")
    @PostMapping("tryOnce/{key}")
    @WebLog
    public R<?> tryOnce(@PathVariable String key, @RequestBody Map<String, Object> params) {
        return R.data(schedulingService.tryOnce(key, params));
    }

    /**
     * 根据任务 key 启动任务
     */
    @Operation(summary = "根据任务 key 启动任务")
    @PutMapping("/start")
    @Parameters({
            @Parameter(name = "keySet", description = "任务 key", required = true, in = ParameterIn.QUERY)
    })
    public R<?> start(@RequestParam Set<String> keySet) {
        keySet.forEach(getSchedulingService()::start);
        return R.ok("任务启动指令已发送");
    }

    /**
     * 根据任务 key 停止任务
     */
    @Operation(summary = "根据任务 key 停止任务")
    @PutMapping("/stop")
    @Parameters({
            @Parameter(name = "keySet", description = "任务 key", required = true, in = ParameterIn.QUERY)
    })
    public R<?> stop(@RequestParam Set<String> keySet) {
        keySet.forEach(getSchedulingService()::stop);
        return R.ok("任务停止指令已发送");
    }

    /**
     * 根据任务 key 重启任务
     */
    @Operation(summary = "根据任务 key 重启任务")
    @PutMapping("/restart")
    @Parameters({
            @Parameter(name = "keySet", description = "任务 key", required = true, in = ParameterIn.QUERY)
    })
    public R<?> restart(@RequestParam Set<String> keySet) {
        keySet.forEach(getSchedulingService()::restart);
        return R.ok("任务重启指令已发送");
    }

    @Operation(summary = "获取日志分页")
    @GetMapping("log/page")
    @WebLog
    public R<IPage<ScheduledLog>> logPage(@RequestParam(required = false) Map<String, Object> sqlPageParams) {
        return R.data(getScheduledLogService().page(sqlPageParams));
    }

    @Operation(summary = "清空日志记录")
    @DeleteMapping("log/clear")
    @WebLog
    @ApiLog(title = "清空日志记录", description = "清空日志记录", type = OperateType.DELETE)
    public R<?> logClear() {
        return getScheduledLogService().remove(Wrappers.lambdaQuery()) ? R.ok("清空日志记录成功") : R.fail("清空日志记录失败");
    }

}
