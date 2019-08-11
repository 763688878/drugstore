package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Customer;
import com.java.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class sk_customer {
//    用户
    @Autowired
    private CustomerService customerService;

    //   用户删除
    @RequestMapping("/cs_delete")
    public String csdelete(Customer customer, Model model) {
        int count = customerService.delete(customer);
        return "cs_index";
    }

    //   用户添加
    @RequestMapping("/cs_zj")
    public String csadd(Customer customer, Model model)  {
        int count = customerService.add(customer);
        return "redirect:cs_index";
    }

    //    用户查单条
    @RequestMapping("/cs_findOne")
    public String csfindOne(Customer customer, Model model) {
        Customer s = customerService.findOne(customer);
        model.addAttribute("s", s);
        return "sk_customer/update.jsp";
    }


    //     用户修改
    @RequestMapping("/cs_xg")
    public String csupdate(Customer customer, Model model) {
        int count = customerService.update(customer);
        return "cs_index";
    }

    //批量删
    @ResponseBody
    @RequestMapping("cs_batchDelete")
    public String csbatchDelete(String id) {
        String[] id1 = id.split(",");
        int count = customerService.batchDelete(id1);
        if (count > 0) {
            return "1";
        }
        return "0";
    }

    //   用户查所有  分页
    @RequestMapping("cs_index")
    public String csfindOneSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Customer> list = customerService.findAll();
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "sk_customer/index.jsp";
    }

    // 多条件查询
    @RequestMapping("/cs_cx")
    public String csfindSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Customer customer, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Customer> list = customerService.searchOne(customer);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        if(customer.getSerial()==""||(customer.getSite()==""&& customer.getMedicalrecord()=="")){
          return "cs_index";
       }
        return "sk_customer/cx.jsp";
    }
}