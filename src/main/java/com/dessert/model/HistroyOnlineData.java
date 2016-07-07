package com.dessert.model;

/**
 * Created by cristph on 2016/6/10.
 */
public class HistroyOnlineData {
    String[] date;
    double[] data1;//online
    double[] data2;//offline

    public String[] getDate() {
        return date;
    }

    public void setDate(String[] date) {
        this.date = date;
    }

    public double[] getData1() {
        return data1;
    }

    public void setData1(double[] data1) {
        this.data1 = data1;
    }

    public double[] getData2() {
        return data2;
    }

    public void setData2(double[] data2) {
        this.data2 = data2;
    }
}
