package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.taybct.api.system.domain.SysTenant;
import io.github.taybct.api.system.domain.SysUserTenant;
import io.github.taybct.common.constants.CacheConstants;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysTenantService;
import io.github.taybct.module.system.service.ISysUserOnlineService;
import io.github.taybct.module.system.service.ISysUserTenantService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.ISecurityUtil;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.ISysParamsObtainService;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 租户相关接口
 *
 * @author xijieyin <br> 2022/8/17 10:29
 * @see SysTenant
 * @see io.github.taybct.tool.core.bean.controller.BaseController
 * @see ISysTenantService
 * @since 1.0.1
 */
@Tag(name = "租户相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/tenant")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysTenantController implements BaseController<SysTenant, ISysTenantService> {

    final ISysUserOnlineService sysUserOnlineService;

    final ISysUserTenantService sysUserTenantService;

    final ISysParamsObtainService sysParamsObtainService;

    final ISecurityUtil securityUtil;

    final ISysTenantService sysTenantService;

    public ISysUserOnlineService getSysUserOnlineService() {
        return sysUserOnlineService;
    }

    public ISysUserTenantService getSysUserTenantService() {
        return sysUserTenantService;
    }

    public ISysParamsObtainService getSysParamsObtainService() {
        return sysParamsObtainService;
    }

    public ISecurityUtil getSecurityUtil() {
        return securityUtil;
    }

    @Override
    public ISysTenantService getBaseService() {
        return sysTenantService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysTenant>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "获取列表")
    @GetMapping("list")
    @WebLog
    @Override
    public R<List<? extends SysTenant>> list(Map<String, Object> params) {
        return BaseController.super.list(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysTenant> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysTenant> add(@Valid @NotNull @RequestBody SysTenant domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysTenant> updateAllField(@Valid @NotNull @RequestBody SysTenant domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysTenant> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysTenant> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    @Operation(summary = "为用户分配租户")
    @PostMapping("user")
    @WebLog
    @ApiLog(title = "为用户分配租户", description = "为用户分配租户，并且在新增成功后一起返回", type = OperateType.INSERT
            , isSaveRequestData = false, isSaveResultData = false)
    @Parameter(name = "primaryBy", description = "根据哪个对象来操作，1是根据用户，其他是根据租户")
    public R<Collection<SysUserTenant>> addUserTenant(@Valid @NotNull @RequestBody Collection<SysUserTenant> domains
            , @RequestParam Integer primaryBy) {
        return getSysUserTenantService().saveBatch(domains, primaryBy) ? R.data(domains) : R.fail(String.format("为用户分配租户%s失败！", getResource()));
    }

    @Operation(summary = "获取当前登录用户拥有的租户")
    @GetMapping(value = "user")
    public R<List<SysTenant>> listUserTenant() {
        return Optional.ofNullable(getBaseService()
                        .listUserTenant()).map(R::data)
                .orElseGet(() -> R.data(Collections.singletonList(SysTenant
                        .defaultTenant(getSysParamsObtainService().get(CacheConstants.Params.TENANT_ID)))));
    }

    @Operation(summary = "获取指定用户拥有的租户")
    @GetMapping(value = "user/{userId}")
    public R<List<SysUserTenant>> listUserTenant(@PathVariable Long userId) {
        return R.data(getSysUserTenantService().list(Wrappers.<SysUserTenant>lambdaQuery().eq(SysUserTenant::getUserId, userId)));
    }

    @Operation(summary = "用户选择租户")
    @Parameters({
            @Parameter(name = "tenantId", description = "租户id", required = true, in = ParameterIn.PATH, example = "000000")
    })
    @PostMapping(value = "user/{tenantId}")
    public R<?> chooseTenant(@NotNull @PathVariable String tenantId) {
        return getSysUserOnlineService().chooseTenant(tenantId) ? R.ok("操作成功！") : R.fail("操作失败！");
    }

    @Operation(summary = "获取当前用户的租户")
    @GetMapping(value = "current")
    public R<SysTenant> currentTenant() {
        return R.data(getBaseService().getOne(Wrappers.<SysTenant>lambdaQuery().eq(SysTenant::getTenantId, getSecurityUtil().getLoginUser().getTenantId())));
    }

}
