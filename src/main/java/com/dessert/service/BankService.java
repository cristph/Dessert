package com.dessert.service;

import com.dessert.model.Chargerecord;

import java.util.List;

/**
 * Created by cristph on 2016/3/13.
 */
public interface BankService {

    public String getMoney(int bid,String pswd,double money);

    public String addChargeRecord(String email,double money);

    public List<Chargerecord> getChargeRecord(String email);
}
