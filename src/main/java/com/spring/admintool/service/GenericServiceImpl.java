package com.spring.admintool.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.spring.admintool.entity.StockEntity;
import com.spring.admintool.model.StockCountModel;
import com.spring.admintool.model.StockTypeDateModel;
import com.spring.admintool.repository.StockRepository;

@Service
public class GenericServiceImpl implements GenericService {

	@Autowired
	private StockRepository stockRepository;
	
	@Override
	public void saveNewStock(String name, String type, Integer unit_price, Integer count, Integer price, Integer commission, Integer selling_price, String operation_type) {
		StockEntity entity = new StockEntity();
		entity.setName(name);
		entity.setType(type);
		entity.setUnit_price(unit_price);
		entity.setCount(count);
		entity.setPrice(price);
		entity.setCommission(commission);
		entity.setSelling_price(selling_price);
		entity.setInsert_date(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		entity.setOperation_type(operation_type);
		stockRepository.save(entity);
	}

	@Override
	public List<StockEntity> getAllStock() {
		List<StockEntity> stocks = stockRepository.getAllStock();
		if(!CollectionUtils.isEmpty(stocks)) {
			return stocks;
		}
		return null;
	}

	@Override
	public void updateStock(Integer id, String name, String type, Integer unit_price, Integer count, Integer price, Integer commission, Integer selling_price, String operation_type) {
		stockRepository.updateStock(id, name, type, unit_price, count, price, commission, selling_price, new SimpleDateFormat("dd-MM-yyyy").format(new Date()), operation_type);
	}

	@Override
	public List<StockCountModel> getAllStockCount() {
		List<StockCountModel> stockCountData = stockRepository.getAllStockCount();
		if(!CollectionUtils.isEmpty(stockCountData)) {
			return stockCountData;
		}
		return null;
	}

	@Override
	public List<StockTypeDateModel> getSelectedStockType(String name) {
		return stockRepository.getSelectedStockType(name);
	}

	@Override
	public void deleteStock(String name, String type, Integer unit_price, Integer count, Integer price, Integer commission, Integer selling_price, String operation_type) {
		StockEntity entity = new StockEntity();
		entity.setName(name);
		entity.setType(type);
		entity.setUnit_price(unit_price);
		entity.setCount(count);
		entity.setPrice(price);
		entity.setCommission(commission);
		entity.setSelling_price(selling_price);
		entity.setInsert_date(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		entity.setOperation_type(operation_type);
		stockRepository.save(entity);
	}

	@Override
	public List<StockEntity> getSelectedStockData(String name, String type) {
		return stockRepository.getSelectedStockData(name, type);
	}

}
