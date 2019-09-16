package com.ars.service.impl;

import com.ars.dao.AirlineMapper;
import com.ars.entity.Airline;
import com.ars.service.AirlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AirlineServiceImpl implements AirlineService {

    @Autowired
    AirlineMapper mapper;

    @Override
    public int insert(Airline record) {
        return mapper.insert(record);
    }

    @Override
    public Airline selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }
}
