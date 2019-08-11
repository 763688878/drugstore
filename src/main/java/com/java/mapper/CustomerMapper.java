package com.java.mapper;

import com.java.pojo.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CustomerMapper {
    //增
    int add(Customer customer);

    //删
    int delete(Customer customer);

    //改
    int update(Customer customer);

    //查所有
    List<Customer> findAll();

    //查单条
    Customer findOne(Customer customer);

    //查单条
    Customer findOneBySerial(String serial);

    //登录
    Customer login(Customer customer);

    //查找用户是否已经注册
    int checkingCount(String tel);

    //根据电话查询
    Customer findOneByTel(String tel);
    //根据条件
    List<Customer> searchOne(Customer customer);

    //医生精确查找
    Customer find(String serial);

    //批量删
    int batchDelete(String [] id);

    //分页
    List<Customer> findOneSelf(Customer customer);
}
