package com.ars.dao;

import com.ars.entity.Booking;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface BookingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Booking record);

    int insertSelective(Booking record);

    Booking selectByPrimaryKey(Integer id);

    ArrayList<Booking> selectBySearch(@Param("userId") Integer userId, @Param("flightId") Integer flightId);

    ArrayList<Booking> selectByUserId(Integer userId);

    ArrayList<Booking> selectAll();

    int updateByPrimaryKeySelective(Booking record);

    int updateByPrimaryKey(Booking record);
}