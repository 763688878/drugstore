package com.java.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Drugstore;
import com.java.service.DrugstoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class sk_drugstore {

    // 药店
    @Autowired
    private DrugstoreService drugstoreService;

    //   药店删除
    @RequestMapping("/yd_delete")
    public String yddelete(Drugstore drugstore, Model model) {
        int count = drugstoreService.delete(drugstore);
        return "yd_index";
    }

    //   药店添加
    @RequestMapping("/yd_zj")
    public String ydadd(Drugstore drugstore, Model model)  {
        int count = drugstoreService.add(drugstore);
        return "redirect:yd_index";
    }

    //    药店查单条
    @RequestMapping("/yd_findOne")
    public String ydfindOne(Drugstore drugstore, Model model) {
        Drugstore d = drugstoreService.findOne(drugstore);
        model.addAttribute("d", d);
        return "sk_drugstore/update.jsp";
    }


    //     药店修改
    @RequestMapping("/yd_xg")
    public String ydupdate(Drugstore drugstore, Model model) {
        int count = drugstoreService.update(drugstore);
        return "yd_index";
    }

    //批量删
    @ResponseBody
    @RequestMapping("yd_batchDelete")
    public String batchDelete(String id) {
        String[] id1 = id.split(",");
        int count = drugstoreService.batchDelete(id1);
        if (count > 0) {
            return "1";
        }
        return "0";
    }

    //   药店查所有  分页
    @RequestMapping("yd_index")
    public String ydfindOneSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Drugstore> list = drugstoreService.findAll();
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "sk_drugstore/index.jsp";
    }

    // 药店多条件查询
    @RequestMapping("/yd_cx")
    public String ydfindSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Drugstore drugstore, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Drugstore> list = drugstoreService.searchOne(drugstore);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        if(drugstore.getSerial()==""||(drugstore.getName()==""&& drugstore.getSite()=="")){
            return "yd_index";
        }
        return "sk_drugstore/cx.jsp";
    }
}
