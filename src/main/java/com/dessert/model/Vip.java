package com.dessert.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

/**
 * Created by cristph on 2016/3/12.
 */
@Table(name="vip")
@Entity
public class Vip {

    @Id
    private String vid; //会员卡序列号
    private String email;
    private int level; //会员等级，0为未激活
    private String vipstate; //见constant
    private Date signindate;
    private Date deadline;
    private double money;
    private double discount;
    private int score;
    private double chargemoney;

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email=email;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getVipstate() {
        return vipstate;
    }

    public void setVipstate(String vipstate) {
        this.vipstate = vipstate;
    }

    public Date getSignindate() {
        return signindate;
    }

    public void setSignindate(Date signindate) {
        this.signindate = signindate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public double getChargemoney() {
        return chargemoney;
    }

    public void setChargemoney(double chargemoney) {
        this.chargemoney = chargemoney;
    }
}
