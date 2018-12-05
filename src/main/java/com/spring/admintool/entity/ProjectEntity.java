package com.spring.admintool.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admintool_project")
public class ProjectEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "c_name")
	private String c_name;
	
	@Column(name = "p_name")
	private String p_name;
	
	@Column(name = "p_no")
	private String p_no;
	
	@Column(name = "p_price")
	private Integer p_price;
	
	@Column(name = "p_startdate")
	private String p_startdate;
	
	@Column(name = "p_deliverydate")
	private String p_deliverydate;
	
	@Column(name = "p_profit")
	private Integer p_profit;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public Integer getP_price() {
		return p_price;
	}

	public void setP_price(Integer p_price) {
		this.p_price = p_price;
	}

	public String getP_startdate() {
		return p_startdate;
	}

	public void setP_startdate(String p_startdate) {
		this.p_startdate = p_startdate;
	}

	public String getP_deliverydate() {
		return p_deliverydate;
	}

	public void setP_deliverydate(String p_deliverydate) {
		this.p_deliverydate = p_deliverydate;
	}

	public Integer getP_profit() {
		return p_profit;
	}

	public void setP_profit(Integer p_profit) {
		this.p_profit = p_profit;
	}
	
}
