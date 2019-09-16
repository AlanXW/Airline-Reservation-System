package com.ars.utils.Maths;

import com.ars.entity.FlightBean;

import java.util.ArrayList;

public class Maths {

    public static double flightMax(ArrayList<Double> number){
        double max = number.get(0);
        for(double n : number){
            if(n > max){
                max = n;
            }
        }
        return max;
    }

    public static double flightMin(ArrayList<Double> number){
        double min = number.get(0);
        for(int i=1; i<number.size(); i++){
            if(number.get(i) < min){
                min = number.get(i);
            }
        }
        return min;
    }

    public static ArrayList<FlightBean> flightNormalized(ArrayList<FlightBean> flightBeanList){
        ArrayList<Double> priceList = new ArrayList<Double>();
        ArrayList<Double> timeList = new ArrayList<Double>();
        for (FlightBean flightBean : flightBeanList){
            priceList.add(Double.valueOf(flightBean.getPrice()));
            timeList.add(Double.valueOf(flightBean.getDurationFloat()));
        }
        double min_price = flightMin(priceList);
        double max_price = flightMax(priceList);
        double min_time = flightMin(timeList);
        double max_time = flightMax(timeList);
        for (FlightBean flightBean : flightBeanList) {
            flightBean.setPrice_n((flightBean.getPrice() - min_price) / (max_price - min_price));
            flightBean.setTime_n((flightBean.getDurationFloat() - min_time) / (max_time - min_time));
        }
        return flightBeanList;
    }

    public static double cov (double[] x, double[] y){
        double ex = 0.0;
        double ey = 0.0;
        double exy = 0.0;
        for(int i=0; i<x.length; i++){
            ex += x[i];
        }
        ex = ex/x.length;
        for(int i=0; i<y.length; i++){
            ey += y[i];
        }
        ey = ey/y.length;
        for(int i=0; i<x.length; i++){
            exy += x[i]*y[i];
        }
        exy = exy/x.length;
        return  exy-(ex*ey);
    }

    public static double std(double[] temp){
        double mean = 0.0;
        double result = 0.0;
        for(int n=0; n<temp.length; n++){
            mean += temp[n];
        }
        mean = mean/temp.length;
        for(int n=0; n<temp.length; n++){
            result += (temp[n]-mean)*(temp[n]-mean);
        }
        result = result/temp.length;
        return Math.sqrt(result);
    }
}
