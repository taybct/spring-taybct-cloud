package io.github.taybct.module.od;

import io.github.taybct.tool.cloud.annotation.TayBctCloudConfig;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * 启动类
 *
 * @author xijieyin
 */
@TayBctCloudConfig
@SpringBootApplication
@Slf4j
@EnableCaching
// 指定要扫描的Mapper类的包的路径
@MapperScan({"io.github.taybct.**.mapper"})
public class OnlineDocApplication {
    public static void main(String[] args) {
        SpringApplication.run(OnlineDocApplication.class, args);
    }
}
