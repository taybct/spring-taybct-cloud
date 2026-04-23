package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.api.system.domain.SysPermission;
import io.github.taybct.api.system.vo.PermissionGroupVO;
import io.github.taybct.api.system.vo.PermissionVO;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysPermissionService;
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

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 菜单权限相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:19
 * @see SysPermission
 * @see ISysPermissionService
 * @since 1.0.0
 */
@Tag(name = "菜单权限相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/permission")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysPermissionController implements BaseController<SysPermission, ISysPermissionService> {

    final ISysPermissionService sysPermissionService;

    @Override
    public ISysPermissionService getBaseService() {
        return sysPermissionService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysPermission>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysPermission> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysPermission> add(@Valid @NotNull @RequestBody SysPermission domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysPermission> updateAllField(@Valid @NotNull @RequestBody SysPermission domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysPermission> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysPermission> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    /**
     * 获取列表带菜单名
     *
     * @param dto {@literal 请求参数}
     * @return {@code R<List < PermissionVO>>}
     * @author xijieyin <br> 2022/9/21 10:04
     * @since 1.0.4
     */
    @Operation(summary = "获取列表带菜单名")
    @GetMapping("listWithMenu")
    @WebLog
    public R<List<PermissionVO>> listWithMenu(SysPermission dto) {
        return R.data(getBaseService().listWithMenu(dto));
    }

    /**
     * 获取列表按菜单分组
     *
     * @param dto {@literal 请求参数}
     * @return {@code R<List < PermissionVO>>}
     * @author xijieyin <br> 2022/9/21 10:05
     * @since 1.0.4
     */
    @Operation(summary = "获取列表按菜单分组")
    @GetMapping("listGroupWithMenu")
    @WebLog
    public R<List<PermissionGroupVO>> listGroupWithMenu(SysPermission dto) {
        return R.data(getBaseService().listGroupWithMenu(dto));
    }

    /**
     * 获取分页(返回菜单信息)
     *
     * @param sqlPageParams {@literal sql 查询参数}
     * @return {@code R<IPage < PermissionVO>>}
     * @author xijieyin <br> 2022/8/5 21:19
     * @since 1.0.0
     */
    @Operation(summary = "获取分页(返回菜单信息)")
    @GetMapping("pageWithMenu")
    @WebLog
    public R<IPage<PermissionVO>> pageWithMenu(@RequestParam(required = false) Map<String, Object> sqlPageParams) {
        return R.data(getBaseService().pageWithMenu(sqlPageParams));
    }
}
