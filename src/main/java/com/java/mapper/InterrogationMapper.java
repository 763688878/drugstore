package com.java.mapper;

import com.java.pojo.Interrogation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 问诊接口
 */
@Mapper
@Repository
public interface InterrogationMapper {
    //查所有问诊记录
    public List<Interrogation> findAllInterrogation();
    //根据id查询指定问诊记录
    public Interrogation findInterrogationById(Integer id);
    //查询不同状态的问诊记录
    public List<Interrogation> findInterrogationByAnyStatus(Interrogation interrogation);
    //查询多个问诊记录
    public List<Interrogation> findInterrogationByIds(List<Integer> list);

    //删除单个问诊记录
    public int deleteInterrogationById(Integer id);
    //删除多个问诊记录
    public int deleteInterrogationByIds(List<Integer> list);

    //增加问诊记录
    public int insertInterrogation(Interrogation interrogation);
    //批量增加问诊记录
    public int insertManyInterrogation(List<Interrogation> list);

    //修改单条问诊记录
    public int updateInterrogationById(Interrogation interrogation);
    //修改多条问诊记录
    public int updateManyInterrogation(List<Interrogation> list);
}
