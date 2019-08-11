package com.java.mapper;

import com.java.pojo.Carousel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface CarouselMapper {
    //增
    int add(Carousel carousel);

    //删
    int delete(Carousel carousel);

    //批量删
    int batchDelete(String [] id);

    //改
    int update(Carousel carousel);

    //查所有
    List<Carousel> findAll();
}
