package io.github.taybct.module.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.api.system.domain.SysDict;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysDictService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
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
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 系统字典相关接口
 *
 * @author xijieyin <br> 2022/8/5 21:26
 * @see SysDict
 * @see ISysDictService
 * @since 1.0.0
 */
@Tag(name = "系统字典相关接口")
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/dict")
@ApiVersion
@RestController
@Slf4j
@RequiredArgsConstructor
public class SysDictController implements BaseController<SysDict, ISysDictService> {


    final ISysDictService sysDictService;

    @Override
    public ISysDictService getBaseService() {
        return sysDictService;
    }


    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    @Override
    public R<IPage<? extends SysDict>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @Override
    public R<? extends SysDict> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysDict> add(@Valid @NotNull @RequestBody SysDict domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @Override
    public R<? extends SysDict> updateAllField(@Valid @NotNull @RequestBody SysDict domain) {
        return BaseController.super.updateAllField(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysDict> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysDict> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    /**
     * 获取字典(多)
     *
     * @param dictCode 字段代码
     * @return R
     * @author xijieyin <br> 2022/8/5 21:26
     * @since 1.0.0
     */
    @Operation(summary = "获取字典(多)")
    @PostMapping("cache")
    @Parameters({
            @Parameter(name = "dictCode", description = "字典类型 [1,2,3...n]", required = true, in = ParameterIn.DEFAULT, example = "[1,2,3]")
    })
    public R<?> cache(@NotNull @RequestBody String[] dictCode) {
        Map<String, List<SysDict>> dictGroup = new LinkedHashMap<>();
        Arrays.stream(dictCode).forEach(code -> dictGroup.put(code, getBaseService().cache(code)));
        return R.data(dictGroup);
    }

    /**
     * 获取字典(单)
     *
     * @param dictCode 字典代码
     * @return R
     * @author xijieyin <br> 2022/8/5 21:27
     * @since 1.0.0
     */
    @Operation(summary = "获取字典(单)")
    @Parameters({
            @Parameter(name = "dictCode", description = "字典类型", required = true, in = ParameterIn.PATH)
    })
    @GetMapping("cache/{dictCode}")
    public R<?> cache(@NotNull @PathVariable String dictCode) {
        return R.data(getBaseService().cache(dictCode));
    }

    /**
     * 清除缓存
     *
     * @param dictCodes 需要删除的字典类型
     * @return 是否删除成功
     */
    @Operation(summary = "清除缓存")
    @DeleteMapping("cache")
    public R<?> cleanCache(@Nullable @RequestBody Set<String> dictCodes) {
        return R.data(getBaseService().cleanCache(dictCodes));
    }
}
