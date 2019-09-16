package com.ars.utils;

import com.ars.entity.FlightBean;

import java.util.ArrayList;

public class FlightSort {
    public ArrayList<FlightBean> sortByLowPrice(ArrayList<FlightBean> flightList){
        for(int i =1;i<flightList.size();i++) {
            for(int j=0;j<flightList.size()-i;j++) {
                if(flightList.get(j).getPrice() > flightList.get(j+1).getPrice()) {
                    FlightBean temp = flightList.get(j);
                    flightList.set(j, flightList.get(j+1));
                    flightList.set(j+1, temp);
                }
            }
        }
        return flightList;
    }
    public ArrayList<FlightBean> sortByHighPrice(ArrayList<FlightBean> flightList){
        for(int i =1;i<flightList.size();i++) {
            for(int j=0;j<flightList.size()-i;j++) {
                if(flightList.get(j).getPrice() < flightList.get(j+1).getPrice()) {
                    FlightBean temp = flightList.get(j);
                    flightList.set(j, flightList.get(j+1));
                    flightList.set(j+1, temp);
                }
            }
        }
        return flightList;
    }
    public ArrayList<FlightBean> sortByTime(ArrayList<FlightBean> flightList){
        for(int i =1;i<flightList.size();i++) {
            for(int j=0;j<flightList.size()-i;j++) {
                if(flightList.get(j).getDurationFloat() > flightList.get(j+1).getDurationFloat()) {
                    FlightBean temp = flightList.get(j);
                    flightList.set(j, flightList.get(j+1));
                    flightList.set(j+1, temp);
                }
            }
        }
        return flightList;
    }
    public ArrayList<FlightBean> sortBySimilarity(ArrayList<FlightBean> flightList){
        for(int i =1;i<flightList.size();i++) {
            for(int j=0;j<flightList.size()-i;j++) {
                if(flightList.get(j).getSort() > flightList.get(j+1).getSort()) {
                    FlightBean temp = flightList.get(j);
                    flightList.set(j, flightList.get(j+1));
                    flightList.set(j+1, temp);
                }
            }
        }
        return flightList;
    }
}
