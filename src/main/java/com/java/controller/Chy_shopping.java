package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.Snowflake.Snowflake;
import com.java.pojo.Customer;
import com.java.pojo.Msg;
import com.java.pojo.Ordertable;
import com.java.pojo.Shopping;
import com.java.service.AddOrderService;
import com.java.service.CustomerService;
import com.java.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


@Controller
public class Chy_shopping {
    @Autowired
    private ShoppingService shoppingService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private AddOrderService addOrderService;

    //添加到购物车
    @ResponseBody
    @PostMapping("chy_shopping_add")
    public String chy_shopping_add(Shopping shopping){
        if(shopping.getCustomerSerial()==""){
            return "2";
        }
        int count = shoppingService.add(shopping);
        if(count>0){
               return "1";
        }
        return "0";
    }

    //第一次进,重置所有购物车状态为0
    @GetMapping("/chy_reset")
    public String chy_reset(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Shopping shopping, Model model) {
        //重置为0
        int i = shoppingService.updateZero(shopping.getCustomerSerial());
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Shopping> list = shoppingService.findOneSelf(shopping);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "chy_jsp/shopping.jsp";
    }

    //查看自己的购物车
    @GetMapping("chy_shopping_findOneSelf")
    public String chy_shopping_findOneSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Shopping shopping, Model model){
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Shopping> list = shoppingService.findOneSelf(shopping);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "chy_jsp/shopping.jsp";
    }

    //批量删
    @ResponseBody
    @PostMapping("chy_shopping_batchDelete")
    public String chy_shopping_batchDelete(String id){
        String [] id1 = id.split(",");
        int count = shoppingService.batchDelete(id1);
        if(count>0){
            return "1";
        }
        return "0";
    }

    //删
    @ResponseBody
    @PostMapping("chy_shopping_delete")
    public String chy_shopping_delete(Shopping shopping){
        int count1 = shoppingService.delete(shopping);
        if(count1>0){
            return "1";
        }
        return "0";
    }

    //购物车金额计算
    @ResponseBody
    @PostMapping("chy_shopping_count")
    public String chy_shopping_count(Shopping shopping){
        int count2 = shoppingService.update(shopping);
        if(count2>0){
            return "1";
        }
        return "0";
    }

    //订单总金额计算
    @ResponseBody
    @GetMapping("/totalMoney/{name}")
    public Msg totalMoney(@PathVariable("name")String name) {
        try {
            String i = shoppingService.totalMoney(name);
            System.out.println(i);
            return Msg.success().maps("money", i);
        }catch (Exception e){
            return Msg.fail();
        }
    }

    //修改状态
    @ResponseBody
    @PostMapping("/updStatus")
    public Msg updStatus(@RequestParam("updId") String updId, @RequestParam("status") String status) {
        String[] s = updId.split("_");
        System.out.println(Arrays.toString(s));
        List<Integer> list = new ArrayList<>();

        int sta = Integer.parseInt(status);
        for(String ss:s){
            list.add(Integer.parseInt(ss));
        }
        int i = shoppingService.updateManyStatus(sta, list);
        if(i > 0){
            return Msg.success();
        }
        return Msg.fail();
    }

    //生成订单
    @ResponseBody
    @PostMapping("/addOrder")
    public Msg addOrder(@RequestParam("cus_id") String cus_id){
        //查询用户的个人信息
        Customer one = customerService.findOneBySerial(cus_id);

        String i = shoppingService.totalMoney(cus_id);
        Double d = Double.valueOf(i);
        BigDecimal decimal = BigDecimal.valueOf(d);

//        /*雪花算法生成serial*/
        Snowflake snowFlake = new Snowflake(2, 3);
        String serial = Long.toString(snowFlake.nextId());

        Date date = new Date();

        //存值
        Ordertable ordertable = new Ordertable();

        ordertable.setOrderserial(serial);
        ordertable.setCustomerId(cus_id);
        ordertable.setName(one.getName());
        ordertable.setTelphone(one.getTel());
        ordertable.setAddress(one.getSite());
        ordertable.setPrice(decimal);
        ordertable.setTime(date);

        int i1 = addOrderService.insertOrder(ordertable);
        if(i1 > 0){
            return Msg.success();
        }
        return Msg.fail();
    }
}

