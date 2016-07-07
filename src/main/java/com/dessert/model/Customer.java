package com.dessert.model;

/**
 * Created by cristph on 2016/6/18.
 */
public class Customer {

    int customerid;
    String sex;
    String marriage;
    String time;
    String cream_cake;
    String chocolate_cake;
    String sweet_bread;
    String salty_bread;
    String biscuit;
    String milky_tea;
    String black_tea;
    String milk;
    int cluster;

    public Customer(int customerid,String temp,int cluster){
        this.customerid=customerid;
        this.cluster=cluster;

        String t[]=temp.split(",");
        this.sex=t[0];
        this.marriage=t[1];
        this.time=t[2];
        this.cream_cake=t[3];
        this.chocolate_cake=t[4];
        this.sweet_bread=t[5];
        this.salty_bread=t[6];
        this.biscuit=t[7];
        this.milky_tea=t[8];
        this.black_tea=t[9];
        this.milk=t[10];
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMarriage() {
        return marriage;
    }

    public void setMarriage(String marriage) {
        this.marriage = marriage;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCream_cake() {
        return cream_cake;
    }

    public void setCream_cake(String cream_cake) {
        this.cream_cake = cream_cake;
    }

    public String getChocolate_cake() {
        return chocolate_cake;
    }

    public void setChocolate_cake(String chocolate_cake) {
        this.chocolate_cake = chocolate_cake;
    }

    public String getSweet_bread() {
        return sweet_bread;
    }

    public void setSweet_bread(String sweet_bread) {
        this.sweet_bread = sweet_bread;
    }

    public String getSalty_bread() {
        return salty_bread;
    }

    public void setSalty_bread(String salty_bread) {
        this.salty_bread = salty_bread;
    }

    public String getBiscuit() {
        return biscuit;
    }

    public void setBiscuit(String biscuit) {
        this.biscuit = biscuit;
    }

    public String getMilky_tea() {
        return milky_tea;
    }

    public void setMilky_tea(String milky_tea) {
        this.milky_tea = milky_tea;
    }

    public String getBlack_tea() {
        return black_tea;
    }

    public void setBlack_tea(String black_tea) {
        this.black_tea = black_tea;
    }

    public String getMilk() {
        return milk;
    }

    public void setMilk(String milk) {
        this.milk = milk;
    }

    public int getCluster() {
        return cluster;
    }

    public void setCluster(int cluster) {
        this.cluster = cluster;
    }
}
