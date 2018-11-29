<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:import url="../admin/adminHeader.jsp"></c:import>
</head>
<body class="grey lighten-3">
	<!-- Side & Nav -->
    <header>
		<c:import url="../admin/adminNavbar.jsp"></c:import>
		<c:import url="../admin/adminSidebar.jsp"></c:import>
    </header>
    <!-- /.Side & Nav -->
    <!-- Main -->
    	<c:import url="../admin/${pageName}"></c:import>
    <!-- /.Main- ->
    <!-- Footer -->
    	<c:import url="../admin/adminFooter.jsp"></c:import>
    <!-- /.Footer -->
    <!-- SCRIPTS -->
    	<c:import url="../admin/adminScript.jsp"></c:import>
    <!-- /.SCRIPTS -->
    <script type="text/javascript">
        new WOW().init();
    </script>
</body>
</html>