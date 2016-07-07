package com.dessert.service;

import com.dessert.model.Vip;

/**
 * Created by cristph on 2016/3/12.
 */
public interface VipService {

    public Vip find(String vid);

    public Vip findByEmail(String email);

    public String add(Vip vip);

    public String chargeMoney(String email,double money);

    public String invokeVip(String email,double money);

    public String buy(String email,double money);
}
