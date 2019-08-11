package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Carousel;
import com.java.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class Chy_carousel {
    @Autowired
    private CarouselService carouselService;

    //轮播展示
    @ResponseBody
    @RequestMapping("chy_carousel_findAll")
    public List<Carousel> chy_carousel_findAll(){
        return carouselService.findAll();
    }

    //首页轮播
    @GetMapping("chy_carousel_show")
    public String chy_carousel_show(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Carousel> list = carouselService.findAll();
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "chy_jsp/carousel.jsp";
    }

    //增
    @PostMapping("chy_carousel_add")
    public String chy_carousel_add(@RequestParam("file")MultipartFile file){
        String fileName = file.getOriginalFilename();
        FileOutputStream fos = null;
        try {
            byte[] bytes = file.getBytes();
            //文件上传地址
            fos = new FileOutputStream("D:\\idea\\workspace\\drugstore\\src\\main\\resources\\static\\chy_img\\"+fileName);
            fos.write(bytes);
            fos.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(fos != null){
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        Carousel carousel = new Carousel();
        carousel.setName(fileName);
        carouselService.add(carousel);
        return "redirect:/chy_carousel_show";
    }

    //删
    @ResponseBody
    @PostMapping("chy_carousel_delete")
    public String chy_carousel_delete(Carousel carousel){
        int count1 = carouselService.delete(carousel);
        if(count1>0){
            return "1";
        }
        return "0";
    }

    //批量删
    @ResponseBody
    @PostMapping("chy_carousel_batchDelete")
    public String chy_carousel_batchDelete(String id){
        String [] id1 = id.split(",");
        int count = carouselService.batchDelete(id1);
        if(count>0){
            return "1";
        }
        return "0";
    }
}
