package com.ars.controller;

import com.ars.entity.*;
import com.ars.service.AirportService;
import com.ars.service.BookingService;
import com.ars.service.FlightService;
import com.ars.service.TransactionService;
import com.ars.utils.FlightPresentation;
import com.ars.utils.FlightRecommendation;
import com.ars.utils.FlightSort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@Controller
public class flightController {

    @Autowired
    private AirportService airportService;
    @Autowired
    private FlightService flightService;
    @Autowired
    private BookingService bookService;
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private FlightPresentation flightPresentation;
    @Autowired
    private FlightRecommendation flightRecommendation;

    @RequestMapping(value="/flight", method = RequestMethod.GET)
    public String getList(@RequestParam(value="departure") String dp, @RequestParam(value="arrival") String ap, @RequestParam(value="departure-time") String dt, HttpSession session, Model model){
        ArrayList<FlightBean> flightList = new ArrayList<FlightBean>();
        ArrayList<Airport> departureAirport = airportService.selectByName("%"+dp+"%");
        ArrayList<Airport> arrivalAirport = airportService.selectByName("%"+ap+"%");
        for(Airport d : departureAirport){
            for(Airport a : arrivalAirport){
                ArrayList<Flight> flight;
                flight = flightService.selectBySearch(d.getId(), a.getId(), "%"+dt+"%");
                if(flight != null && flight.size() != 0) {
                    flightList.addAll(flightPresentation.transfer(flight));
                }
            }
        }
        User user= (User)session.getAttribute("user");
        if(flightList.size()!=0){
            FlightSort flightSort = new FlightSort();
            flightList = flightRecommendation.initRecommendation(flightList);
            if(user != null){
                flightList = flightRecommendation.cfRecommendation(flightList, user.getId());
            }
            flightList = flightSort.sortBySimilarity(flightList);
            for(FlightBean flightBean : flightList){
                System.out.println(flightBean.getSort());
            }
        }
        session.setAttribute("flightList", flightList);
        model.addAttribute("list", flightList);
        return "list";
    }

    @RequestMapping(value="/flight/price/low", method = RequestMethod.GET)
    public String getListSortByLowPrice(HttpSession session, Model model){
        ArrayList<FlightBean> flightList = (ArrayList<FlightBean>)session.getAttribute("flightList");
        FlightSort flightSort = new FlightSort();
        flightList = flightSort.sortByLowPrice(flightList);
        model.addAttribute("list", flightList);
        return "list";
    }

    @RequestMapping(value="/flight/price/high", method = RequestMethod.GET)
    public String getListSortByHighPrice(HttpSession session, Model model){
        ArrayList<FlightBean> flightList = (ArrayList<FlightBean>)session.getAttribute("flightList");
        FlightSort flightSort = new FlightSort();
        flightList = flightSort.sortByHighPrice(flightList);
        model.addAttribute("list", flightList);
        return "list";
    }

    @RequestMapping(value="/flight/time", method = RequestMethod.GET)
    public String getListSortByTime(HttpSession session, Model model){
        ArrayList<FlightBean> flightList = (ArrayList<FlightBean>)session.getAttribute("flightList");
        FlightSort flightSort = new FlightSort();
        flightList = flightSort.sortByTime(flightList);
        model.addAttribute("list", flightList);
        return "list";
    }

    @RequestMapping(value="/flight/clazz", method = RequestMethod.GET)
    public String getListEconomy(@RequestParam(value="clazz") String clazz, HttpSession session, Model model){
        ArrayList<FlightBean> flightList = (ArrayList<FlightBean>)session.getAttribute("flightList");
        model.addAttribute("clazz", clazz);
        model.addAttribute("list", flightList);
        return "list";
    }

    @RequestMapping(value="/flight/connect", method = RequestMethod.GET)
    public String getListConnect(HttpSession session, Model model){
        ArrayList<FlightBean> flightList = (ArrayList<FlightBean>)session.getAttribute("flightList");
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ArrayList<Flight> flights = new ArrayList<>();
        String airportName1 = flightList.get(0).getDepartureAirport();
        String airportName2 = flightList.get(0).getArrivalAirport();
        Airport airport1 = airportService.selectByAirport(airportName1);
        Airport airport2 = airportService.selectByAirport(airportName2);
        double distance_d = Math.sqrt((airport1.getLatitude()-airport2.getLatitude())*(airport1.getLatitude()-airport2.getLatitude())+(airport1.getLongitude()-airport2.getLongitude())*(airport1.getLongitude()-airport2.getLongitude()));
        ArrayList<Airport> airportList = airportService.selectAll();
        ArrayList<Integer> airportId = new ArrayList();
        for(Airport a : airportList){
            double distance1 = Math.sqrt((airport1.getLatitude()-a.getLatitude())*(airport1.getLatitude()-a.getLatitude())+(airport1.getLongitude()-a.getLongitude())*(airport1.getLongitude()-a.getLongitude()));
            double distance2 = Math.sqrt((a.getLatitude()-airport2.getLatitude())*(a.getLatitude()-airport2.getLatitude())+(a.getLongitude()-airport2.getLongitude())*(a.getLongitude()-airport2.getLongitude()));
            if((distance1+distance2)<distance_d*2){
                airportId.add(a.getId());
            }
        }
        for(int a: airportId){
            ArrayList<Flight> flight1 = flightService.selectBySearch(airport1.getId(), a, flightList.get(0).getDepartureDate());
            ArrayList<Flight> flight2 = flightService.selectBySearch(a, airport2.getId(), flightList.get(0).getDepartureDate());
            for(Flight f1 : flight1)
                for(Flight f2 : flight2){
                    int t1 = Integer.parseInt(format.format(f1.getArrivalTime()).split(" ")[1].subSequence(0,2).toString());
                    int t2 = Integer.parseInt(format.format(f2.getDepartureTime()).split(" ")[1].subSequence(0,2).toString());
                    if(t2 > t1+1){
                        flights.add(f1);
                        flights.add(f2);
                    }
                }
        }
        model.addAttribute("list", flightList);
        model.addAttribute("list_connect", flightPresentation.transfer(flights));
        return "list";
    }

    @RequestMapping(value="/flight/user", method = RequestMethod.GET)
    public String getUserList(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        ArrayList<Booking> bookingList = bookService.selectByUserId(user.getId());
        ArrayList<Flight> flightList = new ArrayList<Flight>();
        ArrayList<Transaction> transactionList = transactionService.selectByUserIdQueue(user.getId());
        ArrayList<Flight> flightListQueue = new ArrayList<Flight>();
        for(Booking booking : bookingList){
            flightList.add(flightService.selectByPrimaryKey(booking.getFlightId()));
        }
        for(Transaction transaction : transactionList){
            flightListQueue.add(flightService.selectByPrimaryKey(transaction.getFlightId()));
        }
        ArrayList<FlightBean> flightBean = flightPresentation.transfer(flightList);
        ArrayList<FlightBean> flightBeanQueue = flightPresentation.transfer(flightListQueue);
        model.addAttribute("flightList", flightBean);
        model.addAttribute("flightListQueue", flightBeanQueue);
        model.addAttribute("bookingList", bookingList);
        model.addAttribute("transactionList", transactionList);
        return"user_list";
    }
}
