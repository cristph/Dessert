package com.dessert.controller;

import com.dessert.model.SaleGood;
import com.dessert.model.Shop;

import java.util.List;

/**
 * Created by cristph on 2016/5/30.
 */
public class ProductPlanList {

    private List<SaleGood> saleGoodList;
    private int shopid;
    private int planid;
    private String email;
    private Shop shop;
    private String permission;

    public List<SaleGood> getSaleGoodArrayList() {
        return saleGoodList;
    }

    public void setSaleGoodArrayList(List<SaleGood> saleGoodList) {
        this.saleGoodList = saleGoodList;
    }

    public int getShopid() {
        return shopid;
    }

    public void setShopid(int shopid) {
        this.shopid = shopid;
    }

    public int getPlanid() {
        return planid;
    }

    public void setPlanid(int planid) {
        this.planid = planid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
