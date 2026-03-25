package io.github.taybct.api.system.feign;

import io.github.taybct.api.system.domain.SysNotice;
import io.github.taybct.api.system.dto.SysNoticeDTO;
import io.github.taybct.api.system.feign.factory.NoticeFallbackFactory;
import io.github.taybct.common.constants.ServeConstants;
import io.github.taybct.tool.core.constant.AppConstants;
import io.github.taybct.tool.core.result.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * <pre>
 * 消息通知客户端
 * </pre>
 *
 * @author XiJieYin
 * @since 2025/8/21 18:04
 */
@FeignClient(primary = false, contextId = "noticeClient", value = ServeConstants.SERVE_ID_SYSTEM, fallbackFactory = NoticeFallbackFactory.class)
public interface INoticeClient {

    /**
     * 新增消息通知
     *
     * @param dto 通知数据传输对象
     * @return 新增结果
     */
    @PostMapping("v" + AppConstants.DEFAULT_API_VERSION + "/notice/relatedNotices")
    R<SysNotice> addRelatedNotices(@RequestBody SysNoticeDTO dto);

}
