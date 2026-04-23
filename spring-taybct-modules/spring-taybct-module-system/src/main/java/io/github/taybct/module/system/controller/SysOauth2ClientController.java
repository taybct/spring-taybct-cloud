package io.github.taybct.module.system.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.taybct.api.system.domain.SysOauth2Client;
import io.github.taybct.api.system.dto.OAuth2ClientDTO;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.module.system.service.ISysOauth2ClientService;
import io.github.taybct.tool.core.annotation.ApiLog;
import io.github.taybct.tool.core.annotation.ApiVersion;
import io.github.taybct.tool.core.annotation.SafeConvert;
import io.github.taybct.tool.core.annotation.WebLog;
import io.github.taybct.tool.core.bean.controller.BaseController;
import io.github.taybct.tool.core.constant.OperateType;
import io.github.taybct.tool.core.enums.EntityType;
import io.github.taybct.tool.core.exception.def.BaseException;
import io.github.taybct.tool.core.result.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

/**
 * 客户端管理
 *
 * @author xijieyin <br> 2022/8/5 21:28
 * @see SysOauth2Client
 * @see ISysOauth2ClientService
 * @since 1.0.0
 */
@RequestMapping(ServeConstants.CONTEXT_PATH_SYSTEM + "{version}/oauth2Client")
@ApiVersion
@Tag(name = "客户端管理")
@RestController
@RequiredArgsConstructor
public class SysOauth2ClientController implements BaseController<SysOauth2Client, ISysOauth2ClientService> {

    final ISysOauth2ClientService sysOauth2ClientService;

    @Override
    public ISysOauth2ClientService getBaseService() {
        return sysOauth2ClientService;
    }

    @Operation(summary = "新增对象")
    @PostMapping
    @WebLog
    @ApiLog(title = "新增对象", description = "新增一条记录，并且在新增成功后返回这个新增的对象，这个对象会带着生成的 id 一起返回", type = OperateType.INSERT)
    @Override
    public R<? extends SysOauth2Client> add(@Valid @NotNull @RequestBody SysOauth2Client domain) {
        return BaseController.super.add(domain);
    }

    @Operation(summary = "根据 id 删除记录")
    @DeleteMapping("{id}")
    @WebLog
    @ApiLog(title = "根据 id 删除记录", description = "根据 id 删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysOauth2Client> delete(@PathVariable Long id) {
        return BaseController.super.delete(id);
    }

    @Operation(summary = "根据 id 批量删除记录")
    @DeleteMapping("batch")
    @WebLog
    @ApiLog(title = "根据 id 批量删除记录", description = "根据 id 批量删除记录", type = OperateType.DELETE)
    @Override
    public R<? extends SysOauth2Client> deleteBatch(@RequestParam Set<Long> id) {
        return BaseController.super.deleteBatch(id);
    }

    /**
     * 根据客户端 id 获取客户端信息
     *
     * @param clientId 客户端 id
     * @return {@code R<OAuth2ClientDTO>}
     * @author xijieyin <br> 2022/8/5 21:30
     * @since 1.0.0
     */
    @Operation(summary = "根据客户端 id 获取客户端信息")
    @PostMapping(value = "/clientId/{clientId}")
    public R<OAuth2ClientDTO> getOauth2ClientById(@PathVariable(value = "clientId") String clientId) {
        return Optional.ofNullable(getBaseService().getOne(
                        Wrappers.<SysOauth2Client>lambdaQuery().eq(SysOauth2Client::getClientId, clientId)))
                .map(client -> R.data(BeanUtil.copyProperties(client, OAuth2ClientDTO.class)))
                .orElseThrow(() -> new BaseException(String.format("未查询到客户端[%s]", clientId)));
    }

    /**
     * 查询客户端信息，这里不给直接给查看客户端密钥
     *
     * @param params 所有参数
     * @return {@code R<IPage<SysOauth2Client>>}
     * @author xijieyin <br> 2022/10/19 17:01
     * @since 1.0.5
     */
    @SafeConvert(safeOut = SysOauth2Client.class, resultType = EntityType.Page, ignoreOut = {"clientSecret"})
    @Override
    @Operation(summary = "获取分页")
    @GetMapping("page")
    @WebLog
    public R<IPage<? extends SysOauth2Client>> page(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.page(params);
    }

    @SafeConvert(safeOut = SysOauth2Client.class, resultType = EntityType.Page, ignoreOut = {"clientSecret"})
    @Override
    @Operation(summary = "获取列表")
    @GetMapping("list")
    @WebLog
    public R<List<? extends SysOauth2Client>> list(@RequestParam(required = false) Map<String, Object> params) {
        return BaseController.super.list(params);
    }

    @Operation(summary = "根据 id 查看详情")
    @GetMapping("{id}")
    @WebLog
    @SafeConvert(safeOut = SysOauth2Client.class, resultType = EntityType.Entity, ignoreOut = {"clientSecret"})
    @Override
    public R<? extends SysOauth2Client> detail(@NotNull @PathVariable Long id) {
        return BaseController.super.detail(id);
    }

    /**
     * 更新客户端，不能给他修改客户端 id
     *
     * @param domain 修改对象
     * @return {@code R<SysOauth2Client>}
     * @author xijieyin <br> 2022/10/19 16:57
     * @since 1.0.5
     */
    @Operation(summary = "根据 id 更新全部字段")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    @WebLog
    @ApiLog(title = "根据 id 更新全部字段", description = "根据 id 更新全部字段", type = OperateType.UPDATE)
    @SafeConvert(key = "domain", ignoreIn = {"clientSecret"})
    @Override
    public R<? extends SysOauth2Client> updateAllField(@Valid @NotNull @RequestBody SysOauth2Client domain) {
        return BaseController.super.updateAllField(domain);
    }

}
