package com.spring.admintool.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admintool.annotation.CheckAuthorized;
import com.spring.admintool.entity.StockEntity;
import com.spring.admintool.model.CompanyModel;
import com.spring.admintool.model.ProjectModel;
import com.spring.admintool.model.StockModel;
import com.spring.admintool.model.StockTypeDateModel;
import com.spring.admintool.service.GenericService;

@Controller
//@CheckAuthorized
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private GenericService genericService;

	@GetMapping("/chooseOperation")
	public String chooseOperation(Map<String, Object> model) {
		model.put("pageName", "adminOperation.jsp");
		return "admin/adminMain";
	}
	
	@GetMapping("/stockPanel")
	public String stockPanel(Map<String, Object> model) {
		model.put("stockData", genericService.getAllStock());
		model.put("stockCountData", genericService.getAllStockCount());
		model.put("pageName", "adminStockPanel.jsp");
		return "admin/adminMain"; 
	}
	
	@GetMapping("/companyPanel")
	public String companyPanel(Map<String, Object> model) {
		model.put("companyProjectData", genericService.getCompanyProject());
		model.put("projectData", genericService.getAllProject());
		model.put("pageName", "adminCompanyPanel.jsp");
		return "admin/adminMain"; 
	}
	
	@PostMapping("/saveStock")
	public void saveStock(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StockModel input) {
		genericService.saveNewStock(input.getName(), input.getType(), input.getUnit_price(),input.getCount(), input.getPrice(), input.getCommission(), input.getSelling_price(), "B");
		response.setStatus(200);
	}
	
	@PostMapping("/updateStock")
	public void updateStock(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StockModel input){
		genericService.updateStock(input.getId(), input.getName(), input.getType(), input.getUnit_price(), input.getCount(), input.getPrice(), input.getCommission(), input.getSelling_price(), "C");
		response.setStatus(200);
	}
	@PostMapping("/deleteStock")
	public void deleteStock(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StockModel input) {
		genericService.deleteStock(input.getName(), input.getType(), input.getUnit_price(), (-1 * input.getCount()), input.getPrice(), input.getCommission(), input.getSelling_price(), "S");
		response.setStatus(200);
	}
	
	@ResponseBody
	@PostMapping("/getSelectedStockType")
	public List<StockTypeDateModel> getSelectedStockType(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StockModel input) {
		List<StockTypeDateModel> selectedTypeData = genericService.getSelectedStockType(input.getName());
		response.setStatus(200);
		return selectedTypeData;
	}
	
	@ResponseBody
	@PostMapping("/getSelectedStockData")
	public List<StockEntity> getSelectedStockData(HttpServletRequest request, HttpServletResponse response, @ModelAttribute StockModel input) {
		List<StockEntity> selectedTypeData = genericService.getSelectedStockData(input.getName(), input.getType());
		response.setStatus(200);
		return selectedTypeData;
	}
	
	@PostMapping("/saveCompany")
	public void saveCompany(HttpServletRequest request, HttpServletResponse response, @ModelAttribute CompanyModel input) {
		genericService.saveNewCompany(input.getName(), input.getTax_no(), input.getType(), "A");
		response.setStatus(200);
	}
	
	@PostMapping("/saveProject")
	public void saveProject(HttpServletRequest request, HttpServletResponse response, @ModelAttribute ProjectModel input) {
		genericService.saveNewProject(input.getC_name(), input.getP_name(), input.getP_no(), input.getP_price(), input.getP_startdate(), input.getP_deliverydate(), input.getP_profit());
		response.setStatus(200);
	}
	
	@ResponseBody
	@PostMapping("/getCompanyNames")
	public List<String> getCompanyNames(HttpServletRequest request, HttpServletResponse response) {
		List<String> companyNames = genericService.getCompanyNames();
		response.setStatus(200);
		return companyNames;
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Map<String, Object> model) {
		model.put("pageName", "adminDashboard.jsp");
		return "admin/adminMain";
	}
	
	@GetMapping("/corporateOps")
	public String kurumsalIslem() {
		return "admin/corporateOps";
	}
}
