package com.java.controller;

import com.java.Shiro.MyRealm;
import com.java.pojo.Admin;
import com.java.pojo.Doctor;
import com.java.pojo.Drugstore;
import com.java.service.AdminService;
import com.java.service.DoctorService;
import com.java.service.DrugstoreService;
import com.java.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.pam.AtLeastOneSuccessfulStrategy;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.authz.permission.WildcardPermissionResolver;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class yq_houtaiLoginController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private DrugstoreService drugstoreService;

    @Autowired
    private UserService userService;

    @RequestMapping("/houtaiLogin")
    public String login(String username, String password, HttpServletRequest request, Model model){
        if(userService.findOneByTel(username)!=null){
            DefaultSecurityManager securityManager = new DefaultSecurityManager();

            ModularRealmAuthenticator authenticator = new ModularRealmAuthenticator();
            authenticator.setAuthenticationStrategy(new AtLeastOneSuccessfulStrategy());
            securityManager.setAuthenticator(authenticator);

            ModularRealmAuthorizer authorizer = new ModularRealmAuthorizer();
            authorizer.setPermissionResolver(new WildcardPermissionResolver());
            securityManager.setAuthorizer(authorizer);

            //jdbc Template
//        dataSource=org.springframework.jdbc.datasource.DriverManagerDataSource
            DriverManagerDataSource dataSource = new DriverManagerDataSource();

//        dataSource.driverClassName=com.mysql.jdbc.Driver
//        dataSource.url=jdbc:mysql://127.0.0.1:3306/drugstore?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC
//        dataSource.username=root
//        dataSource.password=123456
            dataSource.setDriverClassName("com.mysql.jdbc.Driver");
            dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/drugstore?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");
            dataSource.setUsername("root");
            dataSource.setPassword("root");

            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

            MyRealm myRealm = new MyRealm();
            myRealm.setJdbcTemplate(jdbcTemplate);
            securityManager.setRealm(myRealm);
            SecurityUtils.setSecurityManager(securityManager);
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);

            try {
                subject.login(token);
                if (subject.isAuthenticated()){
                    System.out.println("登录成功");

                    if(subject.hasRole("admin")){
                        request.getSession().setAttribute("doctor",null);
                        request.getSession().setAttribute("drugstore",null);

                        System.out.println("有admin角色");
                        Admin admin = adminService.findOneByTel(username);
                        request.getSession().setAttribute("admin",admin);
                        return "yq_jsp/index.jsp";
                    }

                    if(subject.hasRole("doctor")){
                        System.out.println("有doctor角色");
                        request.getSession().setAttribute("admin",null);
                        request.getSession().setAttribute("drugstore",null);
                        Doctor doctor = doctorService.findOneByTel(username);
                        request.getSession().setAttribute("doctor",doctor);
                        return "yq_jsp/index.jsp";
                    }

                    if(subject.hasRole("drugstore")){
                        System.out.println("有drugstore角色");
                        request.getSession().setAttribute("admin",null);
                        request.getSession().setAttribute("doctor",null);
                        Drugstore drugstore = drugstoreService.findOneByTel(username);
                        request.getSession().setAttribute("drugstore",drugstore);
                        return "yq_jsp/index.jsp";
                    }

                    return "yq_jsp/index.jsp";

                }
            } catch (IncorrectCredentialsException e){
                model.addAttribute("msg","密码错误");
                return "yq_jsp/houtaiLogin.jsp";
            }
        }else {
            /*帐户不存在*/
            model.addAttribute("msg","用户名不存在");
            return "yq_jsp/houtaiLogin.jsp";
        }


        return "yq_jsp/index.jsp";
    }
}
