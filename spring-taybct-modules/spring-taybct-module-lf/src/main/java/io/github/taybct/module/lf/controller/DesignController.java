package io.github.taybct.module.lf.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.module.lf.domain.Design;
import io.github.taybct.module.lf.domain.DesignPermissions;
import io.github.taybct.module.lf.service.IDesignPermissionsService;
import io.github.taybct.module.lf.service.IDesignService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author XiJieYin <br> 2023/7/25 16:34
 */
@RestController
@Tag(name = "流程图设计控制器")
@RequestMapping("{version}/design")
@ApiVersion
@RequiredArgsConstructor
public class DesignController implements BaseController<Design, IDesignService> {

    final IDesignPermissionsService designPermissionsService;

    final IDesignService designService;

    public IDesignPermissionsService getDesignPermissionsService() {
        return designPermissionsService;
    }

    @Override
    public IDesignService getBaseService() {
        return designService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends Design>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends Design> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends Design> add(@Valid @NotNull @RequestBody Design domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends Design> updateAllField(@Valid @NotNull @RequestBody Design domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends Design> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends Design> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    @Operation(tags = "分享流程图操作"
            , summary = "分享流程图操作"
            , description = "其实也就是让谁来可以操作这个流程图设计，有对应的可以操作的权限可以分配")
    @PostMapping("share")
    @WebLog
    @ApiLog(title = "分享流程图操作"
            , description = "把操作流程图的权限分享分配给其他用户或者指定的部门的所有人", type = OperateType.INSERT)
    public R<List<DesignPermissions>> shareDesign(@RequestBody List<DesignPermissions> list) {
        return getDesignPermissionsService().shareDesign(list) ? R.ok() : R.fail("操作失败！");
    }

    @Operation(tags = "查看当前流程图的权限分配"
            , summary = "查看当前流程图的权限分配"
            , description = "查看当前流程图的权限分配")
    @GetMapping("permissions/{designId}")
    @WebLog
    @Parameter(name = "designId", description = "设计 id", required = true, in = ParameterIn.PATH)
    public R<List<DesignPermissions>> getPermissions(@PathVariable Long designId, SqlPageParams sqlPageParams) {
        return R.data(getDesignPermissionsService().getPermissions(designId, null, sqlPageParams));
    }

}
