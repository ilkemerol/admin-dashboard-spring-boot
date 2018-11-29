package com.spring.admintool.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.admintool.entity.StockEntity;
import com.spring.admintool.model.StockCountModel;
import com.spring.admintool.model.StockTypeDateModel;

public interface StockRepository extends CrudRepository<StockEntity, Integer>{

	@Query("from StockEntity")
	public List<StockEntity> getAllStock();
	
	@Query("select new com.spring.admintool.model.StockCountModel(s.name, sum(s.count)) from StockEntity s group by s.name")
	public List<StockCountModel> getAllStockCount();
	
	@Query("select new com.spring.admintool.model.StockTypeDateModel(s.type, s.insert_date) from StockEntity s where s.name = :name and (operation_type = 'B' OR operation_type = 'C')")
	public List<StockTypeDateModel> getSelectedStockType(@Param("name") String name);
	
	@Query("from StockEntity s where s.name = :name and s.type = :type")
	public List<StockEntity> getSelectedStockData(@Param("name") String name, @Param("type") String type);
	
	@Transactional
	@Modifying
	@Query("update StockEntity s set s.name = :name, s.type = :type, s.unit_price = :unit_price, s.count = :count, s.price = :price, s.commission = :commission, s.selling_price = :selling_price, s.update_date = :update_date, s.operation_type = :operation_type where s.id = :id")
	public void updateStock(@Param("id") Integer id, @Param("name") String name, @Param("type") String type, @Param("unit_price") Integer unit_price, @Param("count") Integer count, @Param("price") Integer price, @Param("commission") Integer commission, @Param("selling_price") Integer selling_price, @Param("update_date") String update_date, @Param("operation_type") String operation_type);
}

