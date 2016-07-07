package com.dessert.dao.impl;


import com.dessert.dao.StoreDao;
import com.dessert.model.Good;
import com.dessert.model.SaleGood;
import com.dessert.model.Saleorder;
import com.dessert.model.Sorderitem;
import com.dessert.util.Constant;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by cristph on 2016/3/16.
 */
@Repository
public class StoreDaoImpl implements StoreDao {

    @Resource
    SessionFactory sessionFactory;

    @Override
    public List<Good> getSaleGoods(String category) {
        Session session=sessionFactory.openSession();
        String hql="from Good where category=?";
        Query query=session.createQuery(hql);
        query.setString(0,category);
        List<Good> list=query.list();
        if(list.size()>0){
            session.close();
            return list;
        }
        session.close();
        return list;
    }

    @Override
    public List<SaleGood> getSaleGoods(String category, int shopid) {
        Session session=sessionFactory.openSession();
        String hql="select sg from SaleGood sg,Good g where  planid in(select  planid from SalePlan where shopid=? and permission='permitted') and sg.gid=g.gid and g.category=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,shopid);
        query.setString(1,category);
        List<SaleGood> list=query.list();
        if(list.size()>0){
            session.close();
            return list;
        }
        session.close();
        return list;
    }

    @Override
    public Good find(int gid) {
        Session session=sessionFactory.openSession();
        String hql="from Good where gid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,gid);
        if (query.list().size()>0) {
            Good good=(Good)query.list().get(0);
            session.close();
            return good;
        }
        session.close();
        return null;
    }

    @Override
    public SaleGood getSG(int sgid) {
        Session session=sessionFactory.openSession();
        String hql="from SaleGood where sgid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,sgid);
        if (query.list().size()>0) {
            SaleGood good=(SaleGood)query.list().get(0);
            session.close();
            return good;
        }
        session.close();
        return null;
    }

    @Override
    public String addSaleRecord(Saleorder saleorder, List<Sorderitem> list) {
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        session.save(saleorder);
        session.getTransaction().commit();
        session.close();

        session=sessionFactory.openSession();
        String hql="from Saleorder where time=?";
        Query query=session.createQuery(hql);
        query.setString(0,saleorder.getTime());
        List<Saleorder> slist=query.list();
        Saleorder saleorder1=slist.get(0);
        int soid=saleorder1.getSoid();

//        System.out.println("<<<<<<<<<<in addSaleRecord method>>>>>>>>>>>>>>>>>");
//        System.out.println("<<<<<<<<<<soid:"+soid+">>>>>>>>>>>>>>>>>");

        for(Sorderitem sorderitem:list){
            sorderitem.setSoid(soid);
            addSorderitem(sorderitem);
        }
        session.close();
        return Constant.method_exceute_success;
    }

    public String addSorderitem(Sorderitem sorderitem){
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        session.save(sorderitem);
        session.getTransaction().commit();
        session.close();
//        System.out.println("<<<<<<<<<<<<add"+sorderitem.getGid()+">>>>>>>>>>>>>>>>>>");
        return Constant.method_exceute_success;
    }

//    @Override
//    public String saleBuy(String email,List<Item> shoppingcart, double total_price) {
//
//        Session session= sessionFactory.openSession();
//        Saleorder saleorder=new Saleorder();
//        saleorder.setTotalprice(total_price);
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date d=new Date();
//        String str=sdf.format(d);
//        saleorder.setTime(str);
//        saleorder.setEmail(email);
//
//        try {
//            session.beginTransaction();
//            session.save(saleorder);
//
//            String hql="from Saleorder where time=?";
//            Query query=session.createQuery(hql);
//            query.setString(0,str);
//            int soid;
//            if(query.list().size()>0){
//                Saleorder saleorder1=(Saleorder)query.list().get(0);
//                soid=saleorder1.getSoid();
//            }else{
//                soid=0;
//            }
//
//            System.out.println("//////////////////////////////get soid: "+soid);
//
//            for(Item item:shoppingcart){
//                addSorderItem(item,soid);
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            session.close();
//            return Constant.method_execute_fail;
//        }finally {
//            session.getTransaction().commit();
//            session.close();
//            return Constant.method_exceute_success;
//        }
//
//
//    }

    @Override
    public List<Saleorder> getOrders(String email) {
        Session session=sessionFactory.openSession();
        String hql="from Saleorder where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        List<Saleorder> list=(List<Saleorder>)query.list();
        if(list.size()>0){
            session.close();
            return list;
        }
        session.close();
        return null;
    }

    @Override
    public List<Sorderitem> getOrderItems(int soid) {
        Session session=sessionFactory.openSession();
        String hql="from Sorderitem where soid=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,soid);
        List<Sorderitem> list=(List<Sorderitem>)query.list();
        if(list.size()>0){
            session.close();
            return list;
        }
        session.close();
        return null;
    }


//    private String addSorderItem(Item item, int soid) {
//
//        Session session = sessionFactory.openSession();
//        try {
//            session.beginTransaction();
//            Sorderitem sitem = new Sorderitem();
//            sitem.setGid(item.getGood().getGid());
//            sitem.setQty(item.getAmount());
//            sitem.setTprice(item.getT_price());
//            sitem.setSoid(soid);
//            session.save(sitem);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return Constant.method_execute_fail;
//        } finally {
//            session.getTransaction().commit();
//            session.close();
//            return Constant.method_exceute_success;
//        }
//    }

}