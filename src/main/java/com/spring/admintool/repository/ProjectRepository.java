package com.spring.admintool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.admintool.entity.CompanyEntity;
import com.spring.admintool.entity.ProjectEntity;

public interface ProjectRepository extends CrudRepository<ProjectEntity, Integer>{

	@Query("select count(*) from ProjectEntity p where p.c_name = :c_name")
	public String getProjectCountForCompany (@Param("c_name") String c_name);
	
	@Query("from ProjectEntity p")
	public List<ProjectEntity> getAllProject();
}
