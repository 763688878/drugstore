package com.java.service.impl;

import com.java.mapper.ShoppingMapper;
import com.java.pojo.Shopping;
import com.java.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    private ShoppingMapper shoppingMapper;


    //增
    public int add(Shopping shopping) {
        return shoppingMapper.add(shopping);
    }

    //删
    public int delete(Shopping shopping) {
        return shoppingMapper.delete(shopping);
    }

    //批量删
    public int batchDelete(String [] id){
        return shoppingMapper.batchDelete(id);
    }

    //改
    public int update(Shopping shopping) {
        return shoppingMapper.update(shopping);
    }

    //查所有
    public List<Shopping> findAll() {
        return shoppingMapper.findAll();
    }

    //查自己的购物车
    public List<Shopping> findOneSelf(Shopping shopping) {
        return shoppingMapper.findOneSelf(shopping);
    }

    //查单条
    public Shopping findOne(Shopping shopping) {
        return shoppingMapper.findOne(shopping);
    }

    //批量修改状态
    public int updateManyStatus(Integer status, List<Integer> list) {
        return shoppingMapper.updateManyStatus(status, list);
    }

    //重置状态为0
    public int updateZero(String serial) {
        return shoppingMapper.updateZero(serial);
    }

    //计算指定用户购物总金额
    public String totalMoney(String customerSerial) {
        return shoppingMapper.totalMoney(customerSerial);
    }
}
