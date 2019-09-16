package com.ars.service;

import com.ars.entity.Airline;

public interface AirlineService {
    int insert(Airline record);

    Airline selectByPrimaryKey(Integer id);
}
