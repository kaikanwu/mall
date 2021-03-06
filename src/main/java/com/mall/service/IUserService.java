package com.mall.service;

import com.mall.pojo.User;

import java.util.List;

public interface IUserService {
    void add(User user);

    void delete(int id);

    User get(int id);

    void update(User user);

    List list();

    boolean checkUsername(String name);

    //for check user
    User checkLogin(String username, String password);
}
