package com.dessert.dao;

import com.dessert.model.Good;
import com.dessert.model.User;
import com.dessert.model.Waiter;

import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */
public interface WaiterDao {

    public List<User> getWaiters(int shopid);

    public String createWaiter(User u,int shopid);

//    public String delWaiter(int wid);

    public String delWaiter(String wemail);

    public String addProduct(Good good);

    public List<Good> getProductList(String category);

    public int getshopid(String email);
}
