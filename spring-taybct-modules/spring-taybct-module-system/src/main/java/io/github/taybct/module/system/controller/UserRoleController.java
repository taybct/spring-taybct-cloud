package io.github.taybct.module.system.controller;

import com.alibaba.fastjson2.JSONObject;
import io.github.taybct.api.system.domain.SysUserRole;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysUserRoleService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 系统用户角色关联相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:42
 * @since 1.0.0
 */
@Tag(name = "系统用户角色关联相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/userRole")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class UserRoleController {

    final ISysUserRoleService sysUserRoleService;

    public ISysUserRoleService getSysUserRoleService() {
        return sysUserRoleService;
    }

    /**
     * 获取列表
     *
     * @param sqlPageParams {@literal sql 查询参数}
     * @return {@code R<List<SysUserRole>>}
     * @author xijieyin <br> 2022/8/5 21:43
     * @since 1.0.0
     */
    @Operation(summary = "获取列表")
    @GetMapping("list")
    @WebLog
    public R<List<SysUserRole>> list(@RequestParam(required = false) Map<String, Object> sqlPageParams) {
        return R.data(getSysUserRoleService().list(SqlPageParams.of(sqlPageParams).allowedSort(SysUserRole.class)
                .genQueryWrapper(JSONObject.parseObject(JSONObject.toJSONString(sqlPageParams)).toJavaObject(SysUserRole.class))));
    }

    /**
     * 批量保存对象
     *
     * @param domains 请求参数对象
     * @return {@code R<List < SysUserRole>>}
     * @author xijieyin <br> 2022/8/5 21:43
     * @since 1.0.0
     */
    @Operation(summary = "批量保存对象")
    @PostMapping("batch")
    @ApiLog(title = "批量保存对象", description = "批量保存对象，并且在新增成功后一起返回", type = OperateType.INSERT, isSaveRequestData = false, isSaveResultData = false)
    public R<List<SysUserRole>> saveBatch(@Valid @NotNull @RequestBody List<SysUserRole> domains) {
        return getSysUserRoleService().saveBatch(domains) ? R.data(domains) : R.fail(String.format("批量保存%s失败！", "用户关联角色"));
    }
}
