package com.ars.service;

import com.ars.entity.User;

import java.util.ArrayList;

public interface UserService {
    int insert(User record);

    ArrayList<User> queryUserCount();

    User selectByUsername(String username);
}
