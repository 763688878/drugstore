package com.java.service.impl;

import com.java.mapper.CustomerMapper;
import com.java.pojo.Customer;
import com.java.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    //增
    public int add(Customer customer) {
        return customerMapper.add(customer);
    }

    //删
    public int delete(Customer customer) {
        return customerMapper.delete(customer);
    }

    //改
    public int update(Customer customer) {
        return customerMapper.update(customer);
    }

    //查所有
    public List<Customer> findAll() {
        return customerMapper.findAll();
    }

    //查单条
    public Customer findOne(Customer customer) {
        System.out.println(customer);
        return customerMapper.findOne(customer);
    }

    //登录
    public Customer login(Customer customer) {
        return customerMapper.login(customer);
    }
    //查找用户是否已经注册
    public int checkingCount(String tel){
        return customerMapper.checkingCount(tel);
    }

    public Customer findOneByTel(String tel) {
        return customerMapper.findOneByTel(tel);
    }

    @Override
    public Customer findOneBySerial(String serial) {
        return customerMapper.findOneBySerial(serial);
    }

    //多条件查询
    public List<Customer> searchOne(Customer customer) {
        return customerMapper.searchOne(customer);
    }
    //精确查找
    public Customer find(String serial) {
        return customerMapper.find(serial);
    }

    //    批量删除
    public int batchDelete(String[] id) {
        return customerMapper.batchDelete(id);
    }

    //    分页
    public List<Customer> findOneSelf(Customer customer) {
        return customerMapper.findOneSelf(customer);
    }

}
