package com.dessert.dao.impl;

import com.dessert.dao.DaoHelper;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.olap4j.OlapConnection;
import org.olap4j.OlapWrapper;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by cristph on 2016/6/7.
 */
public class DaoHelperImpl implements DaoHelper {

    private static DaoHelperImpl baseDao=new DaoHelperImpl();
    private OlapConnection olapConnection = null;
    private DataSource dataSource = null;

    private DaoHelperImpl() {
        GenericObjectPool connectionPool = new GenericObjectPool(null);
        ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
                "jdbc:mondrian:"
                        //连接数据源的JDBC连接
                        + "Jdbc='jdbc:mysql://localhost:5029/dessertdh?user=root&password=&useUnicode=true&characterEncoding=utf-8';"
                        //数据模型文件
                        + "Catalog='file://D:/JavaWebWorkSpace/Dessert/web/WEB-INF/queries/tezz.xml';"
                        //连接数据源用到的驱动
                        + "JdbcDrivers=com.mysql.jdbc.Driver;", new Properties());
        PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, connectionPool, null, null, false, true);
        dataSource = new PoolingDataSource(connectionPool);
        System.out.println("/**************************************initial dataSource****************************************/");
    }

    //单例模式
    public static DaoHelperImpl getBaseDaoInstance() {
        return baseDao;
    }

    @Override
    public OlapConnection getConnection() {
        Connection connection = null;
        try {
            Class.forName("mondrian.olap4j.MondrianOlap4jDriver");
            connection = dataSource.getConnection();
            olapConnection = connection.unwrap(OlapConnection.class);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return olapConnection;
    }

    @Override
    public void closeConnection(OlapConnection con) {
        if(con!=null)
        {
            try
            {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
