package com.dessert.controller;

import com.dessert.model.Saleorder;
import com.dessert.model.Shop;

import java.util.List;

/**
 * Created by cristph on 2016/5/31.
 */
public class Order {
    private Saleorder saleorder;
    private List<ShoppingCartItem> shoppingCartItemArrayList;
    private Shop shop;

    public Saleorder getSaleorder() {
        return saleorder;
    }

    public void setSaleorder(Saleorder saleorder) {
        this.saleorder = saleorder;
    }

    public List<ShoppingCartItem> getShoppingCartItemArrayList() {
        return shoppingCartItemArrayList;
    }

    public void setShoppingCartItemArrayList(List<ShoppingCartItem> shoppingCartItemArrayList) {
        this.shoppingCartItemArrayList = shoppingCartItemArrayList;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
}
