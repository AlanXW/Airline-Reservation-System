package com.ars.service;

import com.ars.entity.Booking;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BookingService {
    int insert(Booking record);

    Booking selectByPrimaryKey(Integer id);

    ArrayList<Booking> selectBySearch(@Param("userId") Integer userId, @Param("flightId") Integer flightId);

    ArrayList<Booking> selectByUserId(Integer userId);

    ArrayList<Booking> selectAll();

    int deleteByPrimaryKey(Integer id);
}
