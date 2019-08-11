package com.java.controller;

import com.java.pojo.Drug;
import com.java.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class Chy_drug {
    @Autowired
    private DrugService drugService;

    //药品列表
    @ResponseBody
    @PostMapping("chy_drug_list")
    public List<Drug> chy_drug_list(){
        return drugService.findAll();
    }

    //药品详情
    @GetMapping("chy_drug_buy")
    public String chy_drug_buy(Drug drug , Model model){
        model.addAttribute("drug",drugService.findOne(drug));
        return "chy_jsp/buy.jsp";
    }
}
