package com.ars.entity;

import java.util.Date;

public class Flight {
    private Integer id;

    private Integer airline;

    private Integer departureAirport;

    private Integer arrivalAirport;

    private Date departureTime;

    private Date arrivalTime;

    private String duration;

    private Float durationFloat;

    private Integer transitAirport;

    private Integer transitNumber;

    private Integer price;

    private String ticketClass;

    private Integer ticketNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAirline() {
        return airline;
    }

    public void setAirline(Integer airline) {
        this.airline = airline;
    }

    public Integer getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(Integer departureAirport) {
        this.departureAirport = departureAirport;
    }

    public Integer getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(Integer arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Float getDurationFloat() {
        return durationFloat;
    }

    public void setDurationFloat(Float durationFloat) {
        this.durationFloat = durationFloat;
    }

    public Integer getTransitAirport() {
        return transitAirport;
    }

    public void setTransitAirport(Integer transitAirport) {
        this.transitAirport = transitAirport;
    }

    public Integer getTransitNumber() {
        return transitNumber;
    }

    public void setTransitNumber(Integer transitNumber) {
        this.transitNumber = transitNumber;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getTicketClass() {
        return ticketClass;
    }

    public void setTicketClass(String ticketClass) {
        this.ticketClass = ticketClass;
    }

    public Integer getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(Integer ticketNumber) {
        this.ticketNumber = ticketNumber;
    }
}