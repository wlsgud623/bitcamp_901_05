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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<style>
	.wrap{
		text-align: center;
	margin-left: auto;
	margin-right: auto;
	}
	
 	.wrap2{
		padding-left: 20px;

		
	} 
	
	.my_Recipe{
		text-align: center;
	}
</style>
<script type="text/javascript">


</script>
<body>

	
	
	
<!-- 사진슬라이드 -->


<form action="insert" method="get" class="UserPhoto" enctype="multipart/form-data" >
	<div class="userinfo" style="background-color: white; width: 600px; height: 800px; text-align: center;">	
			<img src="../image/per__son.png" style="text-align:center; cursor:pointer; width: 250px; height:200px; border-radius: 100%; text-align: center;">
		<span class="glyphicon glyphicon-camera" style="font-size: 20px;"></span>
		<br>
			<button type="button">레시피작성go</button>
			<button type="button">정보수정하기</button>
	</div>	

<br>
<h3>내 레시피</h3>

<!-- 내 레시피 -->
  <div class="carousel-inner" style="width: 1290px;">
    
      <div class="My_Recipe_box">
      	<div class="my_Recipe">
      		
      			<a href="/">
        			<img src="../image/food1.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
      			<a href="/">
        			<img src="../image/food2.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
      			<a href="/">
        			<img src="../image/food3.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
        	
      </div>
   </div>
   <br><br><br>
	
<!-- 스크랩한 레시피 -->
<h3>스크랩한 레시피</h3>
   
    
      <div class="My_Scrap_box">
      	<div class="scrap_Racipe">
      		
      			<a href="/">
        			<img src="../image/food1.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
      			<a href="/">
        			<img src="../image/food2.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
      			<a href="/">
        			<img src="../image/food3.jpg" alt="food_img" style="width:33%;">
        		</a>
        	
      </div>
   </div>
	</div>
</form>	




</body>
</html>