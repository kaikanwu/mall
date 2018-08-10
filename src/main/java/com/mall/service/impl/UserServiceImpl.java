package com.mall.service.impl;

import com.mall.dao.UserMapper;
import com.mall.pojo.User;
import com.mall.pojo.UserExample;
import com.mall.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    UserMapper userMapper;



    @Override
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);

    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List list() {
        UserExample userExample = new UserExample();
        userExample.setOrderByClause("id desc");


        return userMapper.selectByExample(userExample);
    }


    @Override
    public boolean checkUsername(String name) {

        UserExample userExample = new UserExample();
        userExample.createCriteria().andNameEqualTo(name);
        List<User> userList = userMapper.selectByExample(userExample);

        if (userList.isEmpty())
            return false;
        return true;

    }

    @Override
    public User checkLogin(String username, String password) {

        UserExample userExample = new UserExample();

        userExample.createCriteria().andNameEqualTo(username).andPasswordEqualTo(password);
        List<User> userList = userMapper.selectByExample(userExample);
        if (userList.isEmpty()) {
            return null;
        }

        return userList.get(0);
    }

}
