package com.ars.service.impl;

import com.ars.dao.AirportMapper;
import com.ars.entity.Airport;
import com.ars.service.AirportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AirportServiceImpl implements AirportService {

    @Autowired
    AirportMapper mapper;

    @Override
    public int insert(Airport record) {
        return 0;
    }

    @Override
    public Airport selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public Airport selectByAirport(String name) {
        return mapper.selectByAirport(name);
    }

    @Override
    public ArrayList<Airport> selectByName(String name) {
        return mapper.selectByName(name);
    }

    @Override
    public ArrayList<Airport> selectAll() {
        return mapper.selectAll();
    }
}
