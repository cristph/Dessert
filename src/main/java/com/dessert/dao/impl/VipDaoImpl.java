package com.dessert.dao.impl;

import com.dessert.dao.VipDao;
import com.dessert.model.Vip;
import com.dessert.util.Constant;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

/**
 * Created by cristph on 2016/3/12.
 */
@Repository
public class VipDaoImpl implements VipDao {

    @Resource
   protected SessionFactory sessionFactory;

    @Override
    public Vip find(String vid) {
        Session session=sessionFactory.openSession();
        String hql="from Vip where vid=?";
        Query query=session.createQuery(hql);
        query.setString(0,vid);
        if(query.list().size()>0){
            List list=query.list();
            Vip vip=(Vip)list.get(0);
            session.close();
            return vip;
        }
        session.close();
        return null;
    }

    @Override
    public Vip findByEmail(String email) {
        Session session=sessionFactory.openSession();
        String hql="from Vip where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        if(query.list().size()>0){
            List list=query.list();
            Vip vip=(Vip)list.get(0);
            session.close();
            return vip;
        }
        session.close();
        return null;
    }

    @Override
    public String add(Vip vip) {
        Session session=sessionFactory.openSession();
        String res="";
        try {
            session.beginTransaction();
            session.save(vip);
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
    public String chargeMoney(String email, double money) {
        Session session=sessionFactory.openSession();
        String hql="from Vip where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        List list=query.list();
        Vip vip=(Vip) list.get(0);
        double chargemoney=vip.getChargemoney();
        chargemoney+=money;
        int level= (int) (chargemoney/200);
        int score=(int)(chargemoney/100);
        double discount=1-0.1*level;
        hql="Update Vip set money=money+?,level="+level+",discount="+discount+",score="+score+",chargemoney=?"+"  where email=?";
        try{
            session.beginTransaction();
            query=session.createQuery(hql);
            query.setDouble(0,money);
            query.setDouble(1,chargemoney);
            query.setString(2,email);
            query.executeUpdate();
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
    public String invokeVip(String email, double money) {
        Session session=sessionFactory.openSession();
        int level= (int) (money/200);
        int score=(int)(money/100);
        double discount=1-0.1*level;
        Date date1=new Date(System.currentTimeMillis());
        Date date2=new Date(System.currentTimeMillis()+Constant.yaer_million_times);

//        System.out.println("//////////////////////cu:"+System.currentTimeMillis()+"////////////////////////////////");
//        System.out.println("//////////////////////mi:"+Constant.yaer_million_times+"////////////////////////////////");
//        System.out.println("//////////////////////date2:"+date2+"////////////////////////////////");

        String hql="Update Vip set money=?,vipstate='active',level="+level+",discount="+discount+",score="+score+",chargemoney=?"+",signindate=?,deadline=?  where email=?";
        try{
            session.beginTransaction();
            Query query=session.createQuery(hql);
            query.setDouble(0,money);
            query.setDouble(1,money);
            query.setDate(2,date1);
            query.setDate(3,date2);
            query.setString(4,email);
            query.executeUpdate();
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
    public String buy(String email, double money) {

        Session session=sessionFactory.openSession();
        String hql="from Vip where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        List list=query.list();
        Vip vip=(Vip) list.get(0);
        if(vip.getVipstate().equals(Constant.vip_state_not_active)){
            session.close();
            return Constant.vip_state_not_active;
        }
        if(vip.getMoney()<money){
            session.close();
            return Constant.account_money_not_enough;
        }else{
            double m=vip.getMoney()-money;
            hql="UPDATE Vip set money=? where email=?";
            try{
                session.beginTransaction();
                query=session.createQuery(hql);
                query.setDouble(0,m);
                query.setString(1,email);
                query.executeUpdate();
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


}
