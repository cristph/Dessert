package com.dessert.service;

import com.dessert.model.Good;
import com.dessert.model.SaleGood;
import com.dessert.model.Saleorder;
import com.dessert.model.Sorderitem;

import java.util.List;

/**
 * Created by cristph on 2016/3/16.
 */
public interface StoreService {

    public List<Good> getSaleGoods(String category);

    public List<SaleGood> getSaleGoods(String category, int shopid);

    public Good find(int gid);

    public SaleGood getSG(int sgid);

//    public String saleBuy(String email,List<Item> shoppingcart, double total_price);

    public String addSaleRecord(Saleorder saleorder,List<Sorderitem> list);

    public List<Saleorder> getOrders(String email);

    public List<Sorderitem> getOrderItems(int soid);
}
