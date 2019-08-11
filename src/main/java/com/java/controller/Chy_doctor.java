package com.java.controller;

import com.java.pojo.Doctor;
import com.java.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class Chy_doctor {
    @Autowired
    private DoctorService doctorService;
    //医生查询
    @ResponseBody
    @PostMapping("chy_doctor_findAll")
    public List<Doctor> chy_doctor_findAll(){
        return doctorService.findAll();
    }

    //查所有在线医生
    @ResponseBody
    @PostMapping("chy_doctor_findAllOnline")
    public List<Doctor> chy_doctor_findAllOnline(){
        return doctorService.findAllOnline();
    }

    //    医生详情
    @GetMapping("chy_doctor_details")
    public String chy_doctor_details(Doctor doctor, Model model){
        model.addAttribute("doctor",doctorService.findOne(doctor));
        return "chy_jsp/details.jsp";
    }

}
