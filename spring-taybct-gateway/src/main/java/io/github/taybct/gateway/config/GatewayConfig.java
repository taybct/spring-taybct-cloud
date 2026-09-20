package io.github.taybct.gateway.config;

import cn.hutool.json.JSONUtil;
import com.alibaba.csp.sentinel.adapter.gateway.sc.SentinelGatewayFilter;
import com.alibaba.csp.sentinel.adapter.gateway.sc.exception.SentinelGatewayBlockExceptionHandler;
import io.github.taybct.gateway.handler.SentinelFallbackHandler;
import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.result.ResultCode;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerCodecConfigurer;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.web.reactive.result.view.ViewResolver;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

/**
 * 网关限流配置
 *
 * @author xijieyin <br> 2022/8/5 20:41
 * @since 1.0.0
 */
@AutoConfiguration
public class GatewayConfig {

    final List<ViewResolver> viewResolvers;
    final ServerCodecConfigurer serverCodecConfigurer;

    /**
     * 构造器
     */
    public GatewayConfig(ObjectProvider<List<ViewResolver>> viewResolversProvider,
                         ServerCodecConfigurer serverCodecConfigurer) {
        this.viewResolvers = viewResolversProvider.getIfAvailable(Collections::emptyList);
        this.serverCodecConfigurer = serverCodecConfigurer;
    }

    /**
     * 限流熔断（默认的处理方式，和 SentinelGatewayBlockExceptionHandler 互斥）
     */
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SentinelFallbackHandler sentinelGatewayExceptionHandler() {
        return new SentinelFallbackHandler();
    }

    /**
     * 限流过滤器
     */
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public GlobalFilter sentinelGatewayFilter() {
        return new SentinelGatewayFilter();
    }

    /**
     * 限流异常处理器
     */
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SentinelGatewayBlockExceptionHandler sentinelGatewayBlockExceptionHandler() {
        //使用重写后的自定义实现
        return new CustomSentinelGatewayBlockExceptionHandler(viewResolvers, serverCodecConfigurer);
    }
    /**
     * 自定义限流异常处理器，返回JSON
     */
    static class CustomSentinelGatewayBlockExceptionHandler extends SentinelGatewayBlockExceptionHandler {

        public CustomSentinelGatewayBlockExceptionHandler(List<ViewResolver> viewResolvers, ServerCodecConfigurer serverCodecConfigurer) {
            super(viewResolvers, serverCodecConfigurer);
        }

        @NotNull
        @Override
        public Mono<Void> handle(ServerWebExchange exchange, Throwable ex) {
            // 只有Sentinel限流异常才走自定义返回
            if (ex instanceof com.alibaba.csp.sentinel.slots.block.BlockException) {
                ServerHttpResponse response = exchange.getResponse();
                response.setStatusCode(HttpStatus.TOO_MANY_REQUESTS);
                response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
                String body = JSONUtil.toJsonStr(R.fail(ResultCode.GATEWAY_SENTINEL_BLOCK));
                DataBuffer buffer = response.bufferFactory().wrap(body.getBytes(StandardCharsets.UTF_8));
                return response.writeWith(Mono.just(buffer));
            }
            // 其他异常（503、404、服务不可用）交给父类原有逻辑
            return super.handle(exchange, ex);
        }
    }
}
