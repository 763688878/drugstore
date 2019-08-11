package com.java.mapper;

import com.java.pojo.Shopping;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ShoppingMapper {
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
    public int updateManyStatus(@Param("status")Integer status, @Param("list")List<Integer> list);

    //重置状态为0
    public int updateZero(String serial);

    //计算指定用户购物总金额
    public String totalMoney(String customerSerial);
}
