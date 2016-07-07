package com.dessert.service.impl;

import com.dessert.dao.StoreDao;
import com.dessert.model.Good;
import com.dessert.model.SaleGood;
import com.dessert.model.Saleorder;
import com.dessert.model.Sorderitem;
import com.dessert.service.StoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/3/16.
 */
@Transactional
@Service("storeService")
public class StoreServiceImpl implements StoreService {

    @Resource
    StoreDao storeDao;

    @Override
    public List<Good> getSaleGoods(String category) {
        return storeDao.getSaleGoods(category);
    }

    @Override
    public List<SaleGood> getSaleGoods(String category, int shopid) {
        return storeDao.getSaleGoods(category,shopid);
    }

    @Override
    public Good find(int gid) {
        return storeDao.find(gid);
    }

    @Override
    public SaleGood getSG(int sgid) {
        return storeDao.getSG(sgid);
    }

    @Override
    public String addSaleRecord(Saleorder saleorder, List<Sorderitem> list) {
        return storeDao.addSaleRecord(saleorder,list);
    }

//    @Override
//    public String saleBuy(String email,List<Item> shoppingcart, double total_price) {
//        return storeDao.saleBuy(email,shoppingcart,total_price);
//    }

    @Override
    public List<Saleorder> getOrders(String email) {
        return storeDao.getOrders(email);
    }

    @Override
    public List<Sorderitem> getOrderItems(int soid) {
        return storeDao.getOrderItems(soid);
    }
}
