package com.dessert.dao.impl;

import com.dessert.dao.BankDao;
import com.dessert.model.Bankcard;
import com.dessert.model.Chargerecord;
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
 * Created by cristph on 2016/3/13.
 */
@Repository
public class BankDaoImpl implements BankDao{

    @Resource
    SessionFactory sessionFactory;

    @Override
    public String getMomey(int bid, String pswd, double money) {
        String res="";
        Session session=sessionFactory.openSession();
        String hql="from Bankcard where bid=? and pswd=?";
        Query query=session.createQuery(hql);
        query.setInteger(0,bid);
        query.setString(1,pswd);
        if(query.list().size()>0){
            List list=query.list();
            Bankcard bankcard=(Bankcard) list.get(0);
            double accountMoney=bankcard.getMoney();
            if(money>accountMoney){
                res=Constant.account_money_not_enough;
            }else{
                //begin transcation
                accountMoney=accountMoney-money;
                hql="update Bankcard set money=? where bid=?";
                try{
                    session.beginTransaction();
                    query=session.createQuery(hql);
                    query.setDouble(0,accountMoney);
                    query.setInteger(1,bid);
                    query.executeUpdate();
                }catch (Exception e){
                    e.printStackTrace();
                    session.close();
                    return Constant.method_execute_fail;
                }finally {
                    session.getTransaction().commit();
                    res=Constant.method_exceute_success;
                }
            }
        }else{
            res= Constant.query_id_or_pswd_error;
        }
        session.close();
        return res;
    }

    @Override
    public String addChargeRecord(String email, double money) {
        Chargerecord chargerecord=new Chargerecord();
        chargerecord.setEmail(email);
        chargerecord.setMoney(money);
        chargerecord.setTime(new Date(System.currentTimeMillis()));
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(chargerecord);
        }catch (Exception e){
            e.printStackTrace();
            return Constant.method_execute_fail;
        }finally {
            session.getTransaction().commit();
            session.close();
            return Constant.method_exceute_success;
        }
    }

    @Override
    public List<Chargerecord> getChargeRecord(String email) {
        Session session=sessionFactory.openSession();
        String hql="from Chargerecord where email=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        List<Chargerecord> list=query.list();
        session.close();
        return list;
    }
}
