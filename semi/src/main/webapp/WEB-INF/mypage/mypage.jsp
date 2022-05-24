<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>

</style>
<script type="text/javascript">
$(".racipego").click(function(){
    var ok = confirm("레시피를 작성하러 가겠습니까?");
    
    if(ok){
    location.assign(ok);
    alert("");
    };
    });

</script>
<body>

	
	
	
<!-- 사진슬라이드 -->


<form action="insert" method="get" class="UserPhoto" enctype="multipart/form-data" >
	<div class="userinfo" style="background-color: white; width: 600px; height: 800px; text-align: center;">	
			<img src="../image/per__son.png" style="text-align:center; cursor:pointer; width: 250px; height:200px; border-radius: 100%; text-align: center;">
		<span class="glyphicon glyphicon-camera" style="font-size: 20px;"></span>
		<br>
			<button type="button" class="btn btn-success racipego">레시피작성go</button>
			<button type="button" class="btn btn-success revise">정보수정하기</button>
	</div>	

<br>
</form>
<h3>내 레시피</h3>

<!-- 내 레시피 -->
<div class="container" style="width: 1500px;">
	<!-- 슬라이더 시작 -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1" class=""></li>
	      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
	    </ol> 
	
		<!-- Wrapper for slides -->
		<div class="carousel-inner" style="width: 1290px;">
		    <div class="item active">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${ownrecipeList}" begin="2" end="4">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/${dto.main_photo}" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
			</div>
			 <div class="item">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${ownrecipeList}" begin="5" end="7">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/${dto.main_photo}" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
			</div>
			 <div class="item">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${ownrecipeList}" begin="8" end="10">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/1.jpg" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
			</div>
		</div>
		
		
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>	
</div>




</body>
</html>