package com.java.mapper;

import com.java.pojo.Drugstore;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DrugstoreMapper {
    //增
    int add(Drugstore drugstore);

    //删
    int delete(Drugstore drugstore);

    //改
    int update(Drugstore drugstore);

    //查所有
    List<Drugstore> findAll();

    //查单条
    Drugstore findOne(Drugstore drugstore);

    //登录
    Drugstore login(Drugstore drugstore);

    //根据tel查单条
    Drugstore findOneByTel(String tel);

    //根据条件
    List<Drugstore> searchOne(Drugstore drugstore);

    //药店精确查找
    Drugstore find(String serial);

    //批量删
    int batchDelete(String [] id);

    //分页
    List<Drugstore> findOneSelf(Drugstore drugstore);

}
