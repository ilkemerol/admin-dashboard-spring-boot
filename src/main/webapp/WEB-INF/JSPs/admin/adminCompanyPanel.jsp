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
        		<button type="button" class="btn btn-outline-primary btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#savefluidModalRight">Firma Ekle</button>
        	</div>
        	<div class="col-md-6 mb-4">
        		<button type="button" class="btn btn-outline-primary btn-lg btn-block waves-effect waves-light" data-toggle="modal" data-target="#deletefluidModalRight">İş/Proje Ekle</button>
        	</div>
        </div>
        <div id="compactView" style="display: block;">
        </div>
        <div id="basicView" class="row wow fadeIn" style="display: none;">
        </div>
   	</div>
</main>
<script type="text/javascript">
</script>