package com.ars.controller;

import com.ars.entity.Booking;
import com.ars.entity.Flight;
import com.ars.entity.Transaction;
import com.ars.entity.User;
import com.ars.service.BookingService;
import com.ars.service.FlightService;
import com.ars.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class bookingController {

    @Autowired
    private FlightService flightService;
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private BookingService bookingService;

    @RequestMapping(value="/booking/add", method = RequestMethod.GET)
    public String booking(@RequestParam(value="flightId") int flightId, HttpSession session){
        User user = (User) session.getAttribute("user");
        Date time = new Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(time.getTime());
        Flight flight = flightService.selectByPrimaryKey(flightId);
        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setFlightId(flightId);
        booking.setDatetime(timestamp);
        bookingService.insert(booking);
        flight.setTicketNumber(flight.getTicketNumber()-1);
        flightService.updateByPrimaryKey(flight);
        Transaction transaction = new Transaction();
        transaction.setUserId(user.getId());
        transaction.setFlightId(flightId);
        transaction.setDescription("add");
        transaction.setDatetime(timestamp);
        transactionService.insert(transaction);
        return "redirect:/flight/user";
    }

    @RequestMapping(value="/booking/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="bookingId") int bookingId){
        Booking booking = bookingService.selectByPrimaryKey(bookingId);
        Flight flight = flightService.selectByPrimaryKey(booking.getFlightId());
        Date time = new Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(time.getTime());
        Transaction transaction = new Transaction();
        transaction.setUserId(booking.getUserId());
        transaction.setFlightId(booking.getFlightId());
        transaction.setDescription("delete");
        transaction.setDatetime(timestamp);
        transactionService.insert(transaction);
        ArrayList<Transaction> tq = transactionService.selectByFlightIdQueue(flight.getId());
        if(flight.getTicketNumber() == 0 && tq != null && tq.size() != 0){
            Transaction transactionQueue = tq.get(0);
            Booking bookingQueue = new Booking();
            bookingQueue.setUserId(transactionQueue.getUserId());
            bookingQueue.setFlightId(transactionQueue.getFlightId());
            bookingQueue.setDatetime(timestamp);
            bookingService.insert(bookingQueue);
            Transaction transactionNew = new Transaction();
            transactionNew.setUserId(transactionQueue.getUserId());
            transactionNew.setFlightId(transactionQueue.getFlightId());
            transactionNew.setDescription("add");
            transactionNew.setDatetime(timestamp);
            transactionService.insert(transactionNew);
            transactionService.deleteByPrimaryKey(transactionQueue.getId());
        }else{
            flight.setTicketNumber(flight.getTicketNumber()+1);
            flightService.updateByPrimaryKey(flight);
        }
        bookingService.deleteByPrimaryKey(bookingId);
        return "redirect:/flight/user";
    }

    @RequestMapping(value="/booking/queue", method = RequestMethod.GET)
    public String queue(@RequestParam(value="flightId") int flightId, HttpSession session){
        User user = (User) session.getAttribute("user");
        Date time = new Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(time.getTime());
        Transaction transaction = new Transaction();
        transaction.setUserId(user.getId());
        transaction.setFlightId(flightId);
        transaction.setDescription("queue");
        transaction.setDatetime(timestamp);
        transactionService.insert(transaction);
        return "redirect:/flight/user";
    }

    @RequestMapping(value="/booking/cancel", method = RequestMethod.GET)
    public String cancel(@RequestParam(value="transactionId") int transactionId){
        transactionService.deleteByPrimaryKey(transactionId);
        return "redirect:/flight/user";
    }
}
