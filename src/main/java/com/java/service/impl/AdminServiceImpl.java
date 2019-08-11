package com.java.service.impl;

import com.java.mapper.AdminMapper;
import com.java.pojo.Admin;
import com.java.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    //增
    public int add(Admin admin) {
        return adminMapper.add(admin);
    }

    //删
    public int delete(Admin admin) {
        return adminMapper.delete(admin);
    }

    //改
    public int update(Admin admin) {
        return adminMapper.update(admin);
    }

    //查所有
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    //查单条
    public Admin findOne(Admin admin) {
        return adminMapper.findOne(admin);
    }
    //登录
    public Admin login(Admin admin) {
        return adminMapper.login(admin);
    }

    @Override
    public Admin findOneByTel(String tel) {
        return adminMapper.findOneByTel(tel);
    }


}
