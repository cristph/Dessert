package com.dessert.model;

/**
 * Created by cristph on 2016/6/11.
 */
public class PieData {
    String[] legendData;
    DataSet[] innerData;
    DataSet[] outerData;

    public String[] getLegendData() {
        return legendData;
    }

    public void setLegendData(String[] legendData) {
        this.legendData = legendData;
    }

    public DataSet[] getInnerData() {
        return innerData;
    }

    public void setInnerData(DataSet[] innerData) {
        this.innerData = innerData;
    }

    public DataSet[] getOuterData() {
        return outerData;
    }

    public void setOuterData(DataSet[] outerData) {
        this.outerData = outerData;
    }
}
