package io.github.taybct.admin.file;

import io.github.taybct.tool.cloud.annotation.TayBctCloudConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * @author xijieyin
 */
@TayBctCloudConfig
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@MapperScan({"io.github.taybct.**.mapper"})
public class FileApplication {

    public static void main(String[] args) {
        SpringApplication.run(FileApplication.class, args);
    }
}
