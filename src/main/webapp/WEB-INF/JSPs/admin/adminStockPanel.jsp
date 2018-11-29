<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/resources/css/admin/custom.css">
<script type="text/javascript" src="/resources/js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/common/popper.min.js"></script>
<script type="text/javascript" src="/resources/js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/common/mdb.min.js"></script>
<main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">
        <div class="row wow fadeIn">
        	<div class="col-md-12 mb-4 text-center">
        		<h3 class="fontAweOnlyColor">Operasyonel İşlemler</h3>
        		<hr>
        	</div>
        </div>
        <div class="row wow fadeIn">
        	<div class="col-md-6 mb-4">
        		<button type="button" class="btn btn-outline-primary btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#savefluidModalRight">Ürün Girdi/Alış</button>
        	</div>
        	<div class="col-md-6 mb-4">
        		<button type="button" class="btn btn-outline-danger btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#deletefluidModalRight">Ürün Çıktı/Satış</button>
        	</div>
        </div>
        <div id="compactView" style="display: block;">
        	<div class="row wow fadeIn">
	        	<div class="col-md-12 mb-4 text-center">
	        		<h3 class="fontAweOnlyColor">Tablo & Grafikler</h3>
	        		<hr>
	        	</div>
	        </div>
	        <div class="row wow fadeIn">
        		<div class="col-md-4 mb-4">
        			<div class="card mb-4">
	                    <div class="card-header text-center">
	                        Ürün Dağılım Grafiği
	                    </div>
	                    <div class="card-body">
	                        <canvas id="pieChart"></canvas>
	                    </div>
                	</div>
        		</div>
        		<div class="col-md-8 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Ürün Toplam Miktarlar
	                    </div>
	                    <div class="card-body">
			       			<table id="stockCountTable" class="table table-bordered table-hover btn-table">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Ürün Adı</th>
									<th>Adeti</th>
									</tr>
			  					</thead>
			  					<tbody id="stockCountTableBody" class="text-center">
			  					
			  					</tbody>
			        		</table>
		        		</div>
                	</div>
	        	</div>
        	</div>
	        <div class="row wow fadeIn">
	        	<div class="col-md-6 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Ürün Girdi/Alış
	                    </div>
	                    <div class="card-body">
			       			<table id="stockBuyingTable" class="table table-bordered table-hover table-responsive-md btn-table">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Id</th>
									<th>Ürün Adı</th>
									<th>Ürün Türü</th>
									<th>Adeti</th>
									<th>Maliyet</th>
									<th>Komisyon Oranı</th>
									<th>Alış Tarihi</th>
									</tr>
			  					</thead>
			  					<tbody id="stockBuyingTableBody" class="text-center">
			  					
			  					</tbody>
			        		</table>
		        		</div>
                	</div>
	        	</div>
	        	<div class="col-md-6 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Ürün Çıktı/Satış
	                    </div>
	                    <div class="card-body">
			       			<table id="stockSellingTable" class="table table-bordered table-hover table-responsive-md btn-table">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Id</th>
									<th>Ürün Adı</th>
									<th>Ürün Türü</th>
									<th>Adeti</th>
									<th>Komisyon Oranı</th>
									<th>Satış Fiyatı</th>
									<th>Satış Tarihi</th>
									</tr>
			  					</thead>
			  					<tbody id="stockSellingTableBody" class="text-center">
			  					
			  					</tbody>
			        		</table>
		        		</div>
                	</div>
	        	</div>
        	</div>
        	<div class="row wow fadeIn">
	        	<div class="col-md-12 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Ürün Hareketleri
	                    </div>
	                    <div class="card-body">
	                    	<div class="row">
	                    		<div class="col-md-3 mb-1">
	                    			<!-- Search form -->
									<form class="form-inline md-form form-sm mt-0">
									  <i class="fas fa-search" aria-hidden="true"></i>
									  <input class="form-control form-control-sm ml-3 w-75" type="text" id="searchToolInput" onkeyup="searchTool()" placeholder="Ara" aria-label="Search">
									</form>
	                    		</div>
	                    		<div class="col-md-3 mb-1">
	                    			<section style="padding: 15px;">
										<div class="custom-control custom-radio custom-control-inline">
										  <input type="radio" class="custom-control-input" id="nameSearch1" name="nameSearch1" checked>
										  <label class="custom-control-label" for="nameSearch1">Adı ile</label>
										</div>
										
										<div class="custom-control custom-radio custom-control-inline">
										  <input type="radio" class="custom-control-input" id="typeSearch1" name="typeSearch1">
										  <label class="custom-control-label" for="typeSearch1">Türü ile</label>
										</div>
									</section>
	                    		</div>
	                    	</div>
			       			<table id="stockTable" class="table table-bordered table-hover table-responsive-md btn-table">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Id</th>
									<th>Ürün Adı</th>
									<th>Ürün Türü</th>
									<th>Birim Fiyatı</th>
									<th>Adeti</th>
									<th>Maliyet</th>
									<th>Komisyon Oranı</th>
									<th>Satış Fiyatı</th>
									<th>Ekleme Tarihi</th>
									<th>Düzenleme Tarihi</th>
									<th>Düzenle</th>
									</tr>
			  					</thead>
			  					<tbody id="stockTableBody" class="text-center">
			  					
			  					</tbody>
			        		</table>
		        		</div>
                	</div>
	        	</div>
        	</div>
        	<div class="row wow fadeIn">
        		<div class="col-md-4 mb-4">
        			<div class="card mb-4">
	                    <div class="card-header text-center">
	                        Alış/Satış Grafiği
	                    </div>
	                    <div class="card-body">
	                        <canvas id="barChart"></canvas>
	                    </div>
                	</div>
        		</div>
        	</div>
        </div>
        <div id="basicView" class="row wow fadeIn" style="display: none;">
        </div>
        <div class="modal fade right" id="savefluidModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
		        <div class="modal-content">
		            <div id="savemodalHead" class="modal-header modalHeaderGradient">
		                <p class="heading lead">Ürün Girdi/Alış</p>
		                <button type="button" class="close closeOv" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" class="white-text">×</span>
		                </button>
		            </div>
		
		            <div class="modal-body">
		                <div class="text-center">
		                    <i id="savemodalIcon" class="fas fa-plus fa-4x mb-3 fontAweOnlyColor animated rotateIn"></i>
		                </div>
		                <div class="md-form mb-5">
						    <i class="fas fa-dolly prefix grey-text"></i>
						    <input type="text" id="form1" name="form1" class="form-control validate">
						    <label id="form1Label" for="form1">Ürün Adı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-barcode prefix grey-text"></i>
						    <input type="text" id="form2" name="form2" class="form-control validate">
						    <label id="form2Label" for="form2">Ürün Türü</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="number" id="form3" name="form3" class="form-control validate">
						    <label id="form3Label" for="form3">Birim Fiyati</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cubes prefix grey-text"></i>
						    <input type="number" id="form4" name="form4" class="form-control validate">
						    <label id="form4Label" for="form4">Ürün Adeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-money-bill-alt prefix grey-text"></i>
						    <input type="number" id="form5" name="form5" class="form-control validate">
						    <label id="form5Label" for="form5">Ürün Maliyeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-percentage prefix grey-text"></i>
						    <input type="number" id="form6" name="form6" class="form-control validate">
						    <label id="form6Label" for="form6">Komisyon Oranı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-lira-sign prefix grey-text"></i>
						    <input type="number" id="form7" name="form7" class="form-control validate">
						    <label id="form7Label" for="form7">Önerilen Satış Fiyatı</label>
						</div>
		            </div>
		
		            <div class="modal-footer justify-content-center">
		                <button id="saveStock" class="btn btn-outline-primary waves-effect">Kaydet <i class="fas fa-save ml-1"></i></button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="modal fade right" id="deletefluidModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
		        <div class="modal-content">
		            <div id="deletemodalHead" class="modal-header young-passion-gradient">
		                <p class="heading lead">Ürün Çıktı/Satış</p>
		                <button type="button" class="close closeOv" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" class="white-text">×</span>
		                </button>
		            </div>
		
		            <div class="modal-body">
		                <div class="text-center">
		                    <i id="deletemodalIcon" class="fas fa-minus fa-4x mb-3 fontAweOnlyColorRed animated rotateIn"></i>
		                </div>
		                <div class="md-form mb-5">
		                	<label style="position: static;">Ürün Adı</label>
					    	<select id="stockNameDropdown" onchange="getStockType()" class="browser-default custom-select">
								<option disabled selected>Seçiniz</option>
							</select>
						</div>
						<div class="md-form mb-5">
							<label style="position: static;">Ürün Türü</label>
						    <select id="stockTypeDropdown" onchange="getStockDataWithNameAndType()" class="browser-default custom-select">
								<option disabled selected>Seçiniz</option>
							</select>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="number" id="deleteform3" name="deleteform3" class="form-control validate">
						    <label id="deleteform3Label" for="deleteform3">Birim Fiyati</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cubes prefix grey-text"></i>
						    <input type="number" id="deleteform4" name="deleteform4" class="form-control validate">
						    <label id="deleteform4Label" for="deleteform4">Ürün Adeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-money-bill-alt prefix grey-text"></i>
						    <input type="number" id="deleteform5" name="deleteform5" class="form-control validate">
						    <label id="deleteform5Label" for="deleteform5">Ürün Net Fiyatı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-percentage prefix grey-text"></i>
						    <input type="number" id="deleteform6" name="deleteform6" class="form-control validate">
						    <label id="deleteform6Label" for="deleteform6">Komisyon Oranı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-lira-sign prefix grey-text"></i>
						    <input type="number" id="deleteform7" name="deleteform7" class="form-control validate">
						    <label id="deleteform7Label" for="deleteform7">Önerilen Satış Fiyatı</label>
						</div>
		            </div>
		
		            <div class="modal-footer justify-content-center">
		                <button id="deleteStock" class="btn btn-outline-danger waves-effect">Kaydet <i class="fas fa-save ml-1"></i></button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="modal fade right" id="updatefluidModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
		        <div class="modal-content">
		            <div id="updatemodalHead" class="modal-header sunny-morning-gradient">
		                <p class="heading lead">Ürün Güncelle</p>
		                <button type="button" class="close closeOv" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" class="white-text">×</span>
		                </button>
		            </div>
		
		            <div class="modal-body">
		                <div class="text-center">
		                    <i id="updatemodalIcon" class="fas fa-pencil-alt fa-4x mb-3 fontAweOnlyColorEdit animated rotateIn"></i>
		                </div>
		                <div class="md-form mb-5">
						    <i class="fas fa-dolly prefix grey-text"></i>
						    <input type="hidden" id="updateformH" name="updateformH" class="form-control">
						    <input type="text" id="updateform1" name="updateform1" class="form-control validate">
						    <label id="updateform1Label" for="updateform1">Ürün Adı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-barcode prefix grey-text"></i>
						    <input type="text" id="updateform2" name="updateform2" class="form-control validate">
						    <label id="updateform2Label" for="updateform2">Ürün Türü</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="number" id="updateform3" name="updateform3" class="form-control validate">
						    <label id="updateform3Label" for="updateform3">Birim Fiyati</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cubes prefix grey-text"></i>
						    <input type="number" id="updateform4" name="updateform4" class="form-control validate">
						    <label id="updateform4Label" for="updateform4">Ürün Adeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-money-bill-alt prefix grey-text"></i>
						    <input type="number" id="updateform5" name="updateform5" class="form-control validate">
						    <label id="updateform5Label" for="updateform5">Ürün Maliyeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-percentage prefix grey-text"></i>
						    <input type="number" id="updateform6" name="updateform6" class="form-control validate">
						    <label id="updateform6Label" for="updateform6">Komisyon Oranı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-lira-sign prefix grey-text"></i>
						    <input type="number" id="updateform7" name="updateform7" class="form-control validate">
						    <label id="updateform7Label" for="updateform7">Önerilen Satış Fiyatı</label>
						</div>
		            </div>
		
		            <div class="modal-footer justify-content-center">
		                <button id="updateStock" class="btn btn-outline-warning waves-effect">Güncelle <i class="fas fa-paper-plane ml-1"></i></button>
		            </div>
		        </div>
		    </div>
		</div>
   	</div>
</main>
<script type="text/javascript">
	function searchTool() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("searchToolInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("stockTable");
		tr = table.getElementsByTagName("tr");
		for(i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if(td) {
				if(td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	function getStockType() {
		var selectedVal = document.getElementById("stockNameDropdown").value;
		$.ajax({
			type: 'post',
			url: '/admin/getSelectedStockType',
			data: {
				name: selectedVal,
			},
			success: function(msg) {
				$("#stockTypeDropdown option").remove();
				$("#stockTypeDropdown").append('<option disabled selected>Seçiniz</option>');
				$.each(msg, function(index, item){
					$("#stockTypeDropdown").append('<option value="' + item.type + '">' + item.type + ' - ' + item.insert_date + '</option>');					
				});
				console.log("Success");
			},
			error: function(msg) {
				console.log("Error");
			}
		});
	}
	function getStockDataWithNameAndType() {
		var selectedNameVal = document.getElementById("stockNameDropdown").value;
		var selectedTypeVal = document.getElementById("stockTypeDropdown").value;
		$.ajax({
			type: 'post',
			url: '/admin/getSelectedStockData',
			data: {
				name: selectedNameVal,
				type: selectedTypeVal,
			},
			success: function(msg) {
				$("#deleteform3").val(msg[0].unit_price);
				$("#deleteform3Label").addClass("active");
				$("#deleteform4").val(msg[0].count);
				$("#deleteform4Label").addClass("active");
				$("#deleteform5").val(msg[0].price);
				$("#deleteform5Label").addClass("active");
				$("#deleteform6").val(msg[0].commission);
				$("#deleteform6Label").addClass("active");
				$("#deleteform7").val(msg[0].selling_price);
				$("#deleteform7Label").addClass("active");
				console.log("Success");
			},
			error: function(msg) {
				console.log("Error");
			}
		});
	}
	$(document).ready(function(){
		var pieArrCount = new Array();
		var pieArrName = new Array();
		<c:forEach var="i" begin="0" end="${fn:length(stockCountData)}">
			<c:set var="len" value="${fn:length(stockCountData)}" />
			<c:if test="${ i < len}">
				pieArrName.push("${stockCountData[i].name}");
				pieArrCount.push(${stockCountData[i].count});
				$("#stockNameDropdown").append('<option value="${stockCountData[i].name}">${stockCountData[i].name}</option>');
			</c:if>
		</c:forEach>
		//pie
		var ctxP = document.getElementById("pieChart").getContext('2d');
		var myPieChart = new Chart(ctxP, {
		    type: 'pie',
		    data: {
		        labels: pieArrName,
		        datasets: [{
		            data: pieArrCount,
		            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
		            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
		        }]
		    },
		    options: {
		        responsive: true,
		    }
		});
		var totalRate = new Array();
		var buyingStock = 0;
		var sellingStock = 0;
		<c:forEach var="i" begin="0" end="${fn:length(stockData)}">
			<c:set var="len" value="${fn:length(stockData)}" />
			<c:if test="${ i < len}">
				<c:if test="${stockData[i].operation_type == 'B'}">
					buyingStock = buyingStock + ${stockData[i].price};
				</c:if>
				<c:if test="${stockData[i].operation_type == 'C'}">
					buyingStock = buyingStock + ${stockData[i].price};
				</c:if>
				<c:if test="${stockData[i].operation_type == 'S'}">
					sellingStock = sellingStock + ${stockData[i].selling_price};
				</c:if>
			</c:if>
		</c:forEach>
		totalRate.push(buyingStock);
		totalRate.push(sellingStock);
		//bar
		var ctxB = document.getElementById("barChart").getContext('2d');
		var myBarChart = new Chart(ctxB, {
			type: 'bar',
			data: {
				labels: ["Toplam Maliyet", "Toplam Satış"],
				datasets: [{
					data: totalRate,
					backgroundColor: [
						'rgba(75, 192, 192, 0.2)',
						'rgba(255, 99, 132, 0.2)',
					],
					borderColor: [
						'rgba(75, 192, 192, 1)',
						'rgba(255,99,132,1)',
					],
					borderWidth: 1
				}]
			},
			options: {
				legend: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
	});
	$(document).ready(function(){
		<c:forEach var="i" begin="0" end="${fn:length(stockData)}">
			<c:set var="len" value="${fn:length(stockData)}" />
			<c:if test="${ i < len}">
				<c:if test="${stockData[i].operation_type == 'B'}">
					$("#stockTableBody").append('<tr id="${i}" class="table-green-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="unit_price">${stockData[i].unit_price}</td><td class="count">${stockData[i].count}</td><td class="price">${stockData[i].price}</td><td class="commission">${stockData[i].commission}</td><td class="selling_price">${stockData[i].selling_price}</td><td>${stockData[i].insert_date}</td><td>${stockData[i].update_date}</td><td><button type="button" name="${i}" class="editStock btn btn-outline-primary btn-sm m-0 waves-effect">Düzenle</button></td></tr>')
					$("#stockBuyingTableBody").append('<tr class="table-green-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="count">${stockData[i].count}</td><td class="price">${stockData[i].price}</td><td class="commission">${stockData[i].commission}</td><td>${stockData[i].insert_date}</td></tr>')
				</c:if>
				<c:if test="${stockData[i].operation_type == 'C'}">
					$("#stockTableBody").append('<tr id="${i}" class="table-yellow-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="unit_price">${stockData[i].unit_price}</td><td class="count">${stockData[i].count}</td><td class="price">${stockData[i].price}</td><td class="commission">${stockData[i].commission}</td><td class="selling_price">${stockData[i].selling_price}</td><td>${stockData[i].insert_date}</td><td>${stockData[i].update_date}</td><td><button type="button" name="${i}" class="editStock btn btn-outline-primary btn-sm m-0 waves-effect">Düzenle</button></td></tr>')
					$("#stockBuyingTableBody").append('<tr class="table-green-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="count">${stockData[i].count}</td><td class="price">${stockData[i].price}</td><td class="commission">${stockData[i].commission}</td><td>${stockData[i].insert_date}</td></tr>')
				</c:if>
				<c:if test="${stockData[i].operation_type == 'S'}">
					$("#stockTableBody").append('<tr id="${i}" class="table-red-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="unit_price">${stockData[i].unit_price}</td><td class="count">${stockData[i].count}</td><td class="price">${stockData[i].price}</td><td class="commission">${stockData[i].commission}</td><td class="selling_price">${stockData[i].selling_price}</td><td>${stockData[i].insert_date}</td><td>${stockData[i].update_date}</td><td><button type="button" name="${i}" class="editStock btn btn-outline-primary btn-sm m-0 waves-effect">Düzenle</button></td></tr>')
					$("#stockSellingTableBody").append('<tr class="table-red-bg"><th scope="row" class="id">${stockData[i].id}</th><td class="name">${stockData[i].name}</td><td class="type">${stockData[i].type}</td><td class="count">${stockData[i].count}</td><td class="commission">${stockData[i].commission}</td><td class="selling_price">${stockData[i].selling_price}</td><td>${stockData[i].insert_date}</td></tr>')
				</c:if>
			</c:if>
		</c:forEach>
		<c:forEach var="i" begin="0" end="${fn:length(stockCountData)}">
			<c:set var="len" value="${fn:length(stockCountData)}" />
			<c:if test="${ i < len}">
				$("#stockCountTableBody").append('<tr><td class="name">${stockCountData[i].name}</td><td class="count">${stockCountData[i].count}</td></tr>');
			</c:if>
		</c:forEach>
		$("input[name=form3]").keyup(function(){
			$("#form5Label").addClass("active");
			$('input[name=form5]').val($("input[name=form3]").val() * $("input[name=form4]").val());
		});
		$("input[name=form4]").keyup(function(){
			$("#form5Label").addClass("active");
			$('input[name=form5]').val($("input[name=form3]").val() * $("input[name=form4]").val());
		});
		$("input[name=form6]").keyup(function(){
			$("#form7Label").addClass("active");
			$('input[name=form7]').val((+$("input[name=form5]").val()) + (+($("input[name=form5]").val() * $("input[name=form6]").val()) / 100));
		});
		$("input[name=updateform3]").keyup(function(){
			$("#updateform5Label").addClass("active");
			$('input[name=updateform5]').val($("input[name=updateform3]").val() * $("input[name=updateform4]").val());
		});
		$("input[name=updateform4]").keyup(function(){
			$("#updateform5Label").addClass("active");
			$('input[name=updateform5]').val($("input[name=updateform3]").val() * $("input[name=updateform4]").val());
		});
		$("input[name=updateform6]").keyup(function(){
			$("#updateform7Label").addClass("active");
			$('input[name=updateform7]').val((+$("input[name=updateform5]").val()) + (+($("input[name=updateform5]").val() * $("input[name=updateform6]").val()) / 100));
		});
		
		$("input[name=deleteform3]").keyup(function(){
			$("#deleteform5Label").addClass("active");
			$('input[name=deleteform5]').val($("input[name=deleteform3]").val() * $("input[name=deleteform4]").val());
		});
		$("input[name=deleteform4]").keyup(function(){
			$("#deleteform5Label").addClass("active");
			$('input[name=deleteform5]').val($("input[name=deleteform3]").val() * $("input[name=deleteform4]").val());
		});
		$("input[name=deleteform6]").keyup(function(){
			$("#deleteform7Label").addClass("active");
			$('input[name=deleteform7]').val((+$("input[name=deleteform5]").val()) + (+($("input[name=deleteform5]").val() * $("input[name=deleteform6]").val()) / 100));
		});
		$(".editStock").click(function(){
			var btnName = this.name;
			$("#updatefluidModalRight").modal();
			$("#updateformH").val($("#" + btnName + " .id").text());
			$("#updateform1").val($("#"+ btnName +" .name").text());
			$("#updateform1Label").addClass("active");
			$("#updateform2").val($("#"+ btnName +" .type").text());
			$("#updateform2Label").addClass("active");
			$("#updateform3").val($("#"+ btnName +" .unit_price").text());
			$("#updateform3Label").addClass("active");
			$("#updateform4").val($("#"+ btnName +" .count").text());
			$("#updateform4Label").addClass("active");
			$("#updateform5").val($("#"+ btnName +" .price").text());
			$("#updateform5Label").addClass("active");
			$("#updateform6").val($("#"+ btnName +" .commission").text());
			$("#updateform6Label").addClass("active");
			$("#updateform7").val($("#"+ btnName +" .selling_price").text());
			$("#updateform7Label").addClass("active");
		});
		$("#updateStock").click(function(){
			$.ajax({
				type: 'post',
				url: '/admin/updateStock',
				data: {
					id: $('input[name=updateformH]').val(),
					name: $('input[name=updateform1]').val(),
					type: $('input[name=updateform2]').val(),
					unit_price: $('input[name=updateform3]').val(),
					count: $('input[name=updateform4]').val(),
					price: $('input[name=updateform5]').val(),
					commission: $('input[name=updateform6]').val(),
					selling_price: $('input[name=updateform7]').val(),
				},
				success: function(msg) {
					$("#updatemodalHead").addClass("aqua-gradient");
					$("#updatemodalHead").removeClass("modalHeaderGradient");
					$("#updatemodalIcon").removeClass("fa-plus");
					$("#updatemodalIcon").addClass("fa-check");
					$("#updatefluidModalRight input").attr('disabled','disabled');
					$("#updateform1").removeClass("valid");
					$("#updateform2").removeClass("valid");
					$("#updateform3").removeClass("valid");
					$("#updateform4").removeClass("valid");
					$("#updateform5").removeClass("valid");
					$("#updateform6").removeClass("valid");
					$("#updateform7").removeClass("valid");
					location.href = '/admin/stockPanel';
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
		$("#saveStock").click(function(){
			$.ajax({
				type: 'post',
				url: '/admin/saveStock',
				data: {
					name: $('input[name=form1]').val(),
					type: $('input[name=form2]').val(),
					unit_price: $('input[name=form3]').val(),
					count: $('input[name=form4]').val(),
					price: $('input[name=form5]').val(),
					commission: $('input[name=form6]').val(),
					selling_price: $('input[name=form7]').val(),
				},
				success: function(msg) {
					$("#savemodalHead").addClass("aqua-gradient");
					$("#savemodalHead").removeClass("modalHeaderGradient");
					$("#savemodalIcon").removeClass("fa-plus");
					$("#savemodalIcon").addClass("fa-check");
					$("#savefluidModalRight input").attr('disabled','disabled');
					$("#form1").removeClass("valid");
					$("#form2").removeClass("valid");
					$("#form3").removeClass("valid");
					$("#form4").removeClass("valid");
					$("#form5").removeClass("valid");
					$("#form6").removeClass("valid");
					$("#form7").removeClass("valid");
					location.href = '/admin/stockPanel';
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
		$("#deleteStock").click(function(){
			$.ajax({
				type: 'post',
				url: '/admin/deleteStock',
				data: {
					name: document.getElementById("stockNameDropdown").value,
					type: document.getElementById("stockTypeDropdown").value,
					unit_price: $('input[name=deleteform3]').val(),
					count: $('input[name=deleteform4]').val(),
					price: $('input[name=deleteform5]').val(),
					commission: $('input[name=deleteform6]').val(),
					selling_price: $('input[name=deleteform7]').val(),
				},
				success: function(msg) {
					$("#deletemodalHead").addClass("aqua-gradient");
					$("#deletemodalHead").removeClass("modalHeaderGradient");
					$("#deletemodalIcon").removeClass("fa-minus");
					$("#deletemodalIcon").addClass("fa-check");
					$("#deletefluidModalRight input").attr('disabled','disabled');
					$("#deleteform3").removeClass("valid");
					$("#deleteform4").removeClass("valid");
					$("#deleteform5").removeClass("valid");
					$("#deleteform6").removeClass("valid");
					$("#deleteform7").removeClass("valid");
					location.href = '/admin/stockPanel';
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
	})
</script>