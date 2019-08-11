package com.java.controller;

import com.java.pojo.Customer;
import com.java.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Chy_customer {
    @Autowired
    private CustomerService customerService;

    //用户个人信息
    @ResponseBody
    @PostMapping("chy_customer_findOne")
    public Customer chy_customer_findOne(Customer customer){
        return customerService.findOne(customer);
    }
}
