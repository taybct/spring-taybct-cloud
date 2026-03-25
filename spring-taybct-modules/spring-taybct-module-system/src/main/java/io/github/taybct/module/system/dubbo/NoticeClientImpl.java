package io.github.taybct.module.system.dubbo;

import io.github.taybct.api.system.domain.SysNotice;
import io.github.taybct.api.system.dto.SysNoticeDTO;
import io.github.taybct.api.system.feign.INoticeClient;
import io.github.taybct.module.system.service.ISysNoticeService;
import io.github.taybct.tool.core.result.R;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.ConfigCenterConfig;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;

/**
 * <pre>
 * 消息通知接口实现
 * </pre>
 *
 * @author XiJieYin
 * @since 2025/8/21 18:11
 */
@DubboService(protocol = "dubbo")
@RequiredArgsConstructor
@AutoConfiguration
@ConditionalOnClass(ConfigCenterConfig.class)
public class NoticeClientImpl implements INoticeClient {

    final ISysNoticeService sysNoticeService;

    @Override
    public R<SysNotice> addRelatedNotices(SysNoticeDTO dto) {
        return sysNoticeService.addRelatedNotices(dto.getSysNotice(), dto.getNoticeUsers()) ? R.data(dto.getSysNotice()) : R.fail("添加通知失败");
    }
}
