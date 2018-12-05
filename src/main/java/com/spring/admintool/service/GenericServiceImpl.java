package com.spring.admintool.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.spring.admintool.entity.CompanyEntity;
import com.spring.admintool.entity.ProjectEntity;
import com.spring.admintool.entity.StockEntity;
import com.spring.admintool.model.CompanyProjectModel;
import com.spring.admintool.model.StockCountModel;
import com.spring.admintool.model.StockTypeDateModel;
import com.spring.admintool.repository.CompanyRepository;
import com.spring.admintool.repository.ProjectRepository;
import com.spring.admintool.repository.StockRepository;

@Service
public class GenericServiceImpl implements GenericService {

	@Autowired
	private StockRepository stockRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
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

	@Override
	public void saveNewCompany(String name, String tax_no, String type, String statu) {
		CompanyEntity entity = new CompanyEntity();
		entity.setName(name);
		entity.setTax_no(tax_no);
		entity.setType(type);
		entity.setStatu(statu);
		companyRepository.save(entity);
	}

	@Override
	public List<String> getCompanyNames() {
		return companyRepository.getAllCompanyNames();
	}

	@Override
	public void saveNewProject(String c_name, String p_name, String p_no, Integer p_price, String p_startdate, String p_deliverydate, Integer p_profit) {
		ProjectEntity entity = new ProjectEntity();
		entity.setC_name(c_name);
		entity.setP_name(p_name);
		entity.setP_no(p_no);
		entity.setP_price(p_price);
		entity.setP_startdate(p_startdate);
		entity.setP_deliverydate(p_deliverydate);
		entity.setP_profit(p_profit);
		projectRepository.save(entity);
	}

	@Override
	public List<CompanyProjectModel> getCompanyProject() {
		List<CompanyProjectModel> companyProjectModelList = new ArrayList<CompanyProjectModel>();
		List<CompanyEntity> companyList = companyRepository.getAllCompany();
		for( CompanyEntity s : companyList) {
			CompanyProjectModel companyProjectModel = new CompanyProjectModel();
			String projectCount = projectRepository.getProjectCountForCompany(s.getName());
			companyProjectModel.setC_name(s.getName());
			companyProjectModel.setC_tax_no(s.getTax_no());
			companyProjectModel.setC_type(s.getType());
			companyProjectModel.setC_statu(s.getStatu());
			companyProjectModel.setP_count(projectCount);
			companyProjectModelList.add(companyProjectModel);
		}
		return companyProjectModelList;
	}

	@Override
	public List<ProjectEntity> getAllProject() {
		return projectRepository.getAllProject();
	}

}
