package com.java.service;

import com.java.pojo.Shopping;

import java.util.List;

public interface ShoppingService {
    //增
    int add(Shopping shopping);

    //删
    int delete(Shopping shopping);

    //批量删
    int batchDelete(String [] id);

    //改
    int update(Shopping shopping);

    //查所有
    List<Shopping> findAll();

    //查自己的购物车
    List<Shopping> findOneSelf(Shopping shopping);

    //查单条
    Shopping findOne(Shopping shopping);

    //批量修改状态
    public int updateManyStatus(Integer status, List<Integer> list);

    //重置状态为0
    public int updateZero(String serial);

    //计算指定用户购物总金额
    public String totalMoney(String customerSerial);
}
