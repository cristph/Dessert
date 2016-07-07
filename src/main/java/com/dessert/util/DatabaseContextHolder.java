package com.dessert.util;

public class DatabaseContextHolder {

	public static final String DATA_SOURCE_One = "dataSourceOne";
	public static final String DATA_SOURCE_Two = "dataSourceTwo";

	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

	public static void setCustomerType(String customerType) {
		contextHolder.set(customerType);
	}

	public static String getCustomerType() {
		return contextHolder.get();
	}

	public static void clearCustomerType() {
		contextHolder.remove();
	}
}