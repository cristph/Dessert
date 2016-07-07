package com.dessert.util;

import com.alibaba.fastjson.JSON;
import com.dessert.model.Customer;
import weka.associations.Apriori;
import weka.clusterers.SimpleKMeans;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

import java.beans.Customizer;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by cristph on 2016/6/17.
 */
public class DataMining {

    public String apriori(String filePath,double MinMetric,int RulesNum){
        Apriori apriori=null;
        Instances instances=null;

//        File file= new File("D://Weka-3-6//data//contact-lenses.arff");
        File file= new File(filePath);
        ArffLoader arffLoader = new ArffLoader();
        try {
            arffLoader.setFile(file);
            instances=arffLoader.getDataSet();

            apriori=new Apriori();

            double deltaValue = 0.05;
            double lowerBoundMinSupportValue = 0.1;
//            double minMetricValue = 0.7;
            double minMetricValue = MinMetric;
//            int numRulesValue = 10;
            int numRulesValue = RulesNum;
            double upperBoundMinSupportValue = 1.0;

            apriori.setDelta(deltaValue);
            apriori.setLowerBoundMinSupport(lowerBoundMinSupportValue);
            apriori.setNumRules(numRulesValue);
            apriori.setUpperBoundMinSupport(upperBoundMinSupportValue);
            apriori.setMinMetric(minMetricValue);

            try {
                apriori.buildAssociations(instances);
                String str=apriori.toString();
                System.out.println(str);

//                System.out.println(apriori.getAllTheRules().toString());
                return str;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    public String cluster(String filePath,int seed,int clustersNum){
        Instances ins = null;
        Instances tempIns = null;

        SimpleKMeans KM = null;
        try{
            File file= new File(filePath);
//            File file= new File(filePath);
            ArffLoader loader = new ArffLoader();
            loader.setFile(file);
            ins = loader.getDataSet();

            KM = new SimpleKMeans();

//            KM.setNumClusters(5);
            KM.setNumClusters(clustersNum);
            KM.setSeed(seed);
            KM.buildClusterer(ins);

//            String pre="";

            ArrayList<Customer> customers=new ArrayList<>();

            for(int i=0;i<ins.numInstances();i++) {
                Instance instance=ins.instance(i);
                Customer customer=new Customer(i,instance.toString(),KM.clusterInstance(instance));
                customers.add(customer);
//                pre = pre + ins.instance(i).toString() + ",cluster" + KM.clusterInstance(ins.instance(i)) + "\n";
//                System.out.println(ins.instance(i).toString()+",cluster"+KM.clusterInstance(ins.instance(i)));
            }
            KM.setDisplayStdDevs(true);
            tempIns = KM.getClusterCentroids();

            String str1=tempIns.toString();
            String str2=KM.toString();
            System.out.println(str1);
            System.out.println(str2);

            String pre= JSON.toJSONString(customers);

            String res=str1+"\n\n"+str2+"||"+pre;
//            System.out.println(res.split("||")[1]);
            return res;
//            return (str1+"\n\n"+str2+"||"+pre);
        }catch(Exception e){
            e.printStackTrace();
        }

        return "";
    }
}
