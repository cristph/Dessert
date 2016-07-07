package com.dessert.service;

import com.alibaba.fastjson.JSON;

/**
 * Created by cristph on 2016/6/10.
 */
public interface OLAPService {

    public String getMutipleAnalysisData();

    public String getHistoryData();

    public String getOnlineHistoryData();

    public String getHistogramData(String measureValue,String compareValue);

    public String getMultipleHistogramSetting(String measureValue,String compareValue,String CompareCategory1,String CompareCategory2);

    public String getPieData(String inner,String outer,String measureValue);

    public String getRFMPieData(String measure);

    public String getGridData(String category);

    public String getCategoryData();

    public String getSelectedData(String customer);

    public String getPlanHistogramData(String timeinterval,String measure);

    public String getGoodPredicate(String good);

    public String getAprioriData(String filePath,double MinMetric,int RulesNum);

    public String getClusterData(String filePath,int seed,int clustersNum);
}
