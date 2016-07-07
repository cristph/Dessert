package com.dessert.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by cristph on 2016/3/16.
 */

@Entity
@Table(name = "sorderitem")
public class Sorderitem {

    @Id
    private int sorderitemid;
    private int gid;//标准商品，含有商品描述
    private int sgid;//产品计划中商品，按此购买
    private int qty;
    private double tprice;
    private int soid;

    public int getSorderitemid() {
        return sorderitemid;
    }

    public void setSorderitemid(int sorderitemid) {
        this.sorderitemid = sorderitemid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getTprice() {
        return tprice;
    }

    public void setTprice(double tprice) {
        this.tprice = tprice;
    }

    public int getSoid() {
        return soid;
    }

    public void setSoid(int soid) {
        this.soid = soid;
    }

    public int getSgid() {
        return sgid;
    }

    public void setSgid(int sgid) {
        this.sgid = sgid;
    }
}
