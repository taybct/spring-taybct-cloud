package io.github.taybct.api.system.feign.factory;

import io.github.taybct.api.system.feign.INoticeClient;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.result.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.cloud.openfeign.FallbackFactory;

/**
 * <pre>
 * 消息通知回调（Sentinel）
 * </pre>
 *
 * @author XiJieYin
 * @since 2025/8/21 18:08
 */
@AutoConfiguration
@Slf4j
@ConditionalOnClass({FallbackFactory.class})
public class NoticeFallbackFactory implements FallbackFactory<INoticeClient> {
    @Override
    public INoticeClient create(Throwable cause) {
        log.error("系统模块 - INoticeClient 调用失败！", cause);
        return dto -> getR("添加消息通知失败！");
    }

    private <S> R<S> getR(String message) {
        log.error(message);
        return R.fail(ResultCode.FEIGN_ERROR.getCode(), message);
    }
}
