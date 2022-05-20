<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
</style>


	
</head>

<body>
	
		
	<div class="header">
	</div>
	
	
	<div class="ranking1">
		<div class="">
			<img src="../imgfood/1.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		<div class="">
		
		</div>
		
	</div>
	
	
	<div class="ranking2">
		<div class="">
			<img src="../imgfood/2.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		<div class="">
			<img src="../imgfood/3.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		
	</div>
	
	<h2 class="main">Welcome to London</h2>
		<c:forEach var="a" begin="4" end="12">
		<img src="/imgfood/${a}.jpg" style="width: 350px;height: 250px; class="contents">
		<c:if test="${a%3==0}"><br></c:if>
		</c:forEach>
		<br><br>
		
	
	<div class="gallery">
		<div class="card">
			<img src="../imgfood/4.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/5.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/6.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/7.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/8.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/9.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/10.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/11.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/12.jpg" alt="">
			<p></p>
		</div>
		
	</div>
	

	
	<div class="footer">
	</div>
	
	
</body>
</html>































