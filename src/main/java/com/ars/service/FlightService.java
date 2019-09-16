package com.ars.service;

import com.ars.entity.Flight;

import java.util.ArrayList;

public interface FlightService {
    Flight selectByPrimaryKey(Integer id);

    ArrayList<Flight> selectBySearch(Integer dp, Integer ap, String date);

    int updateByPrimaryKey(Flight record);
}
