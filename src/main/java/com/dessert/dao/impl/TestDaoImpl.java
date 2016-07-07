package com.dessert.dao.impl;

import com.dessert.dao.TestDao;
import com.dessert.model.Product;
import com.dessert.util.DatabaseContextHolder;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cristph on 2016/6/5.
 */

@Repository
public class TestDaoImpl implements TestDao {

    @Resource
    SessionFactory sessionFactory;

    @Override
    public String getRecord() {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String hql="from Product where id>100 and id <1000";
        Query query=session.createQuery(hql);
        List<Product>  productList=query.list();
        int num=productList.size();
        System.out.println("get num:"+num);
        Product product=productList.get(0);
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        return product.toString();
    }
}
