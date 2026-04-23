package io.github.taybct.module.system.service.impl;

import io.github.taybct.api.system.domain.SysTenant;
import io.github.taybct.api.system.mapper.SysTenantMapper;
import io.github.taybct.common.constants.CacheConstants;
import io.github.taybct.module.system.service.ISysTenantService;
import io.github.taybct.tool.core.bean.ILoginUser;
import io.github.taybct.tool.core.bean.service.BaseServiceImpl;
import io.github.taybct.tool.core.constant.ISysParamsObtainService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

/**
 * @author xijieyin
 */
@AutoConfiguration
@Service
@RequiredArgsConstructor
public class SysTenantServiceImpl extends BaseServiceImpl<SysTenantMapper, SysTenant>
        implements ISysTenantService {

    final ISysParamsObtainService sysParamsObtainService;

    @Override
    public boolean save(SysTenant entity) {
        return super.save(entity);
    }

    @Override
    public boolean saveBatch(Collection<SysTenant> entityList) {
        return super.saveBatch(entityList);
    }

    @Override
    public List<SysTenant> listUserTenant() {
        ILoginUser loginUser = securityUtil.getLoginUser();
        Long userId = loginUser.getUserId();
        return getBaseMapper().listUserTenant(userId
                , sysParamsObtainService.get(CacheConstants.Params.TENANT_ID)
                , checkRoot());
    }

}




