package com.dessert.service.impl;

import com.alibaba.fastjson.JSON;
import com.dessert.dao.OLAPDao;
import com.dessert.service.OLAPService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by cristph on 2016/6/10.
 */

@Service("OLAPService")
public class OLAPServiceImpl implements OLAPService{

    @Resource
    OLAPDao olapDao;


    @Override
    public String getMutipleAnalysisData() {
        return olapDao.getMutipleAnalysisData();
    }

    @Override
    public String getHistoryData() {
        return olapDao.getHistoryData();
    }

    @Override
    public String getOnlineHistoryData() {
        return olapDao.getOnlineHistoryData();
    }

    @Override
    public String getHistogramData(String measureValue, String compareValue) {
        return olapDao.getHistogramData(measureValue,compareValue);
    }

    @Override
    public String getMultipleHistogramSetting(String measureValue, String compareValue, String CompareCategory1, String CompareCategory2) {
        return olapDao.getMultipleHistogramSetting(measureValue,compareValue,CompareCategory1,CompareCategory2);
    }

    @Override
    public String getPieData(String inner, String outer, String measureValue) {
        return olapDao.getPieData(inner,outer,measureValue);
    }

    @Override
    public String getRFMPieData(String measure) {
        return olapDao.getRFMPieData(measure);
    }

    @Override
    public String getGridData(String category) {
        return olapDao.getGridData(category);
    }

    @Override
    public String getCategoryData() {
        return olapDao.getCategoryData();
    }

    @Override
    public String getSelectedData(String customer) {
        return olapDao.getSelectedData(customer);
    }

    @Override
    public String getPlanHistogramData(String timeinterval, String measure) {
        return olapDao.getPlanHistogramData(timeinterval,measure);
    }

    @Override
    public String getGoodPredicate(String good) {
        return olapDao.getGoodPredicate(good);
    }

    @Override
    public String getAprioriData(String filePath, double MinMetric, int RulesNum) {
        return olapDao.getAprioriData(filePath,MinMetric,RulesNum);
    }

    @Override
    public String getClusterData(String filePath, int seed,int clustersNum) {
        return olapDao.getClusterData(filePath,seed,clustersNum);
    }

}
