package com.java.service;

import com.java.pojo.Ordertable;

import java.util.List;

public interface OrdertableService {
        //查询所有
        List<Ordertable> zz_findOrder();
       /* //按条件查询
        List<Ordertable> zz_findOrderBy(Ordertable ordertable);*/

        //按编号查询
        Ordertable findOneOrder(String orderserial);
        //删除
        int delOneOrder(int id);

        //批量删除
        int delSomeOrder(String[] ids);
        //修改单条
        int updateOrder(Ordertable ordertable);
        //查询个人订单
        public List<Ordertable> findOrderById(String customerId);

        //删除个人订单
        int deleteOrder(int id);

        //删除部分订单
        int deleteSomeOrders(String[] ids);
}
