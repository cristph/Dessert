package com.dessert.dao;

import com.dessert.model.Vip;

/**
 * Created by cristph on 2016/3/12.
 */
public interface VipDao {
    public Vip find(String vid);

    public Vip findByEmail(String email);

    public String add(Vip vip);

    public String chargeMoney(String email,double money);

    public String invokeVip(String email,double money);

    public String buy(String email,double money);
}
