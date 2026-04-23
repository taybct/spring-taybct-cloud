package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.api.system.domain.SysMenu;
import io.github.taybct.api.system.dto.SysMenuQueryDTO;
import io.github.taybct.api.system.vo.RouterPerm;
import io.github.taybct.api.system.vo.RouterVO;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysMenuService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.QueryBaseController;
import io.github.taybct.tool.core.constant.OperateType;
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
 * 系统菜单相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:03
 * @see SysMenu
 * @see ISysMenuService
 * @since 1.0.0
 */
@Tag(name = "系统菜单相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/menu")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysMenuController implements QueryBaseController<SysMenu, ISysMenuService, SysMenuQueryDTO> {


    final ISysMenuService sysMenuService;

    @Override
    public ISysMenuService getBaseService() {
        return sysMenuService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysMenu>> page(@RequestParam(required = false) Map<String, Object> params) {
        return QueryBaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysMenu> detail(@NotNull @PathVariable Long id) {
        return QueryBaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysMenu> add(@Valid @NotNull @RequestBody SysMenu domain) {
        return QueryBaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysMenu> updateAllField(@Valid @NotNull @RequestBody SysMenu domain) {
        return QueryBaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysMenu> delete(@PathVariable Long id) {
        return QueryBaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysMenu> deleteBatch(@RequestParam Set<Long> id) {
        return QueryBaseController.super.deleteBatch(id);
    }

    /**
     * {@inheritDoc}<br>
     * 这个类获取的菜单列表会与登录的用户有关，和这个用户的角色有关，返回这个登录的
     * 用户的角色有被分配的菜单的列表
     *
     * @param sqlPageParams sql 查询参数
     * @return {@code R<List<SysMenu>>}
     * @author xijieyin <br> 2022/8/5 21:04
     * @since 1.0.0
     */
    @Operation(summary = "获取列表")
    @GetMapping("list")
    @WebLog
    @Override
    public R<List<? extends SysMenu>> list(@RequestParam(required = false) Map<String, Object> sqlPageParams) {
        return R.data(getBaseService().list(sqlPageParams));
    }

    /**
     * 获取路由（树状）
     *
     * @return {@code R<RouterVO>}
     * @author xijieyin <br> 2022/8/5 21:07
     * @since 1.0.0
     */
    @Operation(summary = "获取路由")
    @GetMapping("router")
    @WebLog
    public R<List<RouterVO>> router() {
        return R.data(TreeUtil.tree(getBaseService().loadRouterByRoleCode(), CollectionSortUtil.comparingAny(RouterVO::getSort), 0L));
    }

    /**
     * 获取用户权限
     *
     * @return {@code R<Set<RouterPerm>>}
     * @author xijieyin <br> 2022/8/5 21:07
     * @since 1.0.0
     */
    @Operation(summary = "获取用户权限")
    @GetMapping("perm")
    @WebLog
    public R<Set<RouterPerm>> perm() {
        return R.data(getBaseService().loadPermByRoleCode());
    }

}
