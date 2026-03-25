package io.github.taybct.admin.ws.config;

import cn.hutool.core.util.ObjectUtil;
import io.github.taybct.admin.ws.handle.WebSocketHandler;
import io.github.taybct.admin.ws.server.WebSocketServer;
import io.github.taybct.api.system.mapper.SysUserMapper;
import io.github.taybct.api.system.mapper.SysUserOnlineMapper;
import io.github.taybct.tool.core.bean.ISecurityUtil;
import io.github.taybct.tool.core.util.rsa.RSACoder;
import io.github.taybct.tool.core.util.rsa.RSAProperties;
import io.github.taybct.tool.core.websocket.endpoint.IWebSocketServer;
import jakarta.websocket.Session;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.lang.Nullable;

import java.security.KeyPair;

/**
 *
 * <pre>
 * 模块配置
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/3/25 14:53
 */
@AutoConfiguration
public class WSModuleConfig {

    @Bean
    @ConditionalOnMissingBean(KeyPair.class)
    public KeyPair keyPair(@Nullable RSAProperties properties) {
        if (ObjectUtil.isNotEmpty(properties)) {
            RSACoder.ini(properties);
            if (properties.getType().containsKey("JWT")) {
                return RSACoder.keyPair("JWT");
            }
        }
        properties = new RSAProperties();
        properties.setResource("jwt.jks");
        properties.setAlias("jwt");
        properties.setPassword("taybct");
        properties.setExpireCheck(true);
        return RSACoder.newKeyPair(properties);
    }

    @Bean
    public WebSocketServer webSocketServer(IWebSocketServer<Session> webSocketServer,
                                           SysUserOnlineMapper sysUserOnlineMapper,
                                           SysUserMapper sysUserMapper,
                                           KeyPair keyPair) {
        WebSocketServer.sysUserOnlineMapper = sysUserOnlineMapper;
        WebSocketServer.keyPair = keyPair;
        WebSocketServer.sysUserFunction = sysUserMapper::selectById;
        return (WebSocketServer) webSocketServer;
    }

    @Bean
    public WebSocketHandler webSocketHandler(IWebSocketServer<Session> webSocketServer,
                                             ISecurityUtil securityUtil) {
        return new WebSocketHandler(webSocketServer, securityUtil);
    }

}
