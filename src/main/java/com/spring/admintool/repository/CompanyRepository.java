package com.spring.admintool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.spring.admintool.entity.CompanyEntity;
import com.spring.admintool.model.CompanyProjectModel;

public interface CompanyRepository extends CrudRepository<CompanyEntity, Integer>{
	
	@Query("select c.name from CompanyEntity c")
	public List<String> getAllCompanyNames();
	
	@Query("from CompanyEntity c")
	public List<CompanyEntity> getAllCompany();
	
	//@Query("select new com.spring.admintool.model.CompanyProjectModel(c.name, c.tax_no, c.type, count(p.c_name)) from CompanyEntity c inner join c.projectEntity p where p.c_name = c.name")
	//public List<CompanyProjectModel> getCompanyProject();
	
}
