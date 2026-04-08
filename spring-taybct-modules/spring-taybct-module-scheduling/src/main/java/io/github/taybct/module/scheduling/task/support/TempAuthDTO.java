package io.github.taybct.module.scheduling.task.support;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 *
 * <pre>
 * 临时鉴权数据载体
 * </pre>
 *
 * @author XiJieYin
 * @since 2026/4/8 09:52
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TempAuthDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 5493366160167432595L;

    /**
     * 用户 id
     */
    private String userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 授权认证类型
     */
    private String grantType;
    /**
     * 客户端 id
     */
    private String clientId;
    /**
     * 租户 id
     */
    private String tenantId;
    /**
     * 认证方式,比如 username,phone... 这种可以知道是使用什么方式登录的
     */
    private String atm;
    /**
     * 过期时间
     */
    private Long exp;
    /**
     * 角色列表
     */
    private List<String> role;
    /**
     * 域
     */
    private List<String> scope;

    /**
     * 创建默认的 root 用户
     *
     * @return 默认的 root 用户
     */
    public static TempAuthDTO createDefaultRootUser() {
        return new TempAuthDTO("1", "root", "taybct_pc", "taybct_pc", "000000", "username", 3600L, List.of("ROOT"), List.of("all"));
    }

}
