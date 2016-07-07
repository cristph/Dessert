package com.dessert.service.impl;

import com.dessert.controller.ProductPlanList;
import com.dessert.dao.ShopDao;
import com.dessert.model.Good;
import com.dessert.model.SalePlan;
import com.dessert.model.Shop;
import com.dessert.service.ShopService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */

@Transactional
@Service("shopService")
public class ShopServiceImpl implements ShopService {

    @Resource
    ShopDao shopDao;


    @Override
    public Shop getShop(int shopid) {
        return shopDao.getShop(shopid);
    }

    @Override
    public List<Shop> getShops() {
        return shopDao.getShops();
    }

    @Override
    public String add(Shop shop) {
        return shopDao.add(shop);
    }

    @Override
    public String del(int shopid) {
        return shopDao.del(shopid);
    }

//    @Override
//    public String addPaln(Good good, SalePlan salePlan, int num, double price) {
//        return shopDao.addPaln(good,salePlan,num,price);
//    }

    @Override
    public List<ProductPlanList> getProductPlan() {
        return shopDao.getProductPlan();
    }

//    @Override
//    public List<PlanItem> planList(String wemail) {
//        return shopDao.planList(wemail);
//    }
//
//    @Override
//    public List<PlanItem> planList() {
//        return shopDao.planList();
//    }

    @Override
    public String permit(int planid) {
        return shopDao.permit(planid);
    }

    @Override
    public Good getGood(int gid) {
        return shopDao.getGood(gid);
    }

    @Override
    public String addProductPlan(ProductPlanList productPlanList) {
        return shopDao.addProductPlan(productPlanList);
    }
}
