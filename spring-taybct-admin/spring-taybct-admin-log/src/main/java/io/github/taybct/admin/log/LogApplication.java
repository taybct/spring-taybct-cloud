package io.github.taybct.admin.log;

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
// 指定要扫描的Mapper类的包的路径
@MapperScan({"io.github.taybct.**.mapper"})
public class LogApplication {

    @Bean
    Logger.Level feignLoggerLevel() {
        return Logger.Level.FULL;
    }

    public static void main(String[] args) {
        SpringApplication.run(LogApplication.class, args);
    }
}
