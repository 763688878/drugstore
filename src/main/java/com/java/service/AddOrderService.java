package com.java.service;

import com.java.pojo.Ordertable;

public interface AddOrderService {
    //增加订单
    public int insertOrder(Ordertable ordertable);
}
