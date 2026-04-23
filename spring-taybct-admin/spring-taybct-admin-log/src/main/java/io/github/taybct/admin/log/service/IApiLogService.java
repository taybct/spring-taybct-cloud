package io.github.taybct.admin.log.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.github.taybct.admin.log.domain.ApiLog;
import io.github.taybct.admin.log.dto.ApiLogQueryDTO;
import io.github.taybct.tool.core.bean.service.IBaseService;
import io.github.taybct.tool.core.mybatis.support.SqlPageParams;

/**
 * 日志管理 Service
 *
 * @author xijieyin <br> 2022/8/4 19:21
 * @since 1.0.0
 */
public interface IApiLogService extends IBaseService<ApiLog> {

    IPage<? extends ApiLog> page(ApiLogQueryDTO dto, SqlPageParams sqlPageParams);

}
