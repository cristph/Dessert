package com.dessert.dao;

import org.olap4j.OlapConnection;

/**
 * Created by cristph on 2016/6/7.
 */
public interface DaoHelper {

    /*
 * 用TOMCAT数据源得到连接对象
 */
    public OlapConnection getConnection();

    /*
     * 关闭Connection对象,把数据库连接放回到连接池中
     */
    public void closeConnection(OlapConnection con);
}
