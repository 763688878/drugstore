package com.java.service;

import com.java.pojo.Carousel;

import java.util.List;

public interface CarouselService {
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
