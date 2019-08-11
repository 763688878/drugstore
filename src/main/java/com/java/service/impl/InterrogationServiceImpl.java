package com.java.service.impl;

import com.java.mapper.InterrogationMapper;
import com.java.pojo.Interrogation;
import com.java.service.InterrogationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterrogationServiceImpl implements InterrogationService {
    @Autowired
    private InterrogationMapper interrogationMapper;

    @Override
    public List<Interrogation> findAllInterrogation() {
        return interrogationMapper.findAllInterrogation();
    }

    @Override
    public Interrogation findInterrogationById(Integer id) {
        return interrogationMapper.findInterrogationById(id);
    }

    @Override
    public List<Interrogation> findInterrogationByAnyStatus(Interrogation interrogation) {
        return interrogationMapper.findInterrogationByAnyStatus(interrogation);
    }

    @Override
    public List<Interrogation> findInterrogationByIds(List<Integer> list) {
        return interrogationMapper.findInterrogationByIds(list);
    }

    @Override
    public int deleteInterrogationById(Integer id) {
        return interrogationMapper.deleteInterrogationById(id);
    }

    @Override
    public int deleteInterrogationByIds(List<Integer> list) {
        return interrogationMapper.deleteInterrogationByIds(list);
    }

    @Override
    public int insertInterrogation(Interrogation interrogation) {
        return interrogationMapper.insertInterrogation(interrogation);
    }

    @Override
    public int insertManyInterrogation(List<Interrogation> list) {
        return interrogationMapper.insertManyInterrogation(list);
    }

    @Override
    public int updateInterrogationById(Interrogation interrogation) {
        return interrogationMapper.updateInterrogationById(interrogation);
    }

    @Override
    public int updateManyInterrogation(List<Interrogation> list) {
        return interrogationMapper.updateManyInterrogation(list);
    }
}
