package io.github.taybct.gateway.handler;

import cn.hutool.captcha.*;
import cn.hutool.core.util.IdUtil;
import io.github.taybct.common.constants.CacheConstants;
import io.github.taybct.common.constants.CaptchaConstants;
import io.github.taybct.common.constants.CaptchaType;
import io.github.taybct.tool.core.constant.ISysParamsObtainService;
import io.github.taybct.tool.core.result.R;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 验证码生成器
 *
 * @author xijieyin <br> 2022/8/5 20:50
 * @since 1.0.0
 */
@Slf4j
@AutoConfiguration
@RequiredArgsConstructor
public class CaptchaHandler implements HandlerFunction<ServerResponse> {

    final StringRedisTemplate redisTemplate;
    final ISysParamsObtainService sysParamsObtainService;

    @Override
    public Mono<ServerResponse> handle(ServerRequest serverRequest) {
        // 验证码类型
        String captchaType = sysParamsObtainService.get(CacheConstants.Params.CAPTCHA_TYPE);
        AbstractCaptcha captcha;
        if (captchaType != null) {
            if (captchaType.equalsIgnoreCase(CaptchaType.CIRCLE)) {
                captcha = new CircleCaptcha(130, 48, 5);
            } else if (captchaType.equalsIgnoreCase(CaptchaType.LINE)) {
                captcha = new LineCaptcha(130, 48, 5, 5);
            } else if (captchaType.equalsIgnoreCase(CaptchaType.SHEAR)) {
                captcha = new ShearCaptcha(130, 48, 5);
            } else {
                captcha = new GifCaptcha(130, 48, 5);
            }
        } else {
            captcha = new GifCaptcha(130, 48, 5);
        }
        String code = captcha.getCode();
        String uuid = IdUtil.simpleUUID();
        redisTemplate.opsForValue().set(CacheConstants.Captcha.KEY + uuid, code, 60 * 5, TimeUnit.SECONDS);
        Map<String, String> result = new HashMap<>();
        result.put(CaptchaConstants.CAPTCHA_UUID_KEY, uuid);
        result.put(CaptchaConstants.CAPTCHA_IMG_KEY, captcha.getImageBase64());
        log.debug("生成了验证码：" + code);
        log.debug("uuid：" + uuid);
        return ServerResponse.status(HttpStatus.OK).body(BodyInserters.fromValue(R.data(result)));
    }
}
