package com.ars.dao;

import com.ars.entity.Flight;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface FlightMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Flight record);

    int insertSelective(Flight record);

    Flight selectByPrimaryKey(Integer id);

    ArrayList<Flight> selectBySearch(@Param("departure") Integer dp, @Param("arrival") Integer ap, @Param("departure-time") String date);

    int updateByPrimaryKeySelective(Flight record);

    int updateByPrimaryKey(Flight record);
}