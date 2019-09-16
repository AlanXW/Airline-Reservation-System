package com.ars.dao;

import com.ars.entity.Airport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface AirportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Airport record);

    int insertSelective(Airport record);

    Airport selectByPrimaryKey(Integer id);

    ArrayList<Airport> selectByName(String name);

    ArrayList<Airport> selectAll();

    Airport selectByAirport(String name);

    int updateByPrimaryKeySelective(Airport record);

    int updateByPrimaryKey(Airport record);
}