package com.dessert.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by cristph on 2016/6/5.
 */
@Entity
@Table(name = "product")
public class Product {

    @Id
    private int id;
    private String pid;
    private String name;
    private int barnum;
    private int barcontent;
    private int days;
    private int order;
    private String bianma;
    private String category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBarnum() {
        return barnum;
    }

    public void setBarnum(int barnum) {
        this.barnum = barnum;
    }

    public int getBarcontent() {
        return barcontent;
    }

    public void setBarcontent(int barcontent) {
        this.barcontent = barcontent;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", pid='" + pid + '\'' +
                ", name='" + name + '\'' +
                ", barnum=" + barnum +
                ", barcontent=" + barcontent +
                ", days=" + days +
                ", order=" + order +
                ", bianma='" + bianma + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
