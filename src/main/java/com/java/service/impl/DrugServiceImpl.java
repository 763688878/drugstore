package com.java.service.impl;
import com.java.mapper.DrugMapper;
import com.java.pojo.Drug;
import com.java.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DrugServiceImpl implements DrugService {
    @Autowired
    private DrugMapper drugMapper;
    //增
    public int add(Drug drug) {
        return drugMapper.add(drug);
    }

    //删
    public int delete(Drug drug) {
        return drugMapper.delete(drug);
    }

    //删
    public int update(Drug drug) {
        return drugMapper.update(drug);
    }

    //查所有
    public List<Drug> findAll() {
        return drugMapper.findAll() ;
    }

    //查单条
    public Drug findOne(Drug drug) {
        return drugMapper.findOne(drug);
    }
    @Override
    public List<Drug> searchOne(Drug drug) {
        return drugMapper.searchOne(drug);
    }

    @Override
    public int batchDelete(String[] id) {
        return drugMapper.batchDelete(id);
    }

    @Override
    public List<Drug> findOneSelf(Drug drug) {
        return drugMapper.findOneSelf(drug);
    }

}
