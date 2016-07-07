package com.dessert.model;

/**
 * Created by cristph on 2016/6/12.
 */
public class RFM {

    private int customerid;
    private int days;
    private int times;
    private double money;
    private int R;
    private int F;
    private int M;
    private int RFM;
    private String description;

    public void updateRFM(){
        this.RFM=100*this.R+10*this.F+this.M;
    }

    public int updateDescription(double avgR,double avgF,double avgM){
        if(R>avgR){
            if(F>avgF){
                if(M>avgM){
                    //HHH
                    this.description="Important_Value_Customer";
                    return 7;
                }else {
                    //HHL
                    this.description="Normal_Value_Customer";
                    return 6;
                }
            }else {
                if(M>avgM){
                    //HLH
                    this.description="Important_Develop_Customer";
                    return 5;
                }else {
                    //HLL
                    this.description="Normal_Develop_Customer";
                    return 4;
                }
            }
        }else {
            if(F>avgF){
                if(M>avgM){
                    //LHH
                    this.description="Important_Keep_Customer";
                    return 3;
                }else {
                    //LHL
                    this.description="Normal_Keep_Customer";
                    return 2;
                }
            }else {
                if(M>avgM){
                    //LLH
                    this.description="Important_Retain_Customer";
                    return 1;
                }else {
                    //LLL
                    this.description="Normal_Retain_Customer";
                    return 0;
                }
            }
        }
    }

    public RFM(RFMFact rfmFact,int dayInterval,int timesInterval,int moneyInterval){
        this.customerid=rfmFact.getCustomerid();
        this.days=rfmFact.getDays();
        this.times=rfmFact.getTimes();
        this.money=rfmFact.getMoney();
        this.R= (days/dayInterval)+1;
        this.F= (times/timesInterval+1);
        this.M= ((int)money/moneyInterval)+1;
        this.RFM=100*R+10*F+M;
    }

    @Override
    public String toString() {
        return "RFM{" +
                "customerid=" + customerid +
                ", R=" + R +
                ", F=" + F +
                ", M=" + M +
                ", RFM=" + RFM +
                ", description='" + description + '\'' +
                '}';
    }

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

    public int getR() {
        return R;
    }

    public void setR(int r) {
        R = r;
    }

    public int getF() {
        return F;
    }

    public void setF(int f) {
        F = f;
    }

    public int getM() {
        return M;
    }

    public void setM(int m) {
        M = m;
    }

    public int getRFM() {
        return RFM;
    }

    public void setRFM(int RFM) {
        this.RFM = RFM;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
