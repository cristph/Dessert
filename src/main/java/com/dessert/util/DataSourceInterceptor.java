package com.dessert.util;

import org.aspectj.lang.JoinPoint;

public class DataSourceInterceptor {

	public void setdataSourceOne(JoinPoint jp) {
		DatabaseContextHolder.setCustomerType("dataSourceOne");
	}
	
	public void setdataSourceTwo(JoinPoint jp) {
		DatabaseContextHolder.setCustomerType("dataSourceTwo");
	}
}