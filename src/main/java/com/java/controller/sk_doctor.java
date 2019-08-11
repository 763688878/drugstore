package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.Doctor;
import com.java.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class sk_doctor {

    //   医生
    @Autowired
    private DoctorService doctorService;


    //   医生删除
    @RequestMapping("/dc_delete")
    public String dcdelete(Doctor doctor, Model model) {
        int count = doctorService.delete(doctor);
        return "dc_index";
    }

    //   医生添加
    @RequestMapping("/dc_zj")
    public String dcadd(@RequestParam("pho") MultipartFile pho, Doctor doctor, Model model) throws IOException {
        //获取文件名
        String name = null;
        if (pho != null) {
            name = pho.getOriginalFilename();
            byte[] bytes = pho.getBytes();
            FileOutputStream fos = new FileOutputStream("C:\\Users\\ZZ\\Desktop\\ddd\\drugstore\\src\\main\\resources\\static\\sk_img\\" + name);
            fos.write(bytes);
            fos.flush();
            fos.close();
        }
        doctor.setPhoto(name);
        int count = doctorService.add(doctor);
        return "redirect:dc_index";
    }

    //     医生查单条
    @RequestMapping("/dc_findOne")
    public String dcfindOne(Doctor doctor, Model model) {
        Doctor d = doctorService.findOne(doctor);
        model.addAttribute("d", d);
        return "sk_doctor/update.jsp";
    }


    //     医生修改
    @RequestMapping("/dc_xg")
    public String dcupdate(Doctor doctor, Model model) {
        int count = doctorService.update(doctor);
        return "dc_index";
    }

    //批量删
    @ResponseBody
    @RequestMapping("dc_batchDelete")
    public String batchDelete(String id) {
        String[] id1 = id.split(",");
        int count = doctorService.batchDelete(id1);
        if (count > 0) {
            return "1";
        }
        return "0";
    }

    //   用户查所有  分页
    @RequestMapping("dc_index")
    public String findOneSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Doctor> list = doctorService.findAll();
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询出来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        return "sk_doctor/index.jsp";
    }

    // 多条件查询
    @RequestMapping("/dc_cx")
    public String findSelf(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Doctor doctor, Model model) {
        // 引入pagehelper插件
        // 传入页码,及每页条数
        PageHelper.startPage(pn, 6);
        // startPage后紧跟的查询就是分页查询
        List<Doctor> list = doctorService.searchOne(doctor);
        // 使用pageInfo包装查询后的结果
        // 封装了分页的详情信息,和查询来的结果
        PageInfo pageInfo = new PageInfo(list, 5);// 传入连续显示的页数
        model.addAttribute("pageInfo", pageInfo);
        if(doctor.getSerial()==""||(doctor.getSubject()==""&& doctor.getHospital()==""&& doctor.getPost()=="")){
            return "dc_index";
        }
        return "sk_doctor/cx.jsp";
    }
}