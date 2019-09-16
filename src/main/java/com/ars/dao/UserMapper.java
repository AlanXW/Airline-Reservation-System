package com.ars.dao;

import com.ars.entity.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByUsername(String username);

    ArrayList<User> queryUserCount();

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}