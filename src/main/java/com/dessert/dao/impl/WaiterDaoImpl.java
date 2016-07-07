package com.dessert.dao.impl;

import com.dessert.dao.WaiterDao;
import com.dessert.model.Good;
import com.dessert.model.User;
import com.dessert.model.Waiter;
import com.dessert.util.Constant;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cristph on 2016/3/17.
 */
@Repository
public class WaiterDaoImpl implements WaiterDao{
    @Resource
    SessionFactory sessionFactory;

    @Override
    public List<User> getWaiters(int shopid) {
        Session session=sessionFactory.openSession();
        String hql="select u from User u where email in(select wemail from Waiter where shopid=?) ";
        Query query=session.createQuery(hql);
        query.setInteger(0,shopid);
        List<User> users=query.list();
        session.close();
        return users;
    }

    @Override
    public String createWaiter(User u, int shopid) {

        addUser(u);
        Waiter waiter=new Waiter();
        waiter.setWname(u.getUsername());
        waiter.setWemail(u.getEmail());
        waiter.setShopid(shopid);
        waiter.setIndate(new Date(System.currentTimeMillis()));
       addWaiter(waiter);

        return Constant.method_exceute_success;
    }

    @Override
    public String delWaiter(String wemail) {
        Session session=sessionFactory.openSession();
        String hql="delete from User where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,wemail);
        query.executeUpdate();
        session.close();

        session=sessionFactory.openSession();
        hql="delete from Waiter where wemail=?";
        query=session.createQuery(hql);
        query.setString(0,wemail);
        query.executeUpdate();
        session.close();

        return Constant.method_exceute_success;
    }

//    @Override
//    public String delWaiter(int wid) {
//        Session session=sessionFactory.openSession();
//        String hql="delete from User where uid=?";
//        Query query=session.createQuery(hql);
//        query.setInteger(0,wid);
//        query.executeUpdate();
//        session.close();
//
//        session=sessionFactory.openSession();
//        hql="delete from Waiter where wid=?";
//        query=session.createQuery(hql);
//        query.setInteger(0,wid);
//        query.executeUpdate();
//        session.close();
//
//        return Constant.method_exceute_success;
//    }

    @Override
    public String addProduct(Good good) {
        Session session=sessionFactory.openSession();
        String res="";
        try {
            session.beginTransaction();
            session.save(good);
            res= Constant.method_exceute_success;
        }catch (Exception e){
            res=Constant.method_execute_fail;
            e.printStackTrace();
        }finally {
            session.getTransaction().commit();
            session.close();
            return res;
        }
    }

    @Override
    public List<Good> getProductList(String category) {
        Session session=sessionFactory.openSession();
        if(category.equals("all")){
            String hql="select g from Good g";
            Query query=session.createQuery(hql);
            List<Good> goodList=query.list();
            session.close();
            return goodList;
        }else{
            String hql="from Good where category=?";
            Query query=session.createQuery(hql);
            query.setString(0,category);
            List<Good> goodList=query.list();
            session.close();
            return goodList;
        }
    }

    @Override
    public int getshopid(String email) {
        Session session=sessionFactory.openSession();
        String hql="from Waiter where wemail=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        List<Waiter> waiters=query.list();
        Waiter waiter=waiters.get(0);
        int shopid=waiter.getShopid();
        session.close();
        return shopid;
    }

    private String addUser(User user) {
        String res="";
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(user);
            res="Success";
        }catch (Exception e){
            res="Fail";
            e.printStackTrace();
        }finally {
            session.getTransaction().commit();
            session.close();
            return res;
        }
    }

    private String addWaiter(Waiter waiter){
        String res="";
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(waiter);
            res="Success";
        }catch (Exception e){
            res="Fail";
            e.printStackTrace();
        }finally {
            session.getTransaction().commit();
            session.close();
            return res;
        }
    }


}
