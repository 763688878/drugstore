package com.java.service.impl;

import com.java.mapper.CarouselMapper;
import com.java.pojo.Carousel;
import com.java.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CarouselServiceImpl implements CarouselService {
    @Autowired
    private CarouselMapper carouselMapper;
    //增
    public int add(Carousel carousel) {
        return carouselMapper.add(carousel);
    }

    //删
    public int delete(Carousel carousel) {
        return carouselMapper.delete(carousel);
    }

    @Override
    public int batchDelete(String[] id) {
        return carouselMapper.batchDelete(id);
    }

    //改
    public int update(Carousel carousel) {
        return carouselMapper.update(carousel);
    }

    //查所有
    public List<Carousel> findAll() {
        return carouselMapper.findAll();
    }
}
