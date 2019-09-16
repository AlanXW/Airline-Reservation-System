package com.ars.utils.Maths;

import com.ars.entity.FlightBean;

import java.util.ArrayList;

public class Similarity {
    public static ArrayList<FlightBean> ed(ArrayList<FlightBean> flightBeanList, Vector vector){
        for(FlightBean flightBean: flightBeanList){
            double p = flightBean.getPrice_n() / vector.x;
            double t = flightBean.getTime_n() / vector.y;
            double distance = Math.sqrt((p*p)+(t*t))*vector.x*vector.y;
            flightBean.setSort(distance);
        }
        return flightBeanList;
    }

    public static double pcc(double[] x, double[] y){
        double covXY = Maths.cov(x,y);
        double stdX = Maths.std(x);
        double stdY = Maths.std(y);
        if(covXY*stdX*stdY == 0)
            return 0;
        else
            return covXY/(stdX*stdY);
    }
    public static ArrayList<FlightBean> cosSimilarity(ArrayList<FlightBean> flightBeanList, Vector vector){
        for(FlightBean flightBean: flightBeanList){
            double normA = Math.sqrt(flightBean.getPrice_n()*flightBean.getPrice_n()+flightBean.getTime_n()*flightBean.getTime_n());
            double normB = Math.sqrt(vector.x*vector.x+vector.y*vector.y);
            flightBean.setSort((flightBean.getPrice_n()*vector.x+flightBean.getTime_n()*vector.y)/(normA*normB));
        }
        return flightBeanList;
    }
}
