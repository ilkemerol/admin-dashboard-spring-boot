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
        		<button type="button" class="btn btn-outline-primary btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#saveCompanyfluidModalRight">Firma Ekle</button>
        	</div>
        	<div class="col-md-6 mb-4">
        		<button type="button" id="saveProjectModal" class="btn btn-outline-primary btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#saveProjectfluidModalRight">İş/Proje Ekle</button>
        	</div>
        </div>
        <div class="row wow fadeIn">
        	<div class="col-md-6 mb-4">
        		<button type="button" class="btn btn-outline-danger btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#deleteCompanyfluidModalRight">Firma Sil</button>
        	</div>
        	<div class="col-md-6 mb-4">
        		<button type="button" id="deleteProjectModal" class="btn btn-outline-danger btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#deleteProjectfluidModalRight">İş/Proje Sil</button>
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
	        	<div class="col-md-6 mb-4">
        			<div class="card mb-4">
	                    <div class="card-header text-center">
	                        Aktif Firma/Proje Grafiği
	                    </div>
	                    <div class="card-body">
	                        <canvas id="barChart"></canvas>
	                    </div>
                	</div>
        		</div>
        		<div class="col-md-6 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Aktif Firma Detayları
	                    </div>
	                    <div class="card-body">
			       			<table id="activeCompanyTable" class="table table-bordered table-hover btn-table table-responsive-md">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Firma Adı</th>
									<th>Firma Vergi No</th>
									<th>Firma Tipi</th>
									<th>Aktif Proje Sayısı</th>
									<th>Düzenle</th>
									</tr>
			  					</thead>
			  					<tbody id="activeCompanyTableBody" class="text-center">
			  					
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
	                        Proje Sayısı/Toplam Maliyet Grafiği
	                    </div>
	                    <div class="card-body">
	                        <canvas id="lineChart"></canvas>
	                    </div>
                	</div>
        		</div>
	        	<div class="col-md-6 mb-4">
	        		<div class="card mb-4">
	                    <div class="card-header text-center">
	                    	Aktif Proje Detayları
	                    </div>
	                    <div class="card-body">
			       			<table id="activeProjectTable" class="table table-bordered table-hover btn-table table-responsive-md">
			       				<thead class="text-center modalHeaderGradient white-text">
			   						<tr>
									<th>Proje Adı</th>
									<th>Bağlı Olduğu Firma</th>
									<th>Proje Maliyeti</th>
									<th>Proje Tarihi</th>
									<th>Detay</th>
									</tr>
			  					</thead>
			  					<tbody id="activeProjectTableBody" class="text-center">
			  					
			  					</tbody>
			        		</table>
		        		</div>
                	</div>
	        	</div>
	        </div>
        </div>
        <div id="basicView" class="row wow fadeIn" style="display: none;">
        </div>
        <div class="modal fade right" id="saveCompanyfluidModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
		        <div class="modal-content">
		            <div id="savemodalHead" class="modal-header modalHeaderGradient">
		                <p class="heading lead"><i class="fas fa-building mr-1"></i> Şirket Ekle</p>
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
						    <label id="form1Label" for="form1">Şirket Adı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-barcode prefix grey-text"></i>
						    <input type="text" id="form2" name="form2" class="form-control validate">
						    <label id="form2Label" for="form2">Şirket Vergi No</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="text" id="form3" name="form3" class="form-control validate">
						    <label id="form3Label" for="form3">Şirket Tipi</label>
						</div>
		            </div>
		
		            <div class="modal-footer justify-content-center">
		                <button id="saveCompany" class="btn btn-outline-primary waves-effect">Kaydet <i class="fas fa-save ml-1"></i></button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="modal fade right" id="saveProjectfluidModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
		        <div class="modal-content">
		            <div id="saveProjectmodalHead" class="modal-header modalHeaderGradient">
		                <p class="heading lead"><i class="fas fa-project-diagram mr-1"></i> Proje Ekle</p>
		                <button type="button" class="close closeOv" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" class="white-text">×</span>
		                </button>
		            </div>
		
		            <div class="modal-body">
		                <div class="text-center">
		                    <i id="saveProjectmodalIcon" class="fas fa-plus fa-4x mb-3 fontAweOnlyColor animated rotateIn"></i>
		                </div>
		                <div class="md-form mb-5">
						    <label style="position: static;">Şirket Adı</label>
						    <select id="companyNameDropdown" class="browser-default custom-select">
								<option disabled selected>Seçiniz</option>
							</select>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-barcode prefix grey-text"></i>
						    <input type="text" id="projectform2" name="projectform2" class="form-control validate">
						    <label id="projectform2Label" for="projectform2">Proje Adı</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="text" id="projectform3" name="projectform3" class="form-control validate">
						    <label id="projectform3Label" for="projectform3">Proje No</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="number" id="projectform4" name="projectform4" class="form-control validate">
						    <label id="projectform4Label" for="projectform4">Proje Maliyeti</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="text" id="projectform5" name="projectform5" class="form-control validate">
						    <label id="projectform5Label" for="projectform5">Proje Başlangıç Tarihi</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="text" id="projectform6" name="projectform6" class="form-control validate">
						    <label id="projectform6Label" for="projectform6">Proje Bitiş Tarihi</label>
						</div>
						<div class="md-form mb-5">
						    <i class="fas fa-cube prefix grey-text"></i>
						    <input type="number" id="projectform7" name="projectform7" class="form-control validate">
						    <label id="projectform7Label" for="projectform7">Proje Fiyatı</label>
						</div>
		            </div>
		
		            <div class="modal-footer justify-content-center">
		                <button id="saveProject" class="btn btn-outline-primary waves-effect">Kaydet <i class="fas fa-save ml-1"></i></button>
		            </div>
		        </div>
		    </div>
		</div>
   	</div>
</main>
<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach var="i" begin="0" end="${fn:length(companyProjectData)}">
			<c:set var="len" value="${fn:length(companyProjectData)}" />
			<c:if test="${ i < len}">
				<c:if test="${companyProjectData[i].c_statu == 'A'}">
					$("#activeCompanyTableBody").append('<tr id="${i}"><td class="name">${companyProjectData[i].c_name}</td><td class="tax_no">${companyProjectData[i].c_tax_no}</td><td class="type">${companyProjectData[i].c_type}</td><td class="count">${companyProjectData[i].p_count}</td>"<td><button type="button" name="${i}" class="editCompany btn btn-outline-primary btn-sm m-0 waves-effect">Düzenle</button></td></tr>')
				</c:if>
			</c:if>
		</c:forEach>
		<c:forEach var="i" begin="0" end="${fn:length(projectData)}">
			<c:set var="len" value="${fn:length(projectData)}" />
			<c:if test="${ i < len}">
				$("#activeProjectTableBody").append('<tr id="${i}"><td class="name">${projectData[i].p_name}</td><td class="companyName">${projectData[i].c_name}</td><td class="price">${projectData[i].p_price}</td><td class="startdate">${projectData[i].p_startdate}</td>"<td><button type="button" name="${i}" class="detailProject btn btn-outline-primary btn-sm m-0 waves-effect">Detay</button></td></tr>')
			</c:if>
		</c:forEach>
		var barArrCount = new Array();
		var barArrName = new Array();
		<c:forEach var="i" begin="0" end="${fn:length(companyProjectData)}">
			<c:set var="len" value="${fn:length(companyProjectData)}" />
			<c:if test="${ i < len}">
				barArrName.push("${companyProjectData[i].c_name}");
				barArrCount.push(${companyProjectData[i].p_count});
			</c:if>
		</c:forEach>
		//bar
		var ctxB = document.getElementById("barChart").getContext('2d');
		var myBarChart = new Chart(ctxB, {
			type: 'bar',
			data: {
				labels: barArrName,
				datasets: [{
					data: barArrCount,
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
				responsive: true,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
		//line
		var ctxL = document.getElementById("lineChart").getContext('2d');
		var myLineChart = new Chart(ctxL, {
			type: 'line',
			data: {
				labels: ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"],
				datasets: [{
						label: "Proje Sayısı",
						data: [65, 59, 80, 81, 56, 55, 40,65, 59, 80, 81, 56],
						backgroundColor: [
							'rgba(105, 0, 132, .2)',
						],
						borderColor: [
							'rgba(200, 99, 132, .7)',
						],
						borderWidth: 2
					},
					{
						label: "Toplam Maliyet",
						data: [28, 48, 40, 19, 86, 27, 90, 65, 59, 80, 81, 56],
						backgroundColor: [
							'rgba(0, 137, 132, .2)',
						],
						borderColor: [
							'rgba(0, 10, 130, .7)',
						],
						borderWidth: 2
					}
				]
			},
			options: {
				responsive: true
			}
		});
		$("#saveProjectModal").click(function(){
			$.ajax({
				type: 'post',
				url: '/admin/getCompanyNames',
				data: {
				},
				success: function(msg) {
					$("#companyNameDropdown option").remove();
					$("#companyNameDropdown").append('<option disabled selected>Seçiniz</option>');
					$.each(msg, function(index, item){
						$("#companyNameDropdown").append('<option value="' + item + '">' + item + '</option>');					
					});
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
		$("#saveCompany").click(function(){
			$("#savemodalIcon").removeClass("fa-plus");
			$("#savemodalIcon").addClass("fa-sync-alt");
			$("#savemodalIcon").addClass("spin");
			$.ajax({
				type: 'post',
				url: '/admin/saveCompany',
				data: {
					name: $('input[name=form1]').val(),
					tax_no: $('input[name=form2]').val(),
					type: $('input[name=form3]').val(),
				},
				success: function(msg) {
					$("#savemodalHead").addClass("aqua-gradient");
					$("#savemodalHead").removeClass("modalHeaderGradient");
					$("#savemodalIcon").removeClass("fa-sync-alt");
					$("#savemodalIcon").removeClass("spin");
					$("#savemodalIcon").addClass("fa-check");
					$("#savefluidModalRight input").attr('disabled','disabled');
					$("#form1").removeClass("valid");
					$("#form2").removeClass("valid");
					$("#form3").removeClass("valid");
					location.href = '/admin/companyPanel';
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
		$("#saveProject").click(function(){
			$("#saveProjectmodalIcon").removeClass("fa-plus");
			$("#saveProjectmodalIcon").addClass("fa-sync-alt");
			$("#saveProjectmodalIcon").addClass("spin");
			$.ajax({
				type: 'post',
				url: '/admin/saveProject',
				data: {
					c_name: document.getElementById("companyNameDropdown").value,
					p_name: $('input[name=projectform2]').val(),
					p_no: $('input[name=projectform3]').val(),
					p_price: $('input[name=projectform4]').val(),
					p_startdate: $('input[name=projectform5]').val(),
					p_deliverydate: $('input[name=projectform6]').val(),
					p_profit: $('input[name=projectform7]').val(),
				},
				success: function(msg) {
					$("#saveProjectmodalHead").addClass("aqua-gradient");
					$("#saveProjectmodalHead").removeClass("modalHeaderGradient");
					$("#saveProjectmodalIcon").removeClass("fa-sync-alt");
					$("#saveProjectmodalIcon").removeClass("spin");
					$("#savepROJECTmodalIcon").addClass("fa-check");
					$("#saveProjectfluidModalRight input").attr('disabled','disabled');
					$("#projectform1").removeClass("valid");
					$("#projectform2").removeClass("valid");
					$("#projectform3").removeClass("valid");
					$("#projectform4").removeClass("valid");
					$("#projectform5").removeClass("valid");
					$("#projectform6").removeClass("valid");
					$("#projectform7").removeClass("valid");
					location.href = '/admin/companyPanel';
					console.log("Success");
				},
				error: function(msg) {
					console.log("Error");
				}
			});
		});
	});
</script>