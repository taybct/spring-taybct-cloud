package io.github.taybct.module.scheduling;

import feign.Logger;
import io.github.taybct.tool.cloud.annotation.TayBctCloudConfig;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;

/**
 * @author xijieyin <br> 2022/11/1 19:04
 * @since 1.1.0
 */
@TayBctCloudConfig
@SpringBootApplication
@EnableCaching
@EnableDubbo
// 指定要扫描的Mapper类的包的路径
@MapperScan({"io.github.taybct.**.mapper"})
public class SchedulingApplication {

    @Bean
    Logger.Level feignLoggerLevel() {
        return Logger.Level.FULL;
    }

    public static void main(String[] args) {
        SpringApplication.run(SchedulingApplication.class, args);
    }

}
