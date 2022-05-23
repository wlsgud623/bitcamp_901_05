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
.r_mine1,.r_mine2 {
	text-align: center;
	
}

.slideshow_nav{
	text-align: center;

}
img{
	padding-left: 40px;
}
thead th{
	background-color: #006DCC;
	color: white;
	text-align: center;
	
}

tr td:first-child,
tr td:last-child{
border-top-right-radius: 6px;
border-bottom-right-radius: 6px;
	
}

myphoto{
	border-radius: 100%;
	width: 200px;
	height: 200px;
	

}
</style>
<script type="text/javascript">
	$(function(){
	 var container = $('.own'),
	  slideGroup = container.find('.r_mine'),
	  slides = slideGroup.find('a'),
	  nav = container.find('.slideshow_nav'),
	  indicator = container.find('.indicator'),
	  slideCount = slides.length,
	  indicatorHtml = '',
	  currentIndex = 0,
	  duration = 500, /*시간 0.5초*/
	  easing = 'easeInOutExpo' /*2진*/
	  interval = 3500,  /*3.5초*/
	  timer;  /*마우스올리면 멈추기*/ /*여기까지 이름만지정*/
	  
	  //슬라이드 가로로배열
	  //slides 마다 할일필요 0,100,200,300 % left순서로
	  //console.log(slides);
	  
	  
	});

</script>
<body>
<br><br><br><br>
<hr><hr><hr><hr>
<hr><hr><hr><hr>
<hr><hr><hr><hr>

	
	
	
	
<!-- 사진슬라이드 -->
<h2>내 레시피</h2>
	<div class="own">
		<div class="r_mine1">
			<a href=""><img alt="slide1" src="../image/food1.jpg"></a> 
			<a href=""><img alt="slide2" src="../image/food3.jpg"></a> 
			<a href=""><img alt="slide3" src="../image/food2.jpg"></a>
			<a href=""><img alt="slide4" src="../image/food3.jpg"></a>
		</div><!-- r_mine -->
		<br>
		<div class="slideshow_nav" style="font-size: 20px;">
			<a href="" class="prev">prev</a>
			<a href="" class="next">next</a>
		</div><!-- slideshow_nav -->
		<div class="indicator">
			
		</div><!-- indicator -->
	</div><!-- own -->
	
	
<!-- 사진슬라이드 -->
<h2>내가 찜한 레시피</h2>
	<div class="own">
		<div class="r_mine2">
			<a href=""><img alt="slide1" src="../image/food1.jpg"></a> 
			<a href=""><img alt="slide2" src="../image/food3.jpg"></a> 
			<a href=""><img alt="slide3" src="../image/food2.jpg"></a>
			<a href=""><img alt="slide4" src="../image/food3.jpg"></a>
		</div><!-- r_mine -->
		<br>
		<div class="slideshow_nav" style="font-size: 20px;">
			<a href="" class="prev">prev</a>
			<a href="" class="next">next</a>
		</div><!-- slideshow_nav -->
		<div class="indicator">
			
		</div><!-- indicator -->
	</div><!-- own -->
</body>
</html>