<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Füzyon Yapı | Admin Giriş</title>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900&subset=latin,latin-ext" rel="stylesheet">
</head>

<body>
	<form id="loginForm" class="login" name="f" action="login" method="POST">
	    <fieldset>
	        <legend class="legend"><i class="fa fa-lock" aria-hidden="true" style="font-size: 24px;"></i></legend>
	        <div id="error" class="input" style="text-align:center;font-size: 12px;letter-spacing: 1px;color: #f1abab; display: none;">
			    <p>Some Information Wrong!</p>
			</div>
	        <div class="input">
	            <input type="text" placeholder="Username" name="username" required />
	            <span><i class="fa fa-user"></i></span>
	        </div>
	        <div class="input">
	            <input type="password" placeholder="Password" name="password" required />
	            <span><i class="fa fa-lock"></i></span>
	        </div>
	        <button name="submit" type="submit" value="submit" form="loginForm" class="submit"><i class="fa fa-long-arrow-right"></i></button>
	    </fieldset>
	    <div class="feedback">
	    	checking information 
	        <br/>please wait ...
	    </div>
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="/resources/js/login.js"></script>
</body>

</html>