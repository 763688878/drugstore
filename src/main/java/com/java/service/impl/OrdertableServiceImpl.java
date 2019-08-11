package com.java.service.impl;

import com.java.mapper.OrdertableMapper;
import com.java.pojo.Ordertable;
import com.java.service.OrdertableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdertableServiceImpl implements OrdertableService {
    @Autowired
    private OrdertableMapper ordertableMapper;
    public List<Ordertable> zz_findOrder() {
        return ordertableMapper.zz_findOrder();
    }

    @Override
    public Ordertable findOneOrder(String orderserial) {
        return ordertableMapper.findOneOrder(orderserial);
    }

    /*  public List<Ordertable> zz_findOrderBy(Ordertable ordertable) {
          System.out.println(ordertable);
          return ordertableMapper.zz_findOrderBy(ordertable);
      }
  */
    @Override
    public int delOneOrder(int id) {
        return ordertableMapper.delOneOrder(id);
    }

    @Override
    public int delSomeOrder(String[] ids) {
        return ordertableMapper.delSomeOrder(ids);
    }

    @Override
    public int updateOrder(Ordertable ordertable) {
        return ordertableMapper.updateOrder(ordertable);
    }

    public List<Ordertable> findOrderById(String customerid) {
        return ordertableMapper.findOrderById(customerid);
    }

    public int deleteOrder(int id) {
        return ordertableMapper.deleteOrder(id);
    }

    @Override
    public int deleteSomeOrders(String[] ids) {
        return ordertableMapper.deleteSomeOrders(ids);
    }

}
