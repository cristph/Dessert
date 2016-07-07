package com.dessert.model;

import java.util.ArrayList;

/**
 * Created by cristph on 2016/6/15.
 */
public class SelectData {
    String [] strings;
    DataSet[] dataSets;
    ArrayList<Double[]> doubles;

    public String[] getStrings() {
        return strings;
    }

    public void setStrings(String[] strings) {
        this.strings = strings;
    }

    public DataSet[] getDataSets() {
        return dataSets;
    }

    public void setDataSets(DataSet[] dataSets) {
        this.dataSets = dataSets;
    }

    public ArrayList<Double[]> getDoubles() {
        return doubles;
    }

    public void setDoubles(ArrayList<Double[]> doubles) {
        this.doubles = doubles;
    }
}
