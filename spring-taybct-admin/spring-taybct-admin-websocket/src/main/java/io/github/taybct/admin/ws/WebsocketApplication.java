package io.github.taybct.admin.ws;

import feign.Logger;
import io.github.taybct.tool.cloud.annotation.TayBctCloudConfig;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/**
 * @author xijieyin
 * <br> 2021/12/11 16:58
 */
@TayBctCloudConfig
@SpringBootApplication
@EnableDubbo
@MapperScan({"io.github.taybct.**.mapper"})
public class WebsocketApplication {

    @Bean
    Logger.Level feignLoggerLevel() {
        return Logger.Level.FULL;
    }

    public static void main(String[] args) {
        SpringApplication.run(WebsocketApplication.class, args);
    }
}
