package io.github.taybct.module.lf.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.module.lf.domain.Form;
import io.github.taybct.module.lf.domain.FormRelease;
import io.github.taybct.module.lf.dto.FormReleasePublishDTO;
import io.github.taybct.module.lf.dto.FormReleaseQueryDTO;
import io.github.taybct.module.lf.service.IFormReleaseService;
import io.github.taybct.module.lf.service.IFormService;
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

import java.util.Map;
import java.util.Set;

/**
 * @author XiJieYin <br> 2023/7/25 16:35
 */
@RestController
@Tag(name = "表单管理控制器")
@RequestMapping("{version}/form")
@ApiVersion
@RequiredArgsConstructor
public class FormController implements BaseController<Form, IFormService> {

    final IFormReleaseService formReleaseService;

    final IFormService formService;

    public IFormReleaseService getFormReleaseService() {
        return formReleaseService;
    }

    @Override
    public IFormService getBaseService() {
        return formService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends Form>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends Form> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends Form> add(@Valid @NotNull @RequestBody Form domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends Form> updateAllField(@Valid @NotNull @RequestBody Form domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends Form> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends Form> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    @Operation(summary = "发布表单")
    @PostMapping("release")
    @WebLog
    @ApiLog(title = "发布流程"
            , description = "每次发布的表单都会记录一个版本号", type = OperateType.INSERT)
    public R<FormReleasePublishDTO> publish(@Valid @NotNull @RequestBody FormReleasePublishDTO domain) {
        return getFormReleaseService().publish(domain) ? R.data(domain) : R.fail("发布失败！");
    }

    @Operation(summary = "查看发布表单列表")
    @PostMapping("release/publishList")
    @WebLog
    public R<IPage<? extends FormRelease>> publishList(@RequestBody FormReleaseQueryDTO dto, SqlPageParams sqlPageParams) {
        return R.data(getFormReleaseService().publishList(dto, sqlPageParams));
    }

    @Operation(summary = "发布表单详情")
    @GetMapping("release/{id}")
    @Parameter(name = "id", description = "发布 id", required = true, in = ParameterIn.PATH)
    public R<? extends FormRelease> releaseDetail(@PathVariable Long id) {
        return R.data(getFormReleaseService().customizeGetById(id));
    }

}
