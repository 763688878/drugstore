package com.java.service.impl;

import com.java.mapper.DrugstoreMapper;
import com.java.pojo.Drugstore;
import com.java.service.DrugstoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class DrugstoreServiceImpl implements DrugstoreService {
    @Autowired
    private DrugstoreMapper drugstoreMapper;

    //增
    public int add(Drugstore drugstore) {
        return drugstoreMapper.add(drugstore);
    }

    //删
    public int delete(Drugstore drugstore) {
        return drugstoreMapper.delete(drugstore);
    }

    //改
    public int update(Drugstore drugstore) {
        return drugstoreMapper.update(drugstore);
    }

    //查所有
    public List<Drugstore> findAll() {
        return drugstoreMapper.findAll();
    }

    //查单条
    public Drugstore findOne(Drugstore drugstore) {
        return drugstoreMapper.findOne(drugstore);
    }
    //登录
    public Drugstore login(Drugstore drugstore) {
        return drugstoreMapper.login(drugstore);
    }

    @Override
    public Drugstore findOneByTel(String tel) {
        return drugstoreMapper.findOneByTel(tel);
    }

    @Override
    public List<Drugstore> searchOne(Drugstore drugstore) {
        return drugstoreMapper.searchOne(drugstore);
    }

    @Override
    public Drugstore find(String serial) {
        return drugstoreMapper.find(serial);
    }

    @Override
    public int batchDelete(String[] id) {
        return drugstoreMapper.batchDelete(id);
    }

    @Override
    public List<Drugstore> findOneSelf(Drugstore drugstore) {
        return drugstoreMapper.findOneSelf(drugstore);
    }

}
