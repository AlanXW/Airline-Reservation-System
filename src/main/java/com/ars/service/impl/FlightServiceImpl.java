package com.ars.service.impl;

import com.ars.dao.FlightMapper;
import com.ars.entity.Flight;
import com.ars.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper mapper;

    @Override
    public Flight selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public ArrayList<Flight> selectBySearch(Integer dp, Integer ap, String date) {
        return mapper.selectBySearch(dp, ap, date);
    }

    @Override
    public int updateByPrimaryKey(Flight record) {
        return mapper.updateByPrimaryKey(record);
    }

}
