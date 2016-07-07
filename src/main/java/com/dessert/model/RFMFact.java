package com.dessert.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by cristph on 2016/6/12.
 */

@Entity
@Table(name = "fact_rfm")
public class RFMFact {
    @Id
    private int customerid;
    private int days;
    private int times;
    private double money;

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "RFMFact{" +
                "customerid=" + customerid +
                ", days=" + days +
                ", times=" + times +
                ", money=" + money +
                '}';
    }
}
