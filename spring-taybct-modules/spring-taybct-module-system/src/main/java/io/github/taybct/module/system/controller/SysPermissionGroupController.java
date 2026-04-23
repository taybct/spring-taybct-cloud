package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.api.system.domain.SysPermissionGroup;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysPermissionGroupService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

/**
 * 权限分组接口
 *
 * @author xijieyin <br> 2022/9/23 9:35
 * @see SysPermissionGroup
 * @see ISysPermissionGroupService
 * @since 1.0.4
 */
@Tag(name = "权限分组接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/permissionGroup")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysPermissionGroupController implements BaseController<SysPermissionGroup, ISysPermissionGroupService> {

    final ISysPermissionGroupService sysPermissionGroupService;

    @Override
    public ISysPermissionGroupService getBaseService() {
        return sysPermissionGroupService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysPermissionGroup>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysPermissionGroup> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysPermissionGroup> add(@Valid @NotNull @RequestBody SysPermissionGroup domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysPermissionGroup> updateAllField(@Valid @NotNull @RequestBody SysPermissionGroup domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysPermissionGroup> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysPermissionGroup> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }
}