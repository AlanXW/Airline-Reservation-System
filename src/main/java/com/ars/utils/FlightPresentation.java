package com.ars.utils;

import com.ars.entity.Flight;
import com.ars.entity.FlightBean;
import com.ars.service.AirlineService;
import com.ars.service.AirportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@Component
public class FlightPresentation {

    @Autowired
    private AirlineService airlineService;
    @Autowired
    private AirportService airportService;

    public ArrayList<FlightBean> transfer(ArrayList<Flight> flightList){
        ArrayList<FlightBean> flightBeanList = new ArrayList<FlightBean>();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Flight flight: flightList){
            FlightBean flightBean = new FlightBean();
            String[] departureDateAndTime = format.format(flight.getDepartureTime()).split(" ");
            String[] arrivalDateAndTime = format.format(flight.getArrivalTime()).split(" ");
            flightBean.setId(flight.getId());
            flightBean.setAirline(airlineService.selectByPrimaryKey(flight.getAirline()).getAirlineName());
            flightBean.setAirlineId(flight.getAirline());
            flightBean.setDepartureAirport(airportService.selectByPrimaryKey(flight.getDepartureAirport()).getAirportName());
            flightBean.setArrivalAirport(airportService.selectByPrimaryKey(flight.getArrivalAirport()).getAirportName());
            flightBean.setDepartureCity(airportService.selectByPrimaryKey(flight.getDepartureAirport()).getCity());
            flightBean.setArrivalCity(airportService.selectByPrimaryKey(flight.getArrivalAirport()).getCity());
            flightBean.setDepartureDate(departureDateAndTime[0]);
            flightBean.setDepartureTime(departureDateAndTime[1]);
            flightBean.setArrivalDate(arrivalDateAndTime[0]);
            flightBean.setArrivalTime(arrivalDateAndTime[1]);
            flightBean.setDuration(flight.getDuration());
            flightBean.setDurationFloat(flight.getDurationFloat());
            if(flight.getTransitAirport() != null)
                flightBean.setTransitAirport(airportService.selectByPrimaryKey(flight.getTransitAirport()).getAirportName());
            flightBean.setTransitNumber(flight.getTransitNumber());
            flightBean.setPrice(flight.getPrice());
            flightBean.setTicketClass(flight.getTicketClass());
            flightBean.setTicketNumber(flight.getTicketNumber());
            flightBeanList.add(flightBean);
        }
        return flightBeanList;
    }
}
