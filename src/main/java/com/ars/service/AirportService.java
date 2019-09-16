package com.ars.service;

import com.ars.entity.Airport;

import java.util.ArrayList;

public interface AirportService {
    int insert(Airport record);

    Airport selectByPrimaryKey(Integer id);

    Airport selectByAirport(String name);

    ArrayList<Airport> selectByName(String name);

    ArrayList<Airport> selectAll();
}
