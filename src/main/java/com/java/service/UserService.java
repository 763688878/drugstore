package com.java.service;

import com.java.pojo.User;

public interface UserService {
    //根据tel查询
    User findOneByTel(String tel);
}
