package com.ars.service.impl;

import com.ars.dao.BookingMapper;
import com.ars.entity.Booking;
import com.ars.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    BookingMapper mapper;
    @Override
    public int insert(Booking record) {
        return mapper.insert(record);
    }

    @Override
    public Booking selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public ArrayList<Booking> selectBySearch(Integer userId, Integer flightId) {
        return mapper.selectBySearch(userId, flightId);
    }

    @Override
    public ArrayList<Booking> selectByUserId(Integer userId) {
        return mapper.selectByUserId(userId);
    }

    @Override
    public ArrayList<Booking> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }
}
