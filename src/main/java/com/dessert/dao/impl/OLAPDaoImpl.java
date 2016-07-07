package com.dessert.dao.impl;

import com.alibaba.fastjson.JSON;
import com.dessert.dao.DaoHelper;
import com.dessert.dao.OLAPDao;
import com.dessert.model.*;
import com.dessert.util.DataMining;
import com.dessert.util.DatabaseContextHolder;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * Created by cristph on 2016/6/10.
 */
@Repository
public class OLAPDaoImpl implements OLAPDao {

//    private static DaoHelper daoHelper= DaoHelperImpl.getBaseDaoInstance();

    @Resource
    SessionFactory sessionFactory;

    DatabaseContextHolder databaseContextHolder;

    @Override
    public String getMutipleAnalysisData() {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select dt.year,dt.month,dt.day,dc.sex,dr.city,ds.shopname,dp.category,fp.online,fp.payway,fp.totalcost,fp.totalprice,fp.totalprofit " +
                "from fact_profit_2014 as fp, dim_time_2014 dt, dim_shop ds ,dim_product_2014 dp,dim_region dr,dim_customer dc " +
                "where fp.timeid=dt.timeid and fp.shopid=ds.shopid and fp.productid=dp.productid and fp.regionid=dr.regionid and fp.customerid=dc.customerid " +
                "and dr.province='江苏' and dt.quarter=4 limit 5000;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> list=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        System.out.println("listSize:"+list.size());
        List<MultipleUint> multipleUintList=new ArrayList<>();
        for(Object[] objects:list){
            MultipleUint multipleUint=new MultipleUint();
            multipleUint.setDate((String)objects[0]+"-"+(String)objects[1]+"-"+(String)objects[2]);
            multipleUint.setSex((String)objects[3]);
            multipleUint.setCity((String)objects[4]);
            multipleUint.setShopname((String)objects[5]);
            multipleUint.setCategory((String)objects[6]);
            multipleUint.setOnline((String)objects[7]);
            multipleUint.setPayway((String)objects[8]);
            multipleUint.setTotalcost((float)objects[9]);
            multipleUint.setTotalprice((float)objects[10]);
            multipleUint.setTotalprofit((float)objects[11]);
            multipleUintList.add(multipleUint);
        }
        String str=JSON.toJSONString(multipleUintList);
        return str;
    }

    @Override
    public String getHistoryData() {
//        System.out.println("in get data");
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select * from fact_historydata"+" order by year,CAST(month as SIGNED),day;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> list=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
//        System.out.println("get data");
        int size=list.size();
        String[] date=new String[size];
        float[] data=new float[size];
        int i=0;
        for(Object[] objects:list){
            date[i]=(String)objects[0]+"-"+(String)objects[1]+"-"+(String)objects[2];
            data[i]=(float)objects[3];
            i++;
        }
        HistoryData historyData=new HistoryData();
        historyData.setData(data);
        historyData.setDate(date);
        System.out.println("listSize:"+list.size());
        return JSON.toJSONString(historyData);
    }

    @Override
    public String getOnlineHistoryData() {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select online,year,month,sum(totalprofit) " +
                "from fact_historyonlinedata " +
                "group by online,year,month " +
                "order by year,CAST(month as SIGNED);";
        Query query=session.createSQLQuery(sql);
        List<Object[]> list=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        int size=list.size();
        String[] date=new String[size/2];
        double[] data1=new double[size/2];//online
        double[] data2=new double[size/2];//offline
       for(int i=0;i<size;i++){
           Object[] objects=list.get(i);
           String online=(String)objects[0];
           if(online.equals("online")){
               date[i/2]=(String)objects[1]+"年-"+(String)objects[2]+"月";
               data1[i/2]=(double)objects[3];
           }else {
               data2[i/2]=(double)objects[3];
           }
       }

        HistroyOnlineData histroyOnlineData=new HistroyOnlineData();
        histroyOnlineData.setDate(date);
        histroyOnlineData.setData1(data1);
        histroyOnlineData.setData2(data2);
        return JSON.toJSONString(histroyOnlineData);
    }

    @Override
    public String getHistogramData(String measureValue, String compareValue) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select year,month,"+compareValue+",sum("+measureValue+") from sanpshot_sale_2014 group by year,month,"+compareValue+" order by CAST(month as SIGNED);";
        Query query=session.createSQLQuery(sql);
        List<Object[]> list=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        int size=list.size();
        String[] date=new String[size/2];
        double[] data1=new double[size/2];//online
        double[] data2=new double[size/2];//offline

        String com="";
        if(compareValue.toLowerCase().equals("online")){
            com="online";
        }else if(compareValue.toLowerCase().equals("payway")){
            com="card";
        }else if(compareValue.toLowerCase().equals("sex")){
            com="male";
        }else if(compareValue.toLowerCase().equals("category")){
            com="cake";
        }

        for(int i=0;i<size;i++){
            Object[] objects=list.get(i);
            String online=(String)objects[2];
            if(online.equals(com)){
                date[i/2]=(String)objects[0]+"年-"+(String)objects[1]+"月";
                data1[i/2]=(double)objects[3];
            }else {
                data2[i/2]=(double)objects[3];
            }
        }

        HistroyOnlineData histroyOnlineData=new HistroyOnlineData();
        histroyOnlineData.setDate(date);
        histroyOnlineData.setData1(data1);
        histroyOnlineData.setData2(data2);
        return JSON.toJSONString(histroyOnlineData);
    }

    @Override
    public String getMultipleHistogramSetting(String measureValue, String compareValue, String CompareCategory1, String CompareCategory2) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select year,month,"+compareValue+",sum("+measureValue+") from sanpshot_sale_2014 " +
                "where "+compareValue+"='"+CompareCategory1+"' or "+compareValue+"='"+CompareCategory2+"' " +
                "group by year,month,"+compareValue+" order by CAST(month as SIGNED);";
        Query query=session.createSQLQuery(sql);
        List<Object[]> list=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        int size=list.size();
        String[] date=new String[size/2];
        double[] data1=new double[size/2];//online
        double[] data2=new double[size/2];//offline

//        String com="";
//        if(compareValue.equals("online")){
//            com="online";
//        }else if(compareValue.equals("payWay")){
//            com="card";
//        }else if(compareValue.equals("sex")){
//            com="male";
//        }else if(compareValue.equals("category")){
//            com="cake";
//        }

        for(int i=0;i<size;i++){
            Object[] objects=list.get(i);
            String online=(String)objects[2];
            if(online.equals(CompareCategory1)){
                date[i/2]=(String)objects[0]+"年-"+(String)objects[1]+"月";
                data1[i/2]=(double)objects[3];
            }else {
                data2[i/2]=(double)objects[3];
            }
        }

        HistroyOnlineData histroyOnlineData=new HistroyOnlineData();
        histroyOnlineData.setDate(date);
        histroyOnlineData.setData1(data1);
        histroyOnlineData.setData2(data2);
        return JSON.toJSONString(histroyOnlineData);
    }



    @Override
    public String getPieData(String inner, String outer, String measureValue) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select "+inner+",sum("+measureValue+") from sanpshot_sale_2014 group by "+inner+";";
        Query query=session.createSQLQuery(sql);
        List<Object[]> innerlist=query.list();

        sql="select "+inner+","+outer+",sum("+measureValue+") from sanpshot_sale_2014 group by "+inner+","+outer+";";
        query=session.createSQLQuery(sql);
        List<Object[]> outerlist=query.list();

        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);
        int innersize=innerlist.size();
        int outerSize=outerlist.size();

        DataSet[] innerDataSet=new DataSet[innersize];
        DataSet[] outerDataSet=new DataSet[outerSize];
        ArrayList<String> list=new ArrayList<>();

        for(int i=0;i<innersize;i++){
            Object[] objects=innerlist.get(i);
            DataSet dataSet=new DataSet();
            dataSet.setName((String)objects[0]);
            dataSet.setValue((double)objects[1]);
            innerDataSet[i]=dataSet;

            list.add((String)objects[0]);
        }

        int outerpos=0;
        for(DataSet dataSet:innerDataSet){
            String inn=dataSet.getName();

            for(int j=0;j<outerSize;j++){
                Object[] objects=outerlist.get(j);
                if(inn.equals((String)objects[0])){
                    DataSet ds=new DataSet();
                    ds.setName(inn+"-"+(String)objects[1]);
                    ds.setValue((double)objects[2]);
                    outerDataSet[outerpos]=ds;
                    outerpos++;

                    list.add(inn+"-"+(String)objects[1]);
                }
            }
        }

        PieData pieData=new PieData();
        pieData.setInnerData(innerDataSet);
        pieData.setOuterData(outerDataSet);
        pieData.setLegendData((String[]) list.toArray(new String[0]));
        return JSON.toJSONString(pieData);
    }

    public String generateStr(int length){
        String random_chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(52);
            sb.append(random_chars.charAt(number));
        }
        return sb.toString();
    }

    public String writeData(){
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String hql="select r from RFMFact r";
        Query query=session.createQuery(hql);
        List<RFMFact> rfmFactList=query.list();
        session.close();

        session=sessionFactory.openSession();
        String sql="select max(days)/5,max(times)/5,max(money)/5 from fact_rfm;";
        query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        Object[] objects=objectList.get(0);
        int dayInterval=(int)(((BigDecimal)objects[0]).doubleValue()+1);
        int timesInterval=(int)(((BigDecimal)objects[1]).doubleValue()+1);
        int moneyInterval=(int)((double)objects[2]+1);

        System.out.println(dayInterval+","+timesInterval+","+moneyInterval);

        int R=0;
        int F=0;
        int M=0;
        ArrayList<RFM> rfmArrayList=new ArrayList<>(100000);
        for(RFMFact rfmFact:rfmFactList){
            RFM rfm=new RFM(rfmFact,dayInterval,timesInterval,moneyInterval);
            rfmArrayList.add(rfm);
            R+=rfm.getR();
            F+=rfm.getF();
            M+=rfm.getM();
        }

        double avgR=(double) R/100000;
        double avgF=(double)F/100000;
        double avgM=(double)M/100000;

//        ArrayList<RFM> rfmArrayList=new ArrayList<>(100000);
        BufferedWriter br = null;
        try {
            br = new BufferedWriter(new FileWriter("C:/Users/cristph/Desktop/bh/sanpshot_customer_sale.txt"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        Random random=new Random();
        String[] sex={"female","male"};
        double[] p={0.4,0.4,0.4,0.4,0.6,0.6,0.6,0.6,0.6,0.6};
        double[] p2={0.3,0.3,0.3,0.5,0.5,0.5,0.5,0.5,0.2,0.2};
        String []cat={"cake","biscuit","drink"};
        String abc="abc";



        for(RFM rfm:rfmArrayList){
            rfm.updateDescription(avgR,avgF,avgM);

            StringBuilder stringBuilder=new StringBuilder();
            try {
                stringBuilder.append(rfm.getCustomerid()+",");
                int k=random.nextInt(10);
                int z=random.nextInt(10);
                if(p[k]==0.5){
                    stringBuilder.append("\"female\",");
                }else{
                    stringBuilder.append("\"male\",");
                }

                if(p2[z]==0.5){
                    stringBuilder.append("\"18-25\",");
                }else if(p2[z]==0.3){
                    stringBuilder.append("\"26-35\",");
                }else {
                    stringBuilder.append("\">35\",");
                }
                stringBuilder.append("\""+generateStr(3)+"_shop\",");
                String pre=stringBuilder.toString();

                stringBuilder=new StringBuilder();
                stringBuilder.append(rfm.getR()+","+rfm.getF()+","+rfm.getM()+","+rfm.getRFM()+",");
                stringBuilder.append("\""+rfm.getDescription()+"\",");
                String post=stringBuilder.toString();

                for (int h=1;h<13;h++){
                    for(int m=0;m<3;m++){
                        double d=random.nextDouble();
                        String temp="\""+cat[m]+"\",\""+cat[m]+"_"+abc.charAt(random.nextInt(3))+"\","+"2014,"+h+",";
                        br.write(pre+temp+post+String.format("%.2f",d*1000)+","+String.format("%.2f",d*500)+"\n");
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
//            break;
        }
        try {
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "";
    }

    @Override
    public String getCategoryData() {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select year,month,category,sum(totalPrice) " +
                "from sanpshot_sale_2014 " +
                "group by year,month,category " +
                "order by cast(month as signed),category;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);


        Double[] d1=new Double[12];
        Double[] d2=new Double[12];
        Double[] d3=new Double[12];

        int d1pos=0;
        int d2pos=0;
        int d3pos=0;
        for(int i=0;i<objectList.size();i++){
           Object[] objects=objectList.get(i);
            if(i%3==1){
                d1[d1pos]=(double)objects[3];
                d1pos++;
            }else if(i%3==2){
                d2[d2pos]=(double)objects[3];
                d2pos++;
            }else {
                d3[d3pos]=(double)objects[3];
                d3pos++;
            }
        }

        ArrayList<Double[]> dlist=new ArrayList<>();
        dlist.add(d1);
        dlist.add(d2);
        dlist.add(d3);

        return JSON.toJSONString(dlist);
    }

    @Override
    public String getSelectedData(String customer) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select category,sum(totalPrice) " +
                "from sanpshot_customer_sale " +
                "where descriptiopn='"+customer+"' " +
                "group by category;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();

        session=sessionFactory.openSession();
        sql="select category,month,sum(totalPrice)\n" +
                "from sanpshot_customer_sale\n" +
                "where descriptiopn='"+customer+"' " +
                "group by category,month\n" +
                "order by cast(month as signed);";
        query=session.createSQLQuery(sql);
        List<Object[]> objectList2=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        DataSet[] dataSets=new DataSet[3];
        for(int j=0;j<objectList.size();j++){
            Object[] objects=objectList.get(j);
            DataSet dataSet=new DataSet();
            dataSet.setName((String)objects[0]);
            dataSet.setValue((double)objects[1]/(j+1));
            dataSets[j]=dataSet;
        }

        Double[] d1=new Double[12];
        Double[] d2=new Double[12];
        Double[] d3=new Double[12];

        int d1pos=0;
        int d2pos=0;
        int d3pos=0;
        for(int i=0;i<objectList2.size();i++){
            Object[] objects=objectList2.get(i);
            if(i%3==1){
                d1[d1pos]=(double)objects[2];
                d1pos++;
            }else if(i%3==2){
                d2[d2pos]=(double)objects[2]/2;
                d2pos++;
            }else {
                d3[d3pos]=(double)objects[2]/3;
                d3pos++;
            }
        }
        ArrayList<Double[]> dlist=new ArrayList<>();
        dlist.add(d1);
        dlist.add(d2);
        dlist.add(d3);

        SelectData selectData=new SelectData();
        selectData.setDataSets(dataSets);
        selectData.setDoubles(dlist);

        return JSON.toJSONString(selectData);
    }

    @Override
    public String getPlanHistogramData(String timeinterval, String measure) {
        String time="";
        int  timevalue=0;
        int z=0;
        int x=0;
        if(timeinterval.equals("Recent 3 Months")){
            time="month";
            timevalue=9;
            z=3;
            x=12;
        }else if(timeinterval.equals("Recent 6 Months")){
            time="month";
            timevalue=6;
            z=6;
            x=12;
        } else if(timeinterval.equals("Recent 3 Weeks")){
            time="week";
            timevalue=21;
            z=3;
            x=24;
        } else if(timeinterval.equals("Recent 2 Weeks")){
            time="week";
            timevalue=22;
            z=2;
            x=24;
        }
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select goodname,sum("+measure+") " +
                "from snapshot_sale_shop_1 " +
                "where cast("+time+" as signed)>" +timevalue+
                " group by goodname " +
                "order by sum("+measure+") desc;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();

        session=sessionFactory.openSession();
        sql="select goodname,sum("+measure+")/"+z+" " +
                "from snapshot_sale_shop_1 " +
                "where cast("+time+" as signed)>" +timevalue+
                " group by goodname " +
                "order by goodname asc;";
        query=session.createSQLQuery(sql);
        List<Object[]> queryList=query.list();
        session.close();

        session=sessionFactory.openSession();
        sql="select goodname,sum("+measure+") " +
                "from snapshot_sale_shop_1 " +
                "where "+time+"=" +x+
                " group by goodname " +
                "order by goodname asc;";
        query=session.createSQLQuery(sql);
        List<Object[]> queryList2=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        String[] strings=new String[objectList.size()];
        Double[] doubles=new Double[objectList.size()];
        for(int i=0;i<objectList.size();i++){
            Object[] objects=objectList.get(i);
            strings[i]=(String)objects[0];
            if(measure.toLowerCase().equals("num")){
                doubles[i]=((BigDecimal)objects[1]).doubleValue();
            }else{
                doubles[i]=(double)objects[1];
            }
        }
        ArrayList<Double[]> dlist=new ArrayList<>();
        dlist.add(doubles);

        SelectData selectData=new SelectData();
        selectData.setDoubles(dlist);
        selectData.setStrings(strings);

        int num=queryList.size();
//        String [] array=new String[num];
//        Double[] t=new Double[num];
        List<DataSet> dataSets=new ArrayList<>();
        for(int i=0;i<num;i++){
            Object[] objects1=queryList.get(i);
            Object[] objects2=queryList2.get(i);
//            array[i]=(String)objects1[0];
//            t[i]=((double)objects2[1]-(double)objects1[1])/(double)objects1[1];
            DataSet dataSet=new DataSet();
            dataSet.setName((String)objects1[0]);
            if(measure.toLowerCase().equals("num")){
                double d1=((BigDecimal)objects1[1]).doubleValue();
                double d2=((BigDecimal)objects2[1]).doubleValue();
                dataSet.setValue((d2-d1)/d1);
            }else {
                dataSet.setValue(((double)objects2[1]-(double)objects1[1])/(double)objects1[1]);
            }
            dataSets.add(dataSet);
        }
        Collections.sort(dataSets);
        DataSet[] ds=new DataSet[dataSets.size()];
        for(int j=0;j<dataSets.size();j++){
            ds[j]=dataSets.get(j);
        }
        selectData.setDataSets(ds);
        return JSON.toJSONString(selectData);
    }

    private double[] testKK(double p,double[] YT,double s0){
        int originSize=YT.length;
//        Double[] Y=new Double[];
//        Double[] Y={29.0,36.0,40.0,48.0,54.0,62.0,70.0,76.0,85.0,94.0,103.0};
        double[] Y=YT;
//        double[] St1=new double[12];
        double[] St1=new double[originSize+1];
//        double[] St2=new double[11];
        double[] St2=new double[originSize];
//        St1[0]=23.0;
        St1[0]=s0;
        double a=p;
        St1[1]=a*Y[0]+(1-a)*St1[0];
        St2[0]=St1[1];

        for(int i=0;i<originSize-1;i++){
            St1[i+2]=a*Y[i+1]+(1-a)*St1[i+1];
            St2[i+1]=a*St1[i+2]+(1-a)*St2[i];
        }

        //cal 方差
        double S=0;
        for(int j=0;j<St2.length-1;j++){
            double tmp=St2[j+1]-Y[j+1];
            S+=tmp*tmp;
        }

        double a1=2*St1[St1.length-1]-St2[St2.length-1];
        double bt=(a/(1-a))*(St1[St1.length-1]-St2[St2.length-1]);
        double res=a1+bt;

//        for(int i=0;i<St1.length;i++){
//            System.out.print(St1[i]+",");
//        }
//        System.out.println();
//        for(int i=0;i<St2.length;i++){
//            System.out.print(St2[i]+",");
//        }
//        System.out.println();
//        System.out.println();
//        System.out.println();
////        System.out.println();
//        System.out.println(a1);
//        System.out.println(bt);
//        System.out.println(res+"||"+S);
        double[] d={res,S};
        return d;
    }

    @Override
    public String getGoodPredicate(String good) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();

        String sql="select goodname,week,sum(num)\n" +
                "from snapshot_sale_shop_1 " +
                "where goodname='"+good+"' " +
                "group by goodname,week " +
                "order by cast(week as signed);";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();

        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        double[] res=new double[objectList.size()+2];

        Object[] objects0=objectList.get(0);
        double s0=((BigDecimal)objects0[2]).doubleValue();
        res[0]=((BigDecimal)objects0[2]).doubleValue();

        double YT[]=new double[objectList.size()-1];
        for(int i=1;i<objectList.size();i++){
            Object[] objects=objectList.get(i);
            YT[i-1]=((BigDecimal)objects[2]).doubleValue();
            res[i]=((BigDecimal)objects[2]).doubleValue();
        }

        int ks=0;
        double tS=0;
        double target=0;
        for(int k=1;k<100;k++){
            if(k==1){
                System.out.print(k*0.01+"||");
                double[] d=testKK(k*0.01,YT,s0);
                System.out.println(d[0]+"||"+d[1]);
                ks=1;
                tS=d[1];
            }else {
                System.out.print(k*0.01+"||");
                double[] d=testKK(k*0.01,YT,s0);
                System.out.println(d[0]+"||"+d[1]);

                if(d[1]<tS){
                    target=d[0];
                    tS=d[1];
                    ks=k;
                }
            }
        }


        double resD=ks*0.01;
        res[objectList.size()]=resD;
        res[objectList.size()+1]=target;
        return JSON.toJSONString(res);
    }

    @Override
    public String getAprioriData(String filePath, double MinMetric, int RulesNum) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String sql="select sex,marriage,time,cream_cake,chocolate_cake,sweet_bread,salty_bread,biscuit, " +
                "milky_tea,black_tea,milk " +
                "from trainingdata;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        BufferedWriter br = null;
        try {
            br = new BufferedWriter(new FileWriter(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            br.write("@relation customer_sale\n" +
                    "\n" +
                    "@attribute sex \t\t\t{M,F}\n" +
                    "@attribute marriage\t{Married,notMarried}\n" +
                    "@attribute time \t\t\t{am6_9,am10_13,pm14_16,pm17_18,pm19_20}\n" +
                    "@attribute cream_cale \t\t\t{ T}\n" +
                    "@attribute chocolate_cale\t{ T}\n" +
                    "@attribute sweet_bread\t\t{ T}\n" +
                    "@attribute salty_bread\t{ T}\n" +
                    "@attribute biscuit\t{ T}\n" +
                    "@attribute milky_tea\t{ T}\n" +
                    "@attribute black_tea\t{ T}\n" +
                    "@attribute milk\t{ T}\n" +
                    "\n" +
                    "@data\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        for(Object[] objects:objectList){
            String line="";
            for(int i=0;i<objects.length;i++){
                if(i<objects.length-1){
                    line=line+(String)objects[i]+",";
                }else {
                    line=line+(String)objects[i]+"\n";
                }
            }
            try {
                br.write(line);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try {
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        DataMining dataMining=new DataMining();
        String str=dataMining.apriori(filePath, MinMetric, RulesNum);

        int j=str.indexOf("1.");
        String temp=str.substring(j);

        String res[]=temp.split("\n");

        String posStr="";
        for(String t:res){
            String ts[]=t.split(" ==> ");
            if(check(ts[0])&&check(ts[1])){
                posStr=posStr+t+"\n";
            }
        }

        String analysis=str+"||"+posStr;
        return analysis;
    }

    public boolean check(String str){
        if(str.indexOf("cake")>=0){
            return true;
        }else if(str.indexOf("bread")>=0){
            return true;
        }else if(str.indexOf("tea")>=0){
            return true;
        }else if(str.indexOf("milk")>=0){
            return true;
        }else if(str.indexOf("biscuit")>=0){
            return true;
        }
        return false;
    }

    @Override
    public String getClusterData(String filePath, int seed,int clustersNum) {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
//        String sql="select age,sex,marriage\n" +
//                "from trainingdata;";
        String sql="select sex,marriage,time,cream_cake,chocolate_cake,sweet_bread,salty_bread,biscuit, " +
                "milky_tea,black_tea,milk " +
                "from trainingdata;";
        Query query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        BufferedWriter br = null;
        try {
            br = new BufferedWriter(new FileWriter(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
//            br.write("@relation customer_category\n" +
//                    "\n" +
//                    "@attribute age \t\t\tnumeric\n" +
//                    "@attribute sex \t\t\t{M,F}\n" +
//                    "@attribute marriage\t{Married,notMarried}\n" +
//                    "\n" +
//                    "@data\n");

            br.write("@relation customer_sale\n" +
                    "\n" +
                    "@attribute sex \t\t\t{M,F}\n" +
                    "@attribute marriage\t{Married,notMarried}\n" +
                    "@attribute time \t\t\t{am6_9,am10_13,pm14_16,pm17_18,pm19_20}\n" +
                    "@attribute cream_cake \t\t\t{F,T}\n" +
                    "@attribute chocolate_cake\t{F,T}\n" +
                    "@attribute sweet_bread\t\t{F,T}\n" +
                    "@attribute salty_bread\t{F,T}\n" +
                    "@attribute biscuit\t{F,T}\n" +
                    "@attribute milky_tea\t{F,T}\n" +
                    "@attribute black_tea\t{F,T}\n" +
                    "@attribute milk\t{F,T}\n" +
                    "\n" +
                    "@data\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        for(Object[] objects:objectList){
            String line="";
            for(int i=0;i<objects.length;i++){
                String tmp=(String)objects[i];
                if(i<objects.length-1){
                    if(tmp.equals("?")){
                        tmp="F";
                    }
                    line=line+tmp+",";
                }else {
                    if(tmp.equals("?")){
                        tmp="F";
                    }
                    line=line+tmp+"\n";
                }

//                if(i==0){
//                    line=line+(int)objects[i]+",";
//                } else if(i<objects.length-1){
//                    line=line+(String)objects[i]+",";
//                }else {
//                    line=line+(String)objects[i]+"\n";
//                }
            }
            try {
                br.write(line);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try {
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        DataMining dataMining=new DataMining();
        String res=dataMining.cluster(filePath,seed,clustersNum);
        return res;
    }

    @Override
    public ArrayList<ArrayList<RFM>> generateRFM() {
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String hql="select r from RFMFact r";
        Query query=session.createQuery(hql);
        List<RFMFact> rfmFactList=query.list();
        session.close();

        session=sessionFactory.openSession();
        String sql="select max(days)/5,max(times)/5,max(money)/5 from fact_rfm;";
        query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        Object[] objects=objectList.get(0);
        int dayInterval=(int)(((BigDecimal)objects[0]).doubleValue()+1);
        int timesInterval=(int)(((BigDecimal)objects[1]).doubleValue()+1);
        int moneyInterval=(int)((double)objects[2]+1);

        System.out.println(dayInterval+","+timesInterval+","+moneyInterval);

        ArrayList<RFM> rfmArrayList=new ArrayList<>(100000);
        int R=0;
        int F=0;
        int M=0;
        for(RFMFact rfmFact:rfmFactList){
            RFM rfm=new RFM(rfmFact,dayInterval,timesInterval,moneyInterval);
            rfmArrayList.add(rfm);
            R+=rfm.getR();
            F+=rfm.getF();
            M+=rfm.getM();
        }

        System.out.println(R+","+F+","+M);
        System.out.println("update List");
        double avgR=(double) R/100000;
        double avgF=(double)F/100000;
        double avgM=(double)M/100000;
        System.out.println(avgR+","+avgF+","+avgM);

        ArrayList<ArrayList<RFM>> arrayLists=new ArrayList<ArrayList<RFM>>();
        ArrayList<RFM> arrayList0=new ArrayList<>();
        ArrayList<RFM> arrayList1=new ArrayList<>();
        ArrayList<RFM> arrayList2=new ArrayList<>();
        ArrayList<RFM> arrayList3=new ArrayList<>();
        ArrayList<RFM> arrayList4=new ArrayList<>();
        ArrayList<RFM> arrayList5=new ArrayList<>();
        ArrayList<RFM> arrayList6=new ArrayList<>();
        ArrayList<RFM> arrayList7=new ArrayList<>();
        arrayLists.add(arrayList0);
        arrayLists.add(arrayList1);
        arrayLists.add(arrayList2);
        arrayLists.add(arrayList3);
        arrayLists.add(arrayList4);
        arrayLists.add(arrayList5);
        arrayLists.add(arrayList6);
        arrayLists.add(arrayList7);

        for(RFM rfm:rfmArrayList){
            int k=rfm.updateDescription(avgR,avgF,avgM);
            arrayLists.get(k).add(rfm);
        }
        System.out.println("update description");
        return arrayLists;
    }

    private ArrayList<RFM> generateSpeRFM(String Category){
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_Two);
        Session session=sessionFactory.openSession();
        String hql="select r from RFMFact r";
        Query query=session.createQuery(hql);
        List<RFMFact> rfmFactList=query.list();
        session.close();

        session=sessionFactory.openSession();
        String sql="select max(days)/5,max(times)/5,max(money)/5 from fact_rfm;";
        query=session.createSQLQuery(sql);
        List<Object[]> objectList=query.list();
        session.close();
        DatabaseContextHolder.setCustomerType(DatabaseContextHolder.DATA_SOURCE_One);

        Object[] objects=objectList.get(0);
        int dayInterval=(int)(((BigDecimal)objects[0]).doubleValue()+1);
        int timesInterval=(int)(((BigDecimal)objects[1]).doubleValue()+1);
        int moneyInterval=(int)((double)objects[2]+1);

        System.out.println(dayInterval+","+timesInterval+","+moneyInterval);

        ArrayList<RFM> rfmArrayList=new ArrayList<>(100000);

        if(Category.equals("ALL")){
            for(RFMFact rfmFact:rfmFactList){
                RFM rfm=new RFM(rfmFact,dayInterval,timesInterval,moneyInterval);
                rfmArrayList.add(rfm);
            }
            return rfmArrayList;
        }else {
            int R=0;
            int F=0;
            int M=0;
            for(RFMFact rfmFact:rfmFactList){
                RFM rfm=new RFM(rfmFact,dayInterval,timesInterval,moneyInterval);
                rfmArrayList.add(rfm);
                R+=rfm.getR();
                F+=rfm.getF();
                M+=rfm.getM();
            }

            double avgR=(double) R/100000;
            double avgF=(double)F/100000;
            double avgM=(double)M/100000;

            ArrayList<RFM> res=new ArrayList<>();

            if(Category.equals("Important_Customer")){
                for(RFM rfm:rfmArrayList){
                    int k=rfm.updateDescription(avgR,avgF,avgM);
                    if(k%2==1){
                        res.add(rfm);
                    }
                }
            }else {
                for(RFM rfm:rfmArrayList){
                    int k=rfm.updateDescription(avgR,avgF,avgM);
                    if(k%2==0){
                        res.add(rfm);
                    }
                }
            }
            return res;
        }
    }

    @Override
    public String getRFMPieData(String measure) {
        ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
        String[] legendData=new String[10];
        DataSet[] outerData=new DataSet[8];
        DataSet[] outerData2=new DataSet[8];
        legendData[0]="Normal_Customer";
        legendData[1]="Important_Customer";

        int Normal=0;
        int Important=0;
        double Normal2=0;
        double Important2=0;

        int posn=0;
        int posi=0;
        for(ArrayList<RFM> list:arrayLists){
            RFM rfm=list.get(0);
            DataSet dataSet=new DataSet();
            dataSet.setName(rfm.getDescription());
            dataSet.setValue(list.size());

            double temp=0;
            for(RFM rfmTemp:list){
                temp+=rfmTemp.getMoney();
            }
            DataSet dataSet1=new DataSet();
            dataSet1.setName(rfm.getDescription());
            dataSet1.setValue(temp);

            if(rfm.getDescription().startsWith("N")){
                Normal+=list.size();
                Normal2+=temp;

                outerData[posn]=dataSet;
                outerData2[posn]=dataSet1;
                legendData[posn]=rfm.getDescription();
                posn++;
            }else {
                Important+=list.size();
                Important2+=temp;

                outerData[posi+4]=dataSet;
                outerData2[posi+4]=dataSet1;
                legendData[posi+4]=rfm.getDescription();
                posi++;
            }
        }
        DataSet dataSet1=new DataSet();
        dataSet1.setName("Normal_Customer");
        dataSet1.setValue(Normal);
        DataSet dataSet2=new DataSet();
        dataSet2.setName("Important_Customer");
        dataSet2.setValue(Important);
        DataSet[] innerData={dataSet1,dataSet2};
        PieData pieData=new PieData();
        pieData.setInnerData(innerData);
        pieData.setOuterData(outerData);
        pieData.setLegendData(legendData);

        DataSet dataSet3=new DataSet();
        dataSet3.setName("Normal_Customer");
        dataSet3.setValue(Normal2);
        DataSet dataSet4=new DataSet();
        dataSet4.setName("Important_Customer");
        dataSet4.setValue(Important2);
        DataSet[] innerData2={dataSet3,dataSet4};
        PieData pieData2=new PieData();
        pieData2.setInnerData(innerData2);
        pieData2.setOuterData(outerData2);
        pieData2.setLegendData(legendData);

        ArrayList<PieData> pieDatas=new ArrayList<>();
        pieDatas.add(pieData);
        pieDatas.add(pieData2);
        return JSON.toJSONString(pieDatas);
    }

    @Override
    public String getGridData(String category) {
        if(category.equals("All")){
            ArrayList<RFM> arrayLists=generateSpeRFM(category);
            return JSON.toJSONString(arrayLists);
        }else if(category.equals("Important_Customer")){
            ArrayList<RFM> arrayLists=generateSpeRFM(category);
            return JSON.toJSONString(arrayLists);
        }else if(category.equals("Normal_Customer")){
            ArrayList<RFM> arrayLists=generateSpeRFM(category);
            return JSON.toJSONString(arrayLists);
        } else if(category.equals("Normal_Retain_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(0));
        }else if(category.equals("Important_Retain_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(1));
        }else if(category.equals("Normal_Keep_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(2));
        }else if(category.equals("Important_Keep_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(3));
        }else if(category.equals("Normal_Develop_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(4));
        }else if(category.equals("Important_Develop_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(5));
        }else if(category.equals("Normal_Value_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(6));
        }else if(category.equals("Important_Value_Customer")){
            ArrayList<ArrayList<RFM>> arrayLists=generateRFM();
            return JSON.toJSONString(arrayLists.get(7));
        }
        return "";
    }


}
