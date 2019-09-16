package com.ars.utils;

import com.ars.entity.Booking;
import com.ars.entity.Flight;
import com.ars.entity.FlightBean;
import com.ars.service.BookingService;
import com.ars.service.FlightService;
import com.ars.service.UserService;
import com.ars.utils.Maths.Maths;
import com.ars.utils.Maths.Similarity;
import com.ars.utils.Maths.Vector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class FlightRecommendation {

    @Autowired
    private FlightService flightService;
    @Autowired
    private BookingService bookService;
    @Autowired
    private FlightPresentation flightPresentation;
    @Autowired
    private UserService userService;

    public ArrayList<FlightBean> initRecommendation (ArrayList<FlightBean> flightBeanList){
        flightBeanList = Maths.flightNormalized(flightBeanList);
        ArrayList<Flight> temp = new ArrayList<>();
        ArrayList<Booking> bookingList = bookService.selectAll();
        for(Booking b : bookingList){
            temp.add(flightService.selectByPrimaryKey(b.getFlightId()));
        }
        ArrayList<FlightBean> flightUserList = Maths.flightNormalized(flightPresentation.transfer(temp));
        double x = 0.0;
        double y = 0.0;
        for(FlightBean f : flightUserList){
            x += f.getPrice_n();
            y += f.getTime_n();
    }
        x = x / flightUserList.size();
        y = y / flightUserList.size();
        Vector vector = new Vector(x, y);
        return Similarity.ed(flightBeanList, vector);
    }

    public ArrayList<FlightBean> cfRecommendation (ArrayList<FlightBean> flightBeanList, int userId){
        int user_num = userService.queryUserCount().size();
        double rate;
        for(FlightBean x : flightBeanList){
            int recordSize = bookService.selectBySearch(userId, x.getId()).size();
            if(recordSize!=0){
                if(recordSize>4){
                    rate = 5;
                }else if(recordSize>3){
                    rate = 4;
                }else if(recordSize>2){
                    rate = 3;
                }else if(recordSize>1){
                    rate = 2;
                }else {
                    rate = 1;
                }
                x.setSort(x.getSort() - rate*0.06);
            }else {
                double simTotal = 0.0;
                double rateTotal = 0.0;
                double[] rateX = new double[user_num];
                for (int i = 0; i < user_num; i++) {
                    int count = bookService.selectBySearch(i + 2, x.getId()).size();
                    if (count != 0) {
                        if (count > 4) {
                            rateX[i] = 5;
                        } else if (count > 3) {
                            rateX[i] = 4;
                        } else if (count > 2) {
                            rateX[i] = 3;
                        } else if (count > 1) {
                            rateX[i] = 2;
                        } else {
                            rateX[i] = 1;
                        }
                    }
                }

                for (FlightBean y : flightBeanList) {
                    if (y != x){
                        double[] rateY = new double[user_num];
                    for (int j = 0; j < user_num; j++) {
                        int count = bookService.selectBySearch(j + 2, y.getId()).size();
                        if (count != 0) {
                            if (count > 4) {
                                rateY[j] = 5;
                            } else if (count > 3) {
                                rateY[j] = 4;
                            } else if (count > 2) {
                                rateY[j] = 3;
                            } else if (count > 1) {
                                rateY[j] = 2;
                            } else {
                                rateY[j] = 1;
                            }
                        }
                    }
                    double sim = Similarity.pcc(rateX, rateY);
                    if (sim > 0 && sim < 1) {
                        simTotal += sim;
                        rateTotal += rateY[userId - 2] * sim;

                    }
                }
            }
                System.out.println();
                if(rateTotal!=0&&simTotal!=0)
                    x.setSort(x.getSort() - (rateTotal / simTotal)*0.06);

            }

        }
        return flightBeanList;
    }
}