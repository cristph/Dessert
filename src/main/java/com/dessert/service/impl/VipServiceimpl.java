package com.dessert.service.impl;

import com.dessert.dao.VipDao;
import com.dessert.model.Vip;
import com.dessert.service.VipService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/3/12.
 */
@Transactional
@Service("vipService")
public class VipServiceimpl implements VipService {

    @Resource
    private VipDao vipDao;

    @Override
    public Vip find(String vid) {
        return vipDao.find(vid);
    }

    @Override
    public Vip findByEmail(String email) {
        return vipDao.findByEmail(email);
    }

    @Override
    public String add(Vip vip) {
        return vipDao.add(vip);
    }

    @Override
    public String chargeMoney(String email, double money) {
        return vipDao.chargeMoney(email,money);
    }

    @Override
    public String invokeVip(String email, double money) {
        return vipDao.invokeVip(email,money);
    }

    @Override
    public String buy(String email, double money) {
        return vipDao.buy(email,money);
    }
}
