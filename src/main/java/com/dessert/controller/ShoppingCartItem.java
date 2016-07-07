package com.dessert.controller;

import com.dessert.model.Good;
import com.dessert.model.Sorderitem;

/**
 * Created by cristph on 2016/5/31.
 */
public class ShoppingCartItem {

    private Sorderitem sorderitem;
    private Good good;

    public Sorderitem getSorderitem() {
        return sorderitem;
    }

    public void setSorderitem(Sorderitem sorderitem) {
        this.sorderitem = sorderitem;
    }

    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }
}
