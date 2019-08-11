package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Drug;
import com.java.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class sk_drug {

    // 药品
    @Autowired
    private DrugService drugService;

   //  药品删除
    @RequestMapping("/yp_delete")
    public String ypdelete(Drug drug, Model model) {
        int count = drugService.delete(drug);
        return "yp_index";
    }

    //   药品添加
    @RequestMapping("/yp_zj")
    public String ypadd(Drug drug, Model model)  {
        int count = drugService.add(drug);
        return "redirect:yp_index";
    }

    //    药品查单条
    @RequestMapping("/yp_findOne")
    public String ypfindOne(Drug drug, Model model) {
        Drug y = drugService.findOne(drug);
        model.addAttribute("y", y);
        return "sk_drug/update.jsp";
    }


    //     药品修改
    @RequestMapping("/yp_xg")
    public String ypupdate(Drug drug, Model model) {
        int count = drugService.update(drug);
        return "yp_index";
    }

    //药品批量删
    @ResponseBody
    @RequestMapping("yp_batchDelete")
    public String batchDelete(String id) {
        String[] id1 = id.split(",");
        int count = drugService.batchDelete(id1);
        if (count > 0) {
            return "1";
        }
        return "0";
    }


//    //主页药品批量删
//    @ResponseBody
//    @RequestMapping("yp_index_batchDelete")
//    public int index_batchDelete(String id) {
//        String[] id1 = id.split(",");
//        int count = drugService.batchDelete(id1);
//        if (count > 0) {
//            return 1;
//        }
//        return 0;
//    }

    //   药品查所有  分页
    @RequestMapping("yp_index")
    public String ypfindOneSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Drug> list = drugService.findAll();
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "sk_drug/index.jsp";
    }

    // 药品多条件查询
    @RequestMapping("/yp_cx")
    public String ypfindSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Drug drug, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Drug> list = drugService.searchOne(drug);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        if(drug.getName()==""){
            return "yp_index";
        }
        return "sk_drug/cx.jsp";
    }
}