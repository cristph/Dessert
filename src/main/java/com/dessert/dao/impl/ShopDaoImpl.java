package com.dessert.dao.impl;

import com.dessert.controller.ProductPlanList;
import com.dessert.dao.ShopDao;
import com.dessert.model.Good;
import com.dessert.model.SaleGood;
import com.dessert.model.SalePlan;
import com.dessert.model.Shop;
import com.dessert.util.Constant;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */

@Repository
public class ShopDaoImpl implements ShopDao {

    @Resource
    SessionFactory sessionFactory;


    @Override
    public Shop getShop(int shopid) {
        Session session=sessionFactory.openSession();
        String hql="from Shop  where shopid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,shopid);
        List<Shop> list=query.list();
        Shop shop=list.get(0);
        session.close();
        return shop;
    }

    @Override
    public List<Shop> getShops() {
        Session session=sessionFactory.openSession();
        String hql="select s from Shop s";
        Query query=session.createQuery(hql);
        List<Shop> list=query.list();
        session.close();
        return list;
    }

    @Override
    public String add(Shop shop) {
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(shop);
        }catch (Exception e){
            e.printStackTrace();
            session.close();
            return Constant.method_execute_fail;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }

    @Override
    public String del(int shopid) {
        Session session=sessionFactory.openSession();
        String hql="delete from Shop where shopid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,shopid);
        query.executeUpdate();
        session.close();
        return Constant.method_exceute_success;
    }

//    @Override
//    public String addPaln(Good good, SalePlan salePlan, int num, double price) {
//        addGood(good);
//        addSalePlan(salePlan);
//
//        Session session=sessionFactory.openSession();
//        String hql="from Good where gname=? and price=?";
//        Query query=session.createQuery(hql);
//        query.setString(0,good.getGname());
//        query.setDouble(1,good.getPrice());
//        List<Good> glist=query.list();
//        Good good1=glist.get(0);
//        int gid=good1.getGid();
//
//        hql="from SalePlan where wemail=?";
//        query=session.createQuery(hql);
//        query.setString(0,salePlan.getWemail());
//        List<SalePlan> plist=query.list();
//        SalePlan salePlan1=plist.get(0);
//        int planid=salePlan1.getPlanid();
//        session.close();
//
//        SaleGood saleGood=new SaleGood();
//        saleGood.setPrice(price);
//        saleGood.setGid(gid);
//        saleGood.setNum(num);
//        saleGood.setPlanid(planid);
//
//        addSaleGood(saleGood);
//
//        return Constant.method_exceute_success;
//
//    }


    @Override
    public String permit(int planid) {
        Session session=sessionFactory.openSession();
        String hql="update SalePlan set permission=? where planid=?";
        try{
            session.beginTransaction();
            Query query=session.createQuery(hql);
            query.setString(0,Constant.sale_plan_permitted);
            query.setInteger(1,planid);
            query.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            session.close();
            return Constant.method_exceute_success;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }

    @Override
    public Good getGood(int gid) {
        Session session=sessionFactory.openSession();
        String hql="from Good where gid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,gid);
        List<Good> list=query.list();
        if(list.size()>0){
            Good good=list.get(0);
            return good;
        }
        return null;
    }

    @Override
    public String addProductPlan(ProductPlanList productPlanList) {
        Session session=sessionFactory.openSession();
        SalePlan salePlan=new SalePlan();
        salePlan.setShopid(productPlanList.getShopid());
        salePlan.setWemail(productPlanList.getEmail());
        salePlan.setPermission(Constant.sale_plan_not_permitted);
        long a=System.currentTimeMillis();
        String str=String.valueOf(a);
        salePlan.setCreateDate(str);
        session.beginTransaction();
        session.save(salePlan);
        session.getTransaction().commit();
        session.close();

        session=sessionFactory.openSession();
        String hql="from SalePlan where createDate=?";
        Query query=session.createQuery(hql);
        query.setString(0,str);
        List<SalePlan> salePlanList=query.list();
        int planId=salePlanList.get(0).getPlanid();
        session.close();

        List<SaleGood> saleGoodArrayList=productPlanList.getSaleGoodArrayList();
        for(SaleGood saleGood:saleGoodArrayList){
            saleGood.setPlanid(planId);
            addSaleGood(saleGood);
        }
        return Constant.method_exceute_success;
    }

    @Override
    public List<ProductPlanList> getProductPlan() {
        Session session=sessionFactory.openSession();
        String hql="select s from SalePlan s";
        Query query=session.createQuery(hql);
        List<SalePlan> salePlanList=query.list();

        List<ProductPlanList> productPlanLists=new ArrayList<>();

        for(SalePlan salePlan:salePlanList){
            int planid=salePlan.getPlanid();
            hql="from SaleGood where planid=?";
            query=session.createQuery(hql);
            query.setInteger(0,planid);

            ProductPlanList productPlanList=new ProductPlanList();
            List<SaleGood> saleGoodList=query.list();
            productPlanList.setSaleGoodArrayList(saleGoodList);
            productPlanList.setShop(getShop(salePlan.getShopid()));
            productPlanList.setShopid(salePlan.getShopid());
            productPlanList.setEmail(salePlan.getWemail());
            productPlanList.setPermission(salePlan.getPermission());
            productPlanList.setPlanid(salePlan.getPlanid());

            productPlanLists.add(productPlanList);
        }
        session.close();
        return productPlanLists;
    }

    private SalePlan getPlan(String date){
        Session session=sessionFactory.openSession();
        String hql="from SalePlan where createDate=?";
        Query query=session.createQuery(hql);
        query.setString(0,date);
        List<SalePlan> list=query.list();
        SalePlan salePlan=list.get(0);
        session.close();
        return salePlan;
    }

    private String addGood(Good good){
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(good);
        }catch (Exception e){
            e.printStackTrace();
            session.close();
            return Constant.method_execute_fail;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }

    private String addSalePlan(SalePlan salePlan){
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(salePlan);
        }catch (Exception e){
            e.printStackTrace();
            session.close();
            return Constant.method_execute_fail;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }

    private String addSaleGood(SaleGood saleGood){
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(saleGood);
        }catch (Exception e){
            e.printStackTrace();
            session.close();
            return Constant.method_execute_fail;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }
}
