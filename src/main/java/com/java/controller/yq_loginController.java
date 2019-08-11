package com.java.controller;

import com.java.pojo.Customer;
import com.java.service.CustomerService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class yq_loginController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/customerLoginController")
    public String login(Model model, String uname, String upassword, HttpServletRequest request){
        /*customer 为前端传的账户密码*/
        Customer customer = new Customer();
        customer.setTel(uname);
        customer.setPassword(upassword);


        /*customer1为根据电话查找的*/
        Customer customer1 = customerService.findOneByTel(uname);

        if(customer1!=null){
            System.out.println("用户存在");
            String tel = customer1.getTel();
            String password = customer1.getPassword();

            /*将前端的帐户密码加密*/
            String newPassword = new SimpleHash("MD5",upassword,uname,1024).toHex();
            /*匹配密码*/
            if(password.equals(newPassword)){
                /*登陆成功*/
                // 将认证码存入SESSION
                request.getSession().setAttribute("customer", customer1);
//                System.out.println(password);
//                System.out.println(newPassword);
                model.addAttribute("customer",customer1);
                return "chy_jsp/index.jsp";
            }else{
                model.addAttribute("flag","errorPassword");
                return "yq_jsp/login.jsp";
            }

        }else {
            model.addAttribute("flag","noUsername");
            return "yq_jsp/login.jsp";
        }
    }

}
