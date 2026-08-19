package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.api.system.domain.SysParams;
import io.github.taybct.api.system.vo.SysParamsVO;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysParamsService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.SafeConvert;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.enums.EntityType;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * 系统参数相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:31
 * @see SysParams
 * @see ISysParamsService
 * @since 1.0.0
 */
@Tag(name = "系统参数相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/params")
@ApiVersion
@RestController
@RequiredArgsConstructor
public class SysParamsController implements BaseController<SysParams, ISysParamsService> {

    final ISysParamsService sysParamsService;

    @Override
    public ISysParamsService getBaseService() {
        return sysParamsService;
    }

    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    @SafeConvert(safeOut = SysParamsVO.class, resultType = EntityType.Page)
    public R<IPage<? extends SysParams>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysParams> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysParams> add(@Valid @NotNull @RequestBody SysParams domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysParams> updateAllField(@Valid @NotNull @RequestBody SysParams domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysParams> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysParams> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    /**
     * 获取系统参数(多)
     *
     * @param paramsKey 参数键
     * @return R
     * @author xijieyin <br> 2022/8/5 21:31
     * @since 1.0.0
     */
    @Operation(summary = "获取系统参数(多)")
    @PostMapping("cache")
    @Parameters({
            @Parameter(name = "paramsKey", description = "参数键 [1,2,3...n]", required = true, in = ParameterIn.DEFAULT, example = "[1,2,3]")
    })
    public R<?> cache(@NotNull @RequestBody String[] paramsKey) {
        Map<String, String> paramsGroup = new LinkedHashMap<>();
        Arrays.stream(paramsKey).forEach(key -> paramsGroup.put(key, getBaseService().cache(key)));
        return R.data(paramsGroup);
    }

    /**
     * 获取系统参数(单)
     *
     * @param paramsKey 参数键
     * @return R
     * @author xijieyin <br> 2022/8/5 21:31
     * @since 1.0.0
     */
    @Operation(summary = "获取系统参数(单)")
    @Parameters({
            @Parameter(name = "paramsKey", description = "参数键", required = true, in = ParameterIn.PATH)
    })
    @GetMapping("cache/{paramsKey}")
    public R<?> cache(@NotNull @PathVariable String paramsKey) {
        return R.data(getBaseService().cache(paramsKey));
    }

    /**
     * 清除缓存
     *
     * @param paramsKeySet 需要删除的参数 key
     * @return 是否删除成功
     */
    @Operation(summary = "清除缓存")
    @DeleteMapping("cache")
    public R<?> cleanCache(@Nullable @RequestBody Set<String> paramsKeySet) {
        return R.data(getBaseService().cleanCache(paramsKeySet));
    }
}
