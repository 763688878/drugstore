package com.java.service;
import com.java.pojo.Drug;
import java.util.List;
public interface DrugService {
    //增
    int add(Drug drug);

    //删
    int delete(Drug drug);

    //改
    int update(Drug drug);

    //查所有
    List<Drug> findAll();

    //查单条
    Drug findOne(Drug drug);

    //根据条件
    List<Drug> searchOne(Drug drug);

    //批量删
    int batchDelete(String [] id);

    //分页
    List<Drug> findOneSelf(Drug drug);

}
