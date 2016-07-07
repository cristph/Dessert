package com.dessert.service.impl;

import com.dessert.dao.WaiterDao;
import com.dessert.model.Good;
import com.dessert.model.User;
import com.dessert.service.WaiterService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */

@Transactional
@Service("waiterService")
public class WaiterServiceImpl implements WaiterService {

    @Resource
    WaiterDao waiterDao;

    @Override
    public List<User> getWaiters(int shopid) {
        return waiterDao.getWaiters(shopid);
    }

    @Override
    public String createWaiter(User u, int shopid) {
        return waiterDao.createWaiter(u,shopid);
    }

    @Override
    public String delWaiter(String wemail) {
        return waiterDao.delWaiter(wemail);
    }

//    @Override
//    public String delWaiter(int wid) {
//        return waiterDao.delWaiter(wid);
//    }

    @Override
    public String addProduct(Good good) {
        return waiterDao.addProduct(good);
    }

    @Override
    public List<Good> getProductList(String category) {
        return waiterDao.getProductList(category);
    }

    @Override
    public int getshopid(String email) {
        return waiterDao.getshopid(email);
    }
}
