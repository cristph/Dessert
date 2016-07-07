package com.dessert.service;


import com.dessert.controller.ProductPlanList;
import com.dessert.model.Good;
import com.dessert.model.SalePlan;
import com.dessert.model.Shop;

import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */
public interface ShopService {

    public  Shop getShop(int shopid);

    public List<Shop> getShops();

    public String add(Shop shop);

    public String del(int shopid);

//    public String addPaln(Good good, SalePlan salePlan, int num, double price);

//    public List<PlanItem> planList(String wemail);
//
//    public List<PlanItem> planList();

    public List<ProductPlanList> getProductPlan();

    public String permit(int planid);

    public Good getGood(int gid);

    public String addProductPlan(ProductPlanList productPlanList);
}
