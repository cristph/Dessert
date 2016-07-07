package com.dessert.model;

/**
 * Created by cristph on 2016/6/11.
 */
public class DataSet implements Comparable<DataSet>{
    private double value;
    private String name;

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int compareTo(DataSet o) {
        if(this.value>o.getValue()){
            return -1;
        }
        if(this.value<o.getValue()){
            return 1;
        }
        return 0;
    }
}
