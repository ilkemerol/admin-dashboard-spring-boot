package com.spring.admintool.model;

public class StockTypeDateModel {
	
	private String type;
	private String insert_date;
	
	public StockTypeDateModel(String type, String insert_date) {
		this.type = type;
		this.insert_date = insert_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
}
