package io.github.taybct.module.system.controller;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.github.taybct.api.system.domain.SysDept;
import io.github.taybct.api.system.domain.SysRoleDept;
import io.github.taybct.api.system.domain.SysUserDept;
import io.github.taybct.api.system.dto.SysDeptQueryDTO;
import io.github.taybct.api.system.vo.DeptUserTreeVO;
import io.github.taybct.api.system.vo.SysDeptTreeVO;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysDeptService;
import io.github.taybct.module.system.service.ISysRoleDeptService;
import io.github.taybct.module.system.service.ISysUserDeptService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.QueryBaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.util.CollectionSortUtil;
import io.github.taybct.tool.core.util.tree.TreeUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 部门控制器
 *
 * @author XiJieYin <br> 2023/6/8 14:07
 */
@Tag(name = "部门相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/dept")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysDeptController implements QueryBaseController<SysDept, ISysDeptService, SysDeptQueryDTO> {

    final ISysUserDeptService sysUserDeptService;

    final ISysRoleDeptService sysRoleDeptService;

    final ISysDeptService sysDeptService;

    public ISysUserDeptService getSysUserDeptService() {
        return sysUserDeptService;
    }

    public ISysRoleDeptService getSysRoleDeptService() {
        return sysRoleDeptService;
    }

    @Override
    public ISysDeptService getBaseService() {
        return sysDeptService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysDept>> page(@RequestParam(required = false) Map<String, Object> params) {
        return QueryBaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysDept> detail(@NotNull @PathVariable Long id) {
        return QueryBaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysDept> add(@Valid @NotNull @RequestBody SysDept domain) {
        return QueryBaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysDept> updateAllField(@Valid @NotNull @RequestBody SysDept domain) {
        return QueryBaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysDept> delete(@PathVariable Long id) {
        return QueryBaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysDept> deleteBatch(@RequestParam Set<Long> id) {
        return QueryBaseController.super.deleteBatch(id);
    }

    @Operation(summary = "获取列表")
    @GetMapping("list")
    @WebLog
    @Override
    public R<List<? extends SysDept>> list(@RequestParam(required = false) Map<String, Object> params) {
        if (!params.containsKey("pageSize")) {
            // 如果没有指定分页大小，这里默认给1000
            params.put("pageSize", 1000L);
        }
        return QueryBaseController.super.list(params);
    }

    /**
     * 获取树信息
     *
     * @return 树信息
     * @author xijieyin
     */
    @Operation(summary = "获取树")
    @PostMapping("tree")
    @WebLog
    public R<List<SysDeptTreeVO>> tree(@RequestBody SysDeptQueryDTO dto) {
        return R.data(TreeUtil.tree(getBaseService().tree(dto), CollectionSortUtil.comparingAny(SysDept::getSort), dto.getParentId()));
    }

    @Override
    @Operation(summary = "获取分页")
    @PostMapping("page")
    @WebLog
    public R<IPage<? extends SysDept>> page(@RequestBody SysDeptQueryDTO dto, SqlPageParams pageParams) {
        pageParams.allowedSort(SysDept.class);
        return R.data(getBaseService().page(dto, pageParams.genPage(), pageParams));
    }

    @Operation(summary = "获取列表")
    @PostMapping("list")
    @WebLog
    @Override
    public R<List<? extends SysDept>> list(@RequestBody SysDeptQueryDTO dto, SqlPageParams pageParams) {
        pageParams.allowedSort(SysDept.class);
        Page<SysDept> page = pageParams.genPage();
        // 不查询 count
        page.setSearchCount(false);
        return R.data(getBaseService().page(dto, page, pageParams).getRecords());
    }

    @Operation(summary = "部门和用户一起的树(条件查询)")
    @WebLog
    @PostMapping("deptUserTreeByCondition")
    public R<List<DeptUserTreeVO>> deptUserTreeByCondition(@RequestBody JSONObject dto
            , @RequestParam(required = false, defaultValue = "true") Boolean makeTree
            , @RequestParam(required = false, defaultValue = "true") Boolean includeUser) {
        return R.data(getBaseService().deptUserTreeByCondition(dto, makeTree, includeUser));
    }

    @Operation(summary = "部门和用户一起的树")
    @WebLog
    @PostMapping("deptUserTree")
    public R<List<DeptUserTreeVO>> deptUserTree(@RequestBody Set<Long> deptIdSet
            , @RequestParam(required = false, defaultValue = "true") Boolean makeTree
            , @RequestParam(required = false, defaultValue = "true") Boolean includeUser) {
        return R.data(getBaseService().deptUserTree(deptIdSet, makeTree, includeUser));
    }

    @Operation(summary = "获取用户与部门关联的列表")
    @PostMapping("user")
    @WebLog
    public R<List<SysUserDept>> getUserDept(@RequestBody SysUserDept dto, SqlPageParams sqlPageParams) {
        sqlPageParams.allowedSort(SysUserDept.class);
        Page<SysUserDept> page = sqlPageParams.genPage();
        // 这里不查询页数
        page.setSearchCount(false);
        return R.data(getSysUserDeptService().page(page, sqlPageParams.genQueryWrapper(dto)).getRecords());
    }

    @Operation(summary = "更新用户与部门关联的列表")
    @PutMapping("user")
    @WebLog
    public R<?> updateUserDept(@RequestBody Set<SysUserDept> entityList) {
        return getSysUserDeptService().updateUserDept(entityList) ? R.ok("关联成功") : R.data("关联失败！");
    }

    @Operation(summary = "获取角色与部门关联的列表")
    @PostMapping("role")
    @WebLog
    public R<List<SysRoleDept>> getRoleDept(@RequestBody SysRoleDept dto, SqlPageParams sqlPageParams) {
        sqlPageParams.allowedSort(SysRoleDept.class);
        Page<SysRoleDept> page = sqlPageParams.genPage();
        // 这里不查询页数
        page.setSearchCount(false);
        return R.data(getSysRoleDeptService().page(page, sqlPageParams.genQueryWrapper(dto)).getRecords());
    }

    @Operation(summary = "更新角色与部门关联的列表")
    @PutMapping("role")
    @WebLog
    public R<?> updateRoleDept(@RequestBody Set<SysRoleDept> entityList) {
        return getSysRoleDeptService().updateRoleDept(entityList) ? R.ok("关联成功") : R.data("关联失败！");
    }
}
