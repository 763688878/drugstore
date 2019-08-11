package com.java.mapper;

import com.java.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AdminMapper {
    //增
    int add(Admin admin);

    //删
    int delete(Admin admin);

    //改
    int update(Admin admin);

    //查所有
    List<Admin> findAll();

    //查单条
    Admin findOne(Admin admin);

    //登录
    Admin login(Admin admin);

    //根据tel查询
    Admin findOneByTel(String tel);

}
