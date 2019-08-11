package com.java.service.impl;

import com.java.mapper.DoctorMapper;
import com.java.pojo.Doctor;
import com.java.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    //增
    public int add(Doctor doctor) {
        return doctorMapper.add(doctor);
    }

    //删
    public int delete(Doctor doctor) {
        return doctorMapper.delete(doctor);
    }

    //改
    public int update(Doctor doctor) {
        return doctorMapper.update(doctor);
    }

    //查所有
    public List<Doctor> findAll() {
        return doctorMapper.findAll();
    }

    //查所有在线医生
    public List<Doctor> findAllOnline() {
        return doctorMapper.findAllOnline();
    }

    //查单条
    public Doctor findOne(Doctor doctor) {
        return doctorMapper.findOne(doctor);
    }

    //登录
    public Doctor login(Doctor doctor) {
        return doctorMapper.login(doctor);
    }

    @Override
    public Doctor findOneByTel(String tel) {
        return doctorMapper.findOneByTel(tel);
    }
    //多条件查询
    public List<Doctor> searchOne(Doctor doctor) {
        return doctorMapper.searchOne(doctor);
    }

    //医生精确查找
    public Doctor find(String serial) {
        return doctorMapper.find(serial);
    }


    //    批量删除
    public int batchDelete(String[] id) {
        return doctorMapper.batchDelete(id);
    }

    //    分页
    public List<Doctor> findOneSelf(Doctor doctor) {
        return doctorMapper.findOneSelf(doctor);
    }

}
