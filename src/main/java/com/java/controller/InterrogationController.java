package com.java.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.pojo.*;
import com.java.service.CustomerService;
import com.java.service.DoctorService;
import com.java.service.InterrogationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class InterrogationController {
    @Autowired
    private InterrogationService interrogationService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private DoctorService doctorService;

    //分页查所有问诊记录
    @ResponseBody
    @GetMapping("/ints")
    public Object findAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        System.out.println(pn);
        //设置分页查询参数
        PageHelper.startPage(pn, 5);
        //分页查询
        List<Interrogation> allInterrogation = interrogationService.findAllInterrogation();
        if (allInterrogation.size() == 0) {//如果查询结果没有,直接返回错误提示
            return Msg.fail();
        }
        //将结果封装
        PageInfo pageInfo = new PageInfo(allInterrogation);
        //返回值
        return Msg.success().maps("page", pageInfo);
    }

    @GetMapping("/interrogation")
    public String interrogation(){
        return "zy_jsp/interrogation.jsp";
    }

    //删除单条
    @ResponseBody
    @DeleteMapping("/interrogation/{id}")
    public Msg deleteById(@PathVariable("id") Integer id){
        int i = interrogationService.deleteInterrogationById(id);
        if(i>0){
            return Msg.success();
        }
        return Msg.fail();
    }

    //查询所有医师id,用户id
    @ResponseBody
    @GetMapping("/findInsertIds")
    public Msg findInsertIds(){
        //查询所有用户id
        List<Customer> customerIds = customerService.findAll();
        //查询所有医师id
        List<Doctor> doctorIds = doctorService.findAll();

        cus_doc cus_doc = new cus_doc();
        cus_doc.setCustomerIds(customerIds);
        cus_doc.setDoctorIds(doctorIds);

        if(customerIds.size()>0 || doctorIds.size()>0){
            return Msg.success().maps("cus_doc",cus_doc);
        }
        return Msg.fail();
    }

    //增加单条
    @ResponseBody
    @PostMapping("/insertOne")
    public Msg insertOne(Interrogation interrogation){
        System.out.println(interrogation);
        int i = interrogationService.insertInterrogation(interrogation);
        if(i>0){
            return Msg.success();
        }
        return Msg.fail();
    }

    //批量删除
    @ResponseBody
    @DeleteMapping("/dels")
    public Msg deleteMany(String dels){
        //切割字符串
        String[] s = dels.split("_");
        List<Integer> list = new ArrayList<>();
        for (String ss:s){
            list.add(Integer.parseInt(ss));
        }
        int i = interrogationService.deleteInterrogationByIds(list);
        if(i>0){
            return Msg.success();
        }
        return Msg.fail();
    }

    //查单个
    @ResponseBody
    @GetMapping("/findOne/{id}")
    public Msg findOne(@PathVariable("id") Integer id){
        Interrogation interrogation = interrogationService.findInterrogationById(id);
        System.out.println(interrogation.getItrgtStartTime());
        //初始时间,结束时间
        String startTime = interrogation.getItrgtStartTime();
        String endTime = interrogation.getItrgtEndTime();

        startTime = startTime.replace(" ","T");
        endTime = endTime.replace(" ","T");

        interrogation.setItrgtStartTime(startTime);
        interrogation.setItrgtEndTime(endTime);

        if(interrogation == null){
            return Msg.fail();
        }
        return Msg.success().maps("interrogation", interrogation);
    }

    //修改单个
    @ResponseBody
    @PutMapping("/updOne")
    public Msg findOne(Interrogation interrogation){
        System.out.println(interrogation);
        int i = interrogationService.updateInterrogationById(interrogation);
        if(i>0){
            return Msg.success();
        }
        return Msg.fail();
    }

    //按id查询多个
    @ResponseBody
    @GetMapping("/findMany/{ids}")
    public Msg findManyByIds(@PathVariable("ids")String ids){
        //将字符型切割并转为int类型存入集合
        String[] s = ids.split("_");
        List<Integer> list = new ArrayList<>();
        for (String ss: s){
            list.add(Integer.parseInt(ss));
        }
        //调用查询多个方法
        List<Interrogation> interrogationByIds = interrogationService.findInterrogationByIds(list);
        if(interrogationByIds.size()>0){
            for (Interrogation ints: interrogationByIds){
                //初始时间,结束时间
                String startTime = ints.getItrgtStartTime();
                String endTime = ints.getItrgtEndTime();

                startTime = startTime.replace(" ","T");
                endTime = endTime.replace(" ","T");

                ints.setItrgtStartTime(startTime);
                ints.setItrgtEndTime(endTime);
            }
            return Msg.success().maps("interrogations", interrogationByIds);
        }
        return Msg.fail();
    }

    //按id修改多个
    @ResponseBody
    @PutMapping("/updsInt")
    public Msg updsInt(@RequestParam("ints")String ints){
        String[] split = ints.split(";");
        List<Interrogation> list = new ArrayList<>();
        for (String s:split){
            //每一个-分割一个对象
            Interrogation interrogation = new Interrogation();
            String[] ss = s.split("_");
            for (int i = 0; i<ss.length; i++){
                if(i == 0){
                    interrogation.setItrgtId(Integer.parseInt(ss[0]));
                }else if(i == 1){
                    interrogation.setItrgtTeacherId(ss[1]);
                }else if(i == 2){
                    interrogation.setItrgtUserId(ss[2]);
                }else if(i == 3){
                    interrogation.setItrgtStartTime(ss[3]);
                }else if(i == 4){
                    interrogation.setItrgtEndTime(ss[4]);
                }else if(i == 5){
                    interrogation.setItrgtTotalPrice(Integer.parseInt(ss[5]));
                }
            }
            list.add(interrogation);
        }
        int i = interrogationService.updateManyInterrogation(list);
        if(i > 0){
            return Msg.success();
        }
        return Msg.fail();
    }
}
