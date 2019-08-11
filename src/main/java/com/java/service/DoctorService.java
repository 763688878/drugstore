package com.java.service;

import com.java.pojo.Doctor;

import java.util.List;

public interface DoctorService {
    //增
    int add(Doctor doctor);

    //删
    int delete(Doctor doctor);

    //改
    int update(Doctor doctor);

    //查所有
    List<Doctor> findAll();

    //查所有在线医生
    List<Doctor> findAllOnline();

    //查单条
    Doctor findOne(Doctor doctor);

    //登录
    Doctor login(Doctor doctor);

    //根据tel查询
    Doctor findOneByTel(String tel);

    //多条件查询
    List<Doctor> searchOne(Doctor doctor);

    //医生精确查找
    Doctor find(String serial);

    //批量删
    int batchDelete(String [] id);

    //分页
    List<Doctor> findOneSelf(Doctor doctor);
}
