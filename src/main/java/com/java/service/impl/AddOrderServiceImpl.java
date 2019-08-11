package com.java.service.impl;

import com.java.mapper.AddOrderMapper;
import com.java.pojo.Ordertable;
import com.java.service.AddOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddOrderServiceImpl implements AddOrderService {
    @Autowired
    private AddOrderMapper addOrderMapper;
    @Override
    public int insertOrder(Ordertable ordertable) {
        return addOrderMapper.insertOrder(ordertable);
    }
}
