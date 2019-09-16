package com.ars.service.impl;

import com.ars.dao.UserMapper;
import com.ars.entity.User;
import com.ars.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper mapper;
    @Override
    public int insert(User record){
        return mapper.insert(record);
    }

    @Override
    public ArrayList<User> queryUserCount() {
        return mapper.queryUserCount();
    }

    @Override
    public User selectByUsername(String username) {
        return mapper.selectByUsername(username);
    }
}
