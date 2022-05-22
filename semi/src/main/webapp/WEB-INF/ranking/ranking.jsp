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

.wrap_ranking{	
	width: 1200px;
	text-align: center;
}

div{
	border: 1px solid black;
}

.ranking1{
	
}
</style>


	
</head>

<body>
	
<div class="wrap_ranking">		
	
	<div class="ranking1">
		<div class="">
			<img src="../imgfood/111.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		<div class="">
		
		</div>
		
	</div>
	
	
	<div class="ranking2">
		<div class="">
			<img src="../imgfood/112.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		<div class="">
			<img src="../imgfood/113.jpg" style="width: 350px;height: 250px; alt="">
		</div>
		
	</div>
	
	<h2 class="main">Welcome to London</h2>
		<c:forEach var="a" begin="115" end="123">
		<img src="/imgfood/${a}.jpg" style="width: 350px;height: 250px; class="contents">
		<c:if test="${a%3==0}"><br></c:if>
		</c:forEach>
		<br><br>
		
	
	<div class="gallery">
		<div class="card">
			<img src="../imgfood/114.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/115.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/116.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/117.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/118.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/119.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/120.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/121.jpg" alt="">
			<p></p>
		</div>
		
		<div class="card">
			<img src="../imgfood/122.jpg" alt="">
			<p></p>
		</div>
		
	</div>

	
</div>	
</body>
</html>































