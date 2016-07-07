package com.dessert.service.impl;

import com.dessert.dao.BankDao;
import com.dessert.model.Chargerecord;
import com.dessert.service.BankService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/3/13.
 */
@Transactional
@Service("bankService")
public class BankServiceImpl implements BankService {

    @Resource
    BankDao bankDao;

    @Override
    public String getMoney(int bid, String pswd, double money) {
        return bankDao.getMomey(bid,pswd,money);
    }

    @Override
    public String addChargeRecord(String email, double money) {
        return bankDao.addChargeRecord(email,money);
    }

    @Override
    public List<Chargerecord> getChargeRecord(String email) {
        return bankDao.getChargeRecord(email);
    }
}
