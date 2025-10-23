package io.github.taybct.auth;

import io.github.taybct.tool.cloud.annotation.TayBctCloudConfig;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@TayBctCloudConfig
@SpringBootApplication
@EnableDubbo
// 指定要扫描的Mapper类的包的路径
@MapperScan({"io.github.taybct.**.mapper"})
public class AuthApplication {
    public static void main(String[] args) {

        SpringApplication.run(AuthApplication.class, args);

    }
}
