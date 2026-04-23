package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.github.taybct.api.system.domain.SysRolePermission;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysRolePermissionService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色权限相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:24
 * @see SysRolePermission
 * @since 1.0.0
 */
@Tag(name = "角色权限相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/rolePerm")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class RolePermController {

    final ISysRolePermissionService sysRolePermissionService;

    public ISysRolePermissionService getSysRolePermissionService() {
        return sysRolePermissionService;
    }

    /**
     * 获取列表
     *
     * @param dto 请求参数
     * @return {@code R<List<SysRolePermission>>}
     * @author xijieyin <br> 2022/8/5 21:22
     * @since 1.0.0
     */
    @Operation(summary = "获取列表")
    @GetMapping("list")
    public R<List<SysRolePermission>> list(SysRolePermission dto) {
        return R.data(getSysRolePermissionService().list(new QueryWrapper<>(dto)));
    }

    /**
     * 批量保存对象
     *
     * @param domains   请求参数对象
     * @param primaryBy 根据哪个对象来操作，1是根据角色，其他是根据权限
     * @return {@code R<List<SysRolePermission>>}
     * @author xijieyin <br> 2022/8/5 21:23
     * @since 1.0.0
     */
    @Operation(summary = "批量保存对象")
    @PostMapping("batch")
    @ApiLog(title = "批量保存对象", description = "批量保存对象，并且在新增成功后一起返回", type = OperateType.INSERT
            , isSaveRequestData = false, isSaveResultData = false)
    @Parameter(name = "primaryBy", description = "根据哪个对象来操作，1是根据角色，其他是根据权限")
    public R<List<SysRolePermission>> saveBatch(@Valid @NotNull @RequestBody List<SysRolePermission> domains
            , @RequestParam Integer primaryBy) {
        return getSysRolePermissionService().saveBatch(domains, primaryBy) ? R.data(domains)
                : R.fail(String.format("批量保存%s失败！", "角色关联权限"));
    }

    /**
     * 清理角色权限脏数据
     *
     * @author xijieyin <br> 2022/8/5 21:26
     * @since 1.0.0
     */
    @Operation(summary = "清理角色权限脏数据")
    @PostMapping(value = "clearDirtyData")
    public void clearDirtyData() {
        // TODO 初始化角色权限配置后，可以配置角色有的权限，如果不配置权限有哪些角色，默认这个权限是开放的
        getSysRolePermissionService().clearDirtyData();
    }

    /**
     * 初始化角色权限配置
     *
     * @author xijieyin <br> 2022/8/5 21:27
     * @since 1.0.0
     */
    @Operation(summary = "初始化角色权限配置")
    @PostMapping(value = "iniConfig")
    public void iniConfig() {
        // TODO 初始化角色权限配置后，可以配置角色有的权限，如果不配置权限有哪些角色，默认这个权限是开放的
        getSysRolePermissionService().iniConfig();
    }
}
