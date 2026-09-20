package io.github.taybct.gateway.handler;

import io.github.taybct.tool.core.result.R;
import io.github.taybct.tool.core.result.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.boot.autoconfigure.web.WebProperties;
import org.springframework.boot.autoconfigure.web.reactive.error.AbstractErrorWebExceptionHandler;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.context.ApplicationContext;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerCodecConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.*;
import org.springframework.web.reactive.result.view.ViewResolver;
import reactor.core.publisher.Mono;

import java.util.Map;

/**
 * 网关统一异常处理
 *
 * @author xijieyin <br> 2022/8/5 20:50
 * @since 1.0.0
 */
@Order(-1)
@Component
@Slf4j
public class GatewayExceptionHandler extends AbstractErrorWebExceptionHandler {
    // 构造注入
    public GatewayExceptionHandler(ErrorAttributes errorAttributes,
                                   WebProperties webProperties,
                                   ObjectProvider<ViewResolver> viewResolvers,
                                   ServerCodecConfigurer serverCodecConfigurer,
                                   ApplicationContext applicationContext) {
        super(errorAttributes, webProperties.getResources(), applicationContext);
        setViewResolvers(viewResolvers.stream().toList());
        setMessageWriters(serverCodecConfigurer.getWriters());
        setMessageReaders(serverCodecConfigurer.getReaders());
    }

    @Override
    protected RouterFunction<ServerResponse> getRoutingFunction(ErrorAttributes errorAttributes) {
        return RouterFunctions.route(RequestPredicates.all(), this::renderErrorResponse);
    }

    private Mono<ServerResponse> renderErrorResponse(ServerRequest request) {
        Map<String, Object> errorPropertiesMap = getErrorAttributes(request, ErrorAttributeOptions.of(ErrorAttributeOptions.Include.MESSAGE
                , ErrorAttributeOptions.Include.EXCEPTION
                , ErrorAttributeOptions.Include.STACK_TRACE
                , ErrorAttributeOptions.Include.BINDING_ERRORS));
        int status = (int) errorPropertiesMap.getOrDefault("status", 500);
        String message = (String) errorPropertiesMap.getOrDefault("message", null);
        String trace = (String) errorPropertiesMap.getOrDefault("trace", null);

        log.trace("\r\n[网关异常处理] \r\n 请求路径:{} \r\n 异常信息:{} \r\n 堆栈信息:{}", request.exchange().getRequest().getPath(), message, trace);

        return ServerResponse.status(HttpStatus.valueOf(status))
                .contentType(MediaType.APPLICATION_JSON)
                .body(BodyInserters.fromValue(R.fail(ResultCode.GATEWAY_ERROR.getCode(), message)));
    }
}