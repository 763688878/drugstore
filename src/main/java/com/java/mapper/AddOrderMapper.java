package com.java.mapper;

import com.java.pojo.Ordertable;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AddOrderMapper {
    //增加订单
    public int insertOrder(Ordertable ordertable);
}
