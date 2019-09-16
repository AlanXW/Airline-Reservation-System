package com.ars.dao;

import com.ars.entity.Airline;
import org.springframework.stereotype.Repository;

@Repository
public interface AirlineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Airline record);

    int insertSelective(Airline record);

    Airline selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Airline record);

    int updateByPrimaryKey(Airline record);
}