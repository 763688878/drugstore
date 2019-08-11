package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Ordertable;
import com.java.service.OrdertableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class Zz_order {
    //查看个人订单
    @Autowired
    private OrdertableService ordertableService;
    @RequestMapping("/zz_findOrder")
    public String zz_findOrder(Ordertable ordertable, Model model,
                               @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){
        PageHelper.startPage(PageNum,8);
        List<Ordertable> list = ordertableService.zz_findOrder();

        PageInfo<Ordertable> pageInfo = new PageInfo<Ordertable>(list);
//        System.out.println(list+"123");
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return "zz_jsp/orderById.jsp";
    }

    //按编号查询
    @RequestMapping("/findOneOrder")
    @ResponseBody
    public Ordertable findOneOrder(String orderserial){
//        System.out.println(ordertableService.findOneOrder(orderserial));
        return ordertableService.findOneOrder(orderserial);
    }

   /* //按条件查询
    @RequestMapping("/zz_findOrderBy")
    public String zz_findOrderBy(Ordertable ordertable, Model model,@RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){
//        PageHelper.startPage(PageNum,1);
        List<Ordertable> list = ordertableService.zz_findOrderBy(ordertable);
//        PageInfo<Ordertable> pageInfo = new PageInfo<Ordertable>(list);
//        System.out.println(list+"123");
        model.addAttribute("list",list);
//        model.addAttribute("pageInfo",pageInfo);
        return "zz_jsp/orderById.jsp";
    }*/



   /* @RequestMapping("deleteOrder")
    public String deleteOrder(Ordertable ordertable, Model model,
                              @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum,
                              @RequestParam(value = "PageSize",defaultValue = "1") Integer PageSize){
        ordertableService.deleteOrder(ordertable.getId());
        return this.findOrderById(ordertable,model,PageNum,PageSize);
    }*/


    //删除
    @RequestMapping("/delOneOrder")
    public String delOneOrder(Ordertable ordertable, Model model,
                              @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum) {
        ordertableService.delOneOrder(ordertable.getId());
        return this.zz_findOrder(ordertable,model,PageNum);

    }

    //批量删除
    @ResponseBody
    @RequestMapping("/delSomeOrder")
    public int delSomeOrder(String id){
//        System.out.println(id);
        String[] ids = id.split(",");
        int count = ordertableService.delSomeOrder(ids);
        if (count > 0){
            return 1;
        }else {
            return 0;
        }
    }

    //修改单条
    @RequestMapping("/updateOrder")
    public String updateOrder(Ordertable ordertable, Model model, @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){
            ordertableService.updateOrder(ordertable);
        return this.zz_findOrder(ordertable,model,PageNum);
    }
    //查看个人订单
    @RequestMapping("zz_findOrderByid")
    public String findOrderById(HttpServletRequest request, Ordertable ordertable, Model model,
                                @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum,
                                @RequestParam(value = "PageSize",defaultValue = "1") Integer PageSize){

        PageHelper.startPage(PageNum,8);
        List<Ordertable> list = ordertableService.findOrderById(ordertable.getCustomerId());
        PageInfo<Ordertable> pageInfo = new PageInfo<Ordertable>(list);
        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);

        return "zz_jsp/orderById3.jsp";

    }

    @RequestMapping("deleteOrder")

    public String deleteOrder(HttpServletRequest request,Ordertable ordertable, Model model,
                              @RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum,
                              @RequestParam(value = "PageSize",defaultValue = "1") Integer PageSize){
        ordertableService.deleteOrder(ordertable.getId());
        return this.findOrderById(request,ordertable,model,PageNum,PageSize);
    }

    @RequestMapping("/delSomeOrders")
    @ResponseBody
    public int delSomeOrders(String id){
        String[] ids = id.split(",");
        int count = ordertableService.deleteSomeOrders(ids);
        if (count>0){
            return 1;
        }else {

            return 0;
        }
    }

    //返回首页
    @RequestMapping("/backToIndex")
    public String backToIndex(){
        return "redirect:chy_jsp/index.jsp";
    }


}
