package io.github.taybct.auth.config;

import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.taybct.auth.security.granter.customize.CustomizeTokenAuthenticationToken;
import io.github.taybct.auth.security.pojo.OAuth2UserDetails;
import io.github.taybct.auth.security.support.OAuth2SqliteAuthorizationRowMapper;
import io.github.taybct.auth.security.support.OAuth2UserMixin;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.security.jackson2.SecurityJackson2Modules;
import org.springframework.security.oauth2.server.authorization.JdbcOAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.OAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.jackson2.OAuth2AuthorizationServerJackson2Module;
import org.sqlite.SQLiteDataSource;

import java.util.List;

/**
 *
 * <pre>
 * SQLite 配置
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/9/20 10:47
 */
@ConditionalOnClass(value = SQLiteDataSource.class)
@AutoConfiguration
@AutoConfigureOrder(Integer.MIN_VALUE)
public class SQLiteDataSourceConfig {

    @Bean
    public OAuth2AuthorizationService authorizationService(JdbcTemplate jdbcTemplate
            , RegisteredClientRepository registeredClientRepository) {
        JdbcOAuth2AuthorizationService service = new JdbcOAuth2AuthorizationService(jdbcTemplate, registeredClientRepository);
        OAuth2SqliteAuthorizationRowMapper authorizationRowMapper =
                new OAuth2SqliteAuthorizationRowMapper(jdbcTemplate, registeredClientRepository);
        authorizationRowMapper.setLobHandler(new DefaultLobHandler());
        authorizationRowMapper.setObjectMapper(objectMapper());
        service.setAuthorizationRowMapper(authorizationRowMapper);
        return service;
    }

    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        ClassLoader classLoader = JdbcOAuth2AuthorizationService.class.getClassLoader();
        List<Module> securityModules = SecurityJackson2Modules.getModules(classLoader);
        objectMapper.registerModules(securityModules);
        objectMapper.registerModule(new OAuth2AuthorizationServerJackson2Module());
        //放入自定义的user类
        objectMapper.addMixIn(OAuth2UserDetails.class, OAuth2UserMixin.class);
        objectMapper.addMixIn(CustomizeTokenAuthenticationToken.class, OAuth2UserMixin.class);
        return objectMapper;
    }

}
