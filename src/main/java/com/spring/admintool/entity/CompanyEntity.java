package com.spring.admintool.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "admintool_company")
public class CompanyEntity {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "tax_no")
	private String tax_no;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "statu")
	private String statu;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTax_no() {
		return tax_no;
	}

	public void setTax_no(String tax_no) {
		this.tax_no = tax_no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}

}
