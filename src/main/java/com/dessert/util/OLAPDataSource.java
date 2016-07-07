package com.dessert.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import java.util.Properties;

import com.dessert.dao.DaoHelper;
import com.dessert.dao.impl.DaoHelperImpl;
import com.dessert.service.OLAPService;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.olap4j.*;
import org.olap4j.metadata.Member;
import org.pivot4j.PivotModel;
import org.pivot4j.datasource.PooledOlapDataSource;
import org.pivot4j.datasource.SimpleOlapDataSource;
import org.pivot4j.impl.PivotModelImpl;
import org.pivot4j.ui.html.HtmlRenderCallback;
import org.pivot4j.ui.table.TableRenderer;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Created by cristph on 2016/6/6.
 */

@Controller
public class OLAPDataSource {
    @Resource
    OLAPService olapService;

    private static DaoHelper daoHelper= DaoHelperImpl.getBaseDaoInstance();

    public static OlapConnection getConnection(String url) throws ClassNotFoundException, SQLException{
        Class.forName("mondrian.olap4j.MondrianOlap4jDriver");
        Connection connection = DriverManager.getConnection(url);
        return connection.unwrap(OlapConnection.class);
    }

    public static CellSet getResultSet(String mdx,OlapConnection conn) throws OlapException{
        OlapStatement statement = conn.createStatement();
        CellSet cellSet = statement.executeOlapQuery(mdx);
        return cellSet;
    }

//    @RequestMapping("/test4")
//    public String getData(@RequestParam("query")String t) throws OlapException {
//        return "../queries/AccessInfo";
//    }

    @RequestMapping("/test3")
    public String getDataSourceConnection() throws OlapException {
//        OlapConnection olapConnection=daoHelper.getConnection();
//        OlapStatement olapStatement=olapConnection.createStatement();
//        String mdx = "SELECT {[Measures].[num], [Measures].[avgprice], "
//                + "[Measures].[tsalenum]} ON COLUMNS, {([product].[allproduct], "
//                + "[customer].[allsex])} ON ROWS FROM [Sales]";
//        CellSet cs=getResultSet(mdx,olapConnection);
//
//        if(cs.getAxes().size()>1){
//            for (Position row : cs.getAxes().get(1)) {
//                for (Position column : cs.getAxes().get(0)) {
//                    for (Member member : row.getMembers()) {
//                        System.out.println("rows:"+member.getUniqueName());
//                    }
//                    for (Member member : column.getMembers()) {
//                        System.out.println("columns:"+member.getUniqueName());
//                    }
//                    final Cell cell = cs.getCell(column, row);
//                    System.out.println("values:"+cell.getValue());
//                    System.out.println();
//                }
//            }
//        }else{
//            for(Position column:cs.getAxes().get(0))
//            {
//                for(Member member:column.getMembers()){
//                    System.out.println("columns:"+member.getUniqueName());
//                }
//                Cell cell=cs.getCell(column);
//                System.out.print("values:"+cell.getValue());
//                System.out.println();
//            }
//        }
        System.out.print(olapService.getMutipleAnalysisData());
        return "bi/olap";
    }

    @RequestMapping("/test2")
    public void getConnenction() throws SQLException, ClassNotFoundException {

        OlapConnection conn= getConnection(//URL协议
                "jdbc:mondrian:"
                        //连接数据源的JDBC连接
                        + "Jdbc='jdbc:mysql://localhost:5029/dessertdh?user=root&password=&useUnicode=true&characterEncoding=utf-8';"
                        //数据模型文件
                        + "Catalog='file://D:/JavaWebWorkSpace/Dessert/web/WEB-INF/queries/tezz.xml';"
                        //连接数据源用到的驱动
                        + "JdbcDrivers=com.mysql.jdbc.Driver;");


        String mdx = "SELECT {[Measures].[num], [Measures].[avgprice], "
                + "[Measures].[tsalenum]} ON COLUMNS, {([product].[allproduct], "
                + "[customer].[allsex])} ON ROWS FROM [Sales]";

        CellSet cs=getResultSet(mdx, conn);

        //处理返回数据
        if(cs.getAxes().size()>1){
            for (Position row : cs.getAxes().get(1)) {
                for (Position column : cs.getAxes().get(0)) {
                    for (Member member : row.getMembers()) {
                        System.out.println("rows:"+member.getUniqueName());
                    }
                    for (Member member : column.getMembers()) {
                        System.out.println("columns:"+member.getUniqueName());
                    }
                    final Cell cell = cs.getCell(column, row);
                    System.out.println("values:"+cell.getValue());
                    System.out.println();
                }
            }
        }else{
            for(Position column:cs.getAxes().get(0))
            {
                for(Member member:column.getMembers()){
                    System.out.println("columns:"+member.getUniqueName());
                }
                Cell cell=cs.getCell(column);
                System.out.print("values:"+cell.getValue());
                System.out.println();
            }
        }
    }

}
