package com.java.Shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MyRealm extends AuthorizingRealm {
    private JdbcTemplate jdbcTemplate;
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    //权限验证调用
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String sql = "select role_name from shiro_user_role where user_name = ?";
        String username = (String)principalCollection.getPrimaryPrincipal();
        List<String> roles = jdbcTemplate.queryForList(sql,String.class,username);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        return info;
    }

    //登录调用
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("调用登录");
        String sql = "select password from shiro_user where user_name = ?";
        String username = (String) authenticationToken.getPrincipal();
        String password = jdbcTemplate.queryForObject(sql,String.class,username);
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username,password,null,getName());

        return info;
    }
}
