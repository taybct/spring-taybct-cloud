package io.github.taybct.admin.log.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.taybct.admin.log.domain.ApiLog;
import io.github.taybct.admin.log.dto.ApiLogQueryDTO;
import io.github.taybct.admin.log.service.IApiLogService;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.QueryBaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author XiJieYin <br> 2023/7/25 16:21
 */
@RestController
@Tag(name = "接口日志管理相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_ADMIN_LOG + "{version}/apiLog")
@ApiVersion
@RequiredArgsConstructor
public class ApiLogController implements QueryBaseController<ApiLog, IApiLogService, ApiLogQueryDTO> {

    final IApiLogService apiLogService;

    public IApiLogService getBaseService() {
        return this.apiLogService;
    }

    public String getResource() {
        return "";
    }

    /**
     * 获取分页
     *
     * @param dto            {@literal 请求参数}
     * @param sqlPageParams {@literal 分页参数}
     * @return {@code R<IPage < ? extends T>>}
     * @author xijieyin <br> 2022/8/4 18:36
     * @since 1.0.0
     */
    @Operation(summary = "获取分页")
    @PostMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends ApiLog>> page(@RequestBody ApiLogQueryDTO dto, SqlPageParams sqlPageParams) {
        return R.data(getBaseService().page(dto, sqlPageParams));
    }

    /**
     * 这里重写父方法是因为父方法默认新增操作是需要记录日志的，但是日志记录是需要记录是谁在操作的，也就是要知道当前登录的是谁，
     * 但是，如果是要记录登录日志的话，这个时候是还没有登录的，所以请求必定会报错，所以才有了这个重写，这里就不要再写日志了，
     * 因为自己就是日志控制器，自己不需要写自己的日志，使用这个接口的时候也是要注意，如果是登录日志请把 tenant id 设置到实体类
     *
     * @param domain 新增的对象
     * @return {@code R<ApiLog>}
     * @author xijieyin <br> 2022/8/4 18:25
     * @since 1.0.0
     */
    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @io.github.taybct.tool.core.annotation.ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends ApiLog> add(@Valid @NotNull @RequestBody ApiLog domain) {
        return getBaseService().save(domain) ? R.data(domain) : R.fail(String.format("新增%s失败！", getResource()));
    }

    /**
     * 清空日志
     *
     * @return R
     * @author xijieyin <br> 2022/8/4 18:45
     * @since 1.0.0
     */
    @Operation(summary = "清空日志")
    @DeleteMapping("all")
    public R<?> cleanAll() {
        return getBaseService().remove(Wrappers.lambdaQuery()) ? R.ok() : R.fail();
    }
}
