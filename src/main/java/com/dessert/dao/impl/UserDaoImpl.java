package com.dessert.dao.impl;

import com.dessert.dao.UserDao;
import com.dessert.model.User;
import com.dessert.util.Constant;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/2/16.
 */

@Repository
public class UserDaoImpl implements UserDao{

    @Resource
    protected SessionFactory sessionFactory;

    @Override
    public boolean login(String email, String pswd) {
        Session session=sessionFactory.openSession();
        String hql = "from User where email =? and password = ?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        query.setString(1,pswd);
        if(query.list().size()>0){
            session.close();
            return true;
        }
        session.close();
        return false;
    }

    @Override
    public boolean isExist(User user) {
        Session session=sessionFactory.openSession();
        String hql = "from User where username =? and password = ?";
        Query query=session.createQuery(hql);
        query.setString(0,user.getUsername());
        query.setString(1,user.getPassword());
        if(query.list().size()>0){
            session.close();
            return true;
        }
        session.close();
        return false;
    }

    @Override
    public String add(User user) {
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

    @Override
    public User findByEmail(String email) {

        Session session=sessionFactory.openSession();
        String hql = "from User where email =?";
        Query query=session.createQuery(hql);
        query.setString(0,email);

        List<User> list=query.list();
        if(list.size()>0){
            User u=list.get(0);
            session.close();
            return u;
        }
        session.close();
        return null;
    }

    @Override
    public User checkPswd(String email, String password) {

        Session session=sessionFactory.openSession();
        String hql = "from User where email =? and password=?";
        Query query=session.createQuery(hql);
        query.setString(0,email);
        query.setString(1,password);

        List<User> list=query.list();
        if(list.size()>0){
            User u=list.get(0);
            session.close();
            return u;
        }
        session.close();
        return null;
    }

    @Override
    public User checkVipPswd(String vid, String pswd) {
        Session session=sessionFactory.openSession();
        String hql = "from User where vid=? and password=?";
        Query query=session.createQuery(hql);
        query.setString(0,vid);
        query.setString(1,pswd);

        List<User> list=query.list();
        if(list.size()>0){
            User u=list.get(0);
            session.close();
            return u;
        }
        session.close();
        return null;
    }

    @Override
    public String checkEmail(String email) {

        Session session=sessionFactory.openSession();
        String hql = "from User where email =?";
        Query query=session.createQuery(hql);
        query.setString(0,email);

        if(query.list().size()>0){
            session.close();
            return "exist";
        }
        session.close();
        return null;
    }

    @Override
    public String update(User user) {
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            String hql="update User set address=?,birth=?,contact=?,selfintro=?,sex=?,username=? where email=?";
            Query query=session.createQuery(hql);
            query.setString(0,user.getAddress());
            query.setDate(1,user.getBirth());
            query.setString(2,user.getContact());
            query.setString(3,user.getSelfintro());
            query.setInteger(4,user.getSex());
            query.setString(5,user.getUsername());
            query.setString(6,user.getEmail());
            query.executeUpdate();
//            System.out.println(">>>>>>>>>>>>>>>>>>>>execute user update method");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.getTransaction().commit();
            session.close();
//            System.out.println(">>>>>>>>>>>>>>>>>>>>user update commit");
            return "Success";
        }
    }

    @Override
    public String resetPswd(String email, String oldPswd, String newPswd) {
        User user=checkPswd(email,oldPswd);
        if(user==null){
            return Constant.security_wrong_pswd;
        }else{
            Session session=sessionFactory.openSession();
            try {
                session.beginTransaction();
                String hql="update User set password=? where email=?";
                Query query=session.createQuery(hql);
                query.setString(0,newPswd);
                query.setString(1,email);
                query.executeUpdate();
//                System.out.println(">>>>>>>>>>>>>>>>>>>>resetPswd execute Update");
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                session.getTransaction().commit();
                session.close();
//                System.out.println(">>>>>>>>>>>>>>>>>>>>resetPswd commit");
                return Constant.method_exceute_success;
            }
        }
    }
}
