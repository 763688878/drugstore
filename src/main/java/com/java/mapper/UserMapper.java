package com.java.mapper;

import com.java.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    //根据tel查询
    User findOneByTel(String tel);
}
