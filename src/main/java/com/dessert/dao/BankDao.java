package com.dessert.dao;

import com.dessert.model.Chargerecord;

import java.util.List;

/**
 * Created by cristph on 2016/3/13.
 */
public interface BankDao {

    public String getMomey(int bid,String pswd,double money);

    public String addChargeRecord(String email,double money);

    public List<Chargerecord> getChargeRecord(String email);
}
