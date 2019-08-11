package com.java.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.java.Snowflake.Snowflake;
import com.java.pojo.Customer;
import com.java.service.CustomerService;
import com.zhenzi.sms.ZhenziSmsClient;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@Controller
public class yq_registerController {
    /*发送短信验证码
     @param number接受手机号码*/

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/sendSms")
    @ResponseBody
    public Object sendSms(HttpServletRequest request, String number){
        try {
            JSONObject json = null;
            //生成6位验证码
            String verifyCode = String.valueOf(new Random().nextInt(899999)+100000);
            //发送短信
            ZhenziSmsClient client = new ZhenziSmsClient("https://sms_developer.zhenzikj.com","102119","4adf806b-4efd-4959-8894-b46be4ddb9af");
            String result = client.send(number, "您的验证码为:" + verifyCode + "，该码有效期为5分钟，该码只能使用一次！药必达");
            System.out.println(number+"   "+verifyCode+"    "+result);
            json = JSONObject.parseObject(result);
            if(json.getIntValue("code")!=0) {
                return "fail";
            }
            //将验证码存到session中,同时存入创建时间
            //以json存放，这里使用的是阿里的fastjson
            HttpSession session = request.getSession();
            json = new JSONObject();
            json.put("verifyCode", verifyCode);
            json.put("createTime", System.currentTimeMillis());
            // 将认证码存入SESSION
            request.getSession().setAttribute("verifyCode", json);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /*员工注册时验证帐户是否存在*/
    @RequestMapping("/checkingCount")
    @ResponseBody
    public void checkingCount(HttpServletResponse response, String number){
        String tel = number;
        int count = customerService.checkingCount(tel);
        try {
            String jsonString = JSON.toJSONString(count);
            PrintWriter writer = null;
            writer = response.getWriter();
            writer.print(jsonString);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*员工注册时验证验证码是否正确*/
    @RequestMapping("/checkingCode")
    @ResponseBody
    public void checkingCode(HttpServletResponse response,HttpServletRequest request,String verifyCode){
        JSONObject Code = (JSONObject)request.getSession().getAttribute("verifyCode");
        String code =  Code.getString("verifyCode");
        String isRegister = null;
        System.out.println(code+"     " +verifyCode);
        if(code.equals(verifyCode)){
            isRegister = "true";
            try {
                String jsonString = JSON.toJSONString(isRegister);
                PrintWriter writer = null;
                writer = response.getWriter();
                writer.print(jsonString);
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }else {
            try {
                String jsonString = JSON.toJSONString(isRegister);
                PrintWriter writer = null;
                writer = response.getWriter();
                writer.print(jsonString);
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /*将注册信息写入数据库*/
    @RequestMapping("/register")
    @ResponseBody
    public void register(HttpServletResponse response ,String number,String upassword,String name,String age,String sex,String site){
        System.out.println("number:"+number);
        System.out.println("upassword:"+upassword);
        System.out.println("name:"+name);
        System.out.println("age:"+age);
        System.out.println("sex:"+sex);
        System.out.println("site:"+site);
        /*MD5加密*/
        String password = upassword; //明码
        String algorithmName = "MD5"; //加密算法
        Object source = password; //需要加密的密码
        Object salt = number; //盐值唯一
        int hashIterations = 1024; //加密次数
        String newPassword = new SimpleHash(algorithmName,source,salt,hashIterations).toHex();
        System.out.println(newPassword);
        /*雪花算法生成serial*/
        Snowflake snowFlake = new Snowflake(2, 3);
        String serial = Long.toString(snowFlake.nextId());
        Customer customer = new Customer();
        customer.setTel(number);
        customer.setPassword(newPassword);
        customer.setName(name);
        customer.setAge(Integer.parseInt(age));
        customer.setSex(sex);
        customer.setSite(site);
        customer.setSerial(serial);
        int count = customerService.add(customer);
        if(count==1){
            try {
                response.sendRedirect("yq_jsp/registerAction.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.sendRedirect("yq_jsp/register.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
