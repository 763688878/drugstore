package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class WebSocketController {
    /**
     * 医师登录
     */
    @RequestMapping("/doctors")
    public String chat1(String name, HttpServletRequest request, Map<String, Object> map) {
        // 医师登录,存储到session中
        request.getSession().setAttribute("WEBSOCKET_USERNAME", name);
        map.put("user", name);
        return "zy_jsp/doctor.jsp";
    }

    /**
     * 用户登录
     */
    @RequestMapping("/customers")
    public String chat2(String name, HttpServletRequest request, Map<String, Object> map) {
        // 假设用户jerry登录,存储到session中
        request.getSession().setAttribute("WEBSOCKET_USERNAME", name);
        map.put("user", name);
        return "zy_jsp/customer.jsp";
    }
}
