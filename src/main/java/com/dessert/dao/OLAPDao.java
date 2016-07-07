package com.dessert.dao;

import com.alibaba.fastjson.JSON;
import com.dessert.model.RFM;

import java.util.ArrayList;

/**
 * Created by cristph on 2016/6/10.
 */
public interface OLAPDao {

    public String getMutipleAnalysisData();

    public String getHistoryData();

    public String getOnlineHistoryData();

    public String getHistogramData(String measureValue,String compareValue);

    public String getMultipleHistogramSetting(String measureValue,String compareValue,String CompareCategory1,String CompareCategory2);

    public String getPieData(String inner,String outer,String measureValue);

    public ArrayList<ArrayList<RFM>> generateRFM();

    public String getRFMPieData(String measure);

    public String getGridData(String category);

    public String writeData();

    public String getCategoryData();

    public String getSelectedData(String customer);

    public String getPlanHistogramData(String timeinterval,String measure);

    public String getGoodPredicate(String good);

    public String getAprioriData(String filePath,double MinMetric,int RulesNum);

    public String getClusterData(String filePath,int seed,int clustersNum);
}
