<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 랭킹</title>
<style type="text/css">

	ul.select{
		margin-top: 80px;
	}
	.nav li a{
		font-weight : bold;
		color: black;
		background-color: #f3f3f3;
		cursor: pointer;
	}
	
	.nav li.active a{
  		background-color: #f3f3f3;
  		color:red;
	} 
	
		
			
	#first_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
		column-gap: 30px;
		padding-top : 30px;
		padding-bottom : 30px;
	/* 	background-color: #f3f3f3; */
		width: 1140px;
	}
	
	.first_div{
		position: relative;
		text-align: center;
		padding-top: 100px;
		width: 1140px;
		/* width: 80%; */
	/* 	background-color: white; */
	}
	
	#first_div_1:before{
		position: absolute; 
		left:5px; top:-5px; 
		width:250px; 
		height: 250px;
		display: block; 
		content: ''; 
		background:url('/image/icons-1st-medal.png')no-repeat;
		background-size: 70%;
		background-position: -10px 30px;
		
	}
	
	
	.first_div img{
		
	}
	
	#second_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
		column-gap: 30px;
		padding-top : 30px;
		padding-bottom : 30px;
	}
	
	.second_div{
		position: relative;
		text-align: center;
		/* width: 80%; */
		width: 555px;
		padding-top: 70px;
	/* 	background-color: white; */
		height: 550px;

	}
	
	#second_div_1:before{
		position: absolute; 
		left:5px; top:-5px; 
		width:100%; 
		height: 200px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-2nd-medal.png')no-repeat;
		background-size: 25%;
		background-position: -10px 30px;
	}
	
	#second_div_2:before{
		position: absolute; 
		left:5px; top:-5px; 
		width:100%; 
		height: 200px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-3rd-medal.png')no-repeat;
		background-size: 25%;
		background-position: -10px 30px;
	}
	
	
	
	.info_tag1{
		display : flex;
		padding-left: 30px;
		justify-content: center;
		padding-top: 50px;
	}
	
	.info_tag1 b{
		font-size: 15px;
		font-weight: bold;
	}
	
	.info_tag1 li {
    	display: inline-block;
    	margin: 5px 2px;
    	min-height: 40px;
	}
	
	.info_tag1 li a {
    	font-size: 25px;
    	line-height: 15px;
    	color: #777777;
    	padding: 5px 20px 7px;
    	border: 1px solid #c1c1c1;
    	background: #fff;
    	border-radius: 50px;
    	text-decoration: none;
	}
	
	.info_tag1 li a:hover{
		background: #f64646; 
		color: #fff;
		border:1px solid #f64646;
	}
	
	.info_tag2{
		display : flex;
		padding-left: 30px;
		justify-content: center;
		padding-top: 50px;
	}
	
	.info_tag2 b{
		font-size: 15px;
		font-weight: bold;
	}
	
	.info_tag2 li {
    	display: inline-block;
    	margin: 5px 2px;
    	min-height: 40px;
	}
	
	.info_tag2 li a {
    	font-size: 25px;
    	line-height: 15px;
    	color: #777777;
    	padding: 5px 20px 7px;
    	border: 1px solid #c1c1c1;
    	background: #fff;
    	border-radius: 50px;
    	text-decoration: none;
	}
	
	.info_tag2 li a:hover{
		background: #f64646; 
		color: #fff;
		border:1px solid #f64646;
	}
	
	
	#normal_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		justify-items: center;
		gap: 20px 20px;
	
	    width: 1140px;
	    display: grid;
	    grid-template-columns: 1fr 1fr 1fr;
	    justify-items: center;
	    gap: 20px 20px;
	    padding-top: 20px;
}
	
	.info_tag{
		display : flex;
		padding-left: 30px;
		justify-content: center;
	}
	
	.info_tag b{
		font-size: 20px;
		font-weight: bold;
	}
	
	.info_tag li {
    	display: inline-block;
    	margin: 5px 2px;
    	min-height: 40px;
	}
	
	.info_tag li a {
    	font-size: 15px;
    	line-height: 15px;
    	color: #777777;
    	padding: 5px 20px 7px;
    	border: 1px solid #c1c1c1;
    	background: #fff;
    	border-radius: 50px;
    	text-decoration: none;
	}
	
	.info_tag li a:hover{
		background: #f64646; 
		color: #fff;
		border:1px solid #f64646;
	}
	
	
	.rec_img {
		overflow:hidden;
	}
	
	.main_image{
		width: 85%;
	}
	
	.main_image:hover{
		transform:scale(1.2);
	}
	
	.info_title a{
		color: black;
	}
	.info_title a:hover{
		text-decoration: none;
	}
	
	.info_title a span{
		font-weight: bold;
		font-size: 2.5rem;
	}
	.info_title a span:hover{
		color: crimson;
	}
	
	.normal_tag {
		padding-left: 20px;
		padding-top: 5px;
	}
	
	.normal_tag li{
		color: gray;
	}
	
	#page_selector {
		text-align: center;
	}
	.vi.pagination > .active > a, .vi.pagination > .active > a:focus,
	.vi.pagination > .active > a:hover, .vi.pagination > .active > span,
	.vi.pagination > .active > span:focus, .vi.pagination > .active > span:hover{
		background-color: crimson;
		border-color: crimson;
		color: white;
	}
	.vi.pagination > li > a, .vi.pagination > li > span{
		color: crimson;
		font-size: 20px;
		margin-left: 10px;
	}
	.arrow{
		color: crimson;
		font-size: 20px;
	}
	div.vi{
		margin-bottom: 80px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".nav>li>a").click(function() {
			$(this).parent().addClass("active");
			$(this).parent().siblings().removeClass("active");
			location.href = $(this).attr("href");
		});
		
		$('a[data-toggle=tab]').click(function(){
		    $(this).css("color", "#f64646");
		    $(this).parent().siblings().children().css("color", "black");
		});
		
		$(".numbtn").click(function() {
			$(this).parent().addClass("active");
			$(this).parent().siblings().removeClass("active");
			
			if ($(this).html() == 1){
				$("#first_ranking").show();
			} else{
				$("#first_ranking").hide();
			}
		});
		
	});

</script>
</head>
<body>
<div class="container" >
	<ul class="select nav nav-tabs justify-content-end">
	  <li><a data-toggle="tab" href="ranking?currentPage=1">추천순</a></li>
	  <li class="active"><a data-toggle="tab" style="color: #f64646;" href="view_ranking?currentPage=1">조회순</a></li>
	  <li><a data-toggle="tab" href="new_ranking?currentPage=1">최신순</a></li>
	</ul>
	
	
	<div id="wrap_ranking">
		<div id="first_ranking">
			<c:if test="${currentPage==1}">
				<c:forEach var="recipe" items="${list}" varStatus="i" begin="0" end="0">
					<div class="first_div" id="first_div_${i.count }">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}">
							<img src="../upload/${recipe.main_photo}" class="img-thumbnail" style="width: 100%;">
						</a>
						<div class="info">
							<div class="info_tag1" style="text-align: center;">
								<ul>
								<c:forEach var="tag" items="${fn:split(recipe.tags, ',')}">
									<li><a href="#">#${tag}</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div class="info_title" style="padding-left: 70px;">
							<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"><span style="font-size: 40px;">${recipe.name}</span></a>
						</div>
					</div>
				</c:forEach>
				<hr>
			</c:if>
		</div>
		<div id="wrap_ranking">
		<div id="second_ranking">
			<c:if test="${currentPage==1}">
				<c:forEach var="recipe" items="${list}" varStatus="i" begin="1" end="2">
					<div class="second_div" id="second_div_${i.count }">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}">
							<img src="../upload/${recipe.main_photo}" class="img-thumbnail" style="width: 100%;">
						</a>
						<div class="info">
							<div class="info_tag2" style="text-align: center;">
								<ul>
								<c:forEach var="tag" items="${fn:split(recipe.tags, ',')}">
									<li><a href="#">#${tag}</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div class="info_title" style="padding-left: 20px;">
								<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"><span style="font-size: 30px;">${recipe.name}</span></a>
						</div>
					</div>
				</c:forEach>
				<hr>
			</c:if>
		</div>
		<div id="normal_ranking">
			<c:if test="${currentPage==1}">
				<c:forEach var="recipe" items="${list}" varStatus="i" begin="3">
					<div class="box" style="float: left; width: 370px;">
						<div>
							<h1 style="color: black; font-size: 15px;">${i.index + 1}위</h1>
						</div>
						<div class="rec_img" style="text-align: center;">
							<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
							<img src="../upload/${recipe.main_photo}" class="main_image img-thumbnail">
							</a>
						</div>
						<div class="icon">
							<i class="icon_chu"></i><i class="icon_best"></i>
						</div>
						<div class="info" style="text-align: left;">
							<ul style="display: flex;" class="normal_tag">
								<c:forEach var="tag" items="${fn:split(recipe.tags, ',')}">
									<li style="font-size: 50%; font-weight: bold;">#${tag}&nbsp;&nbsp;</li>
								</c:forEach>
							</ul>
						</div>
						<div class="info_title" style="padding-left: 20px;">
							<a href="/recipe/detail?idx= ${recipe.RECIPE_IDX}"> <span>${recipe.name}</span></a>
						</div>
						<br>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${currentPage!=1}">
				<c:forEach var="recipe" items="${list}" varStatus="i">
						<div class="box" style="float: left; width: 370px;">
							<div>
								<h1 style="color: black; font-size: 15px;">${i.count + (currentPage-1) * 12 + 3}위</h1>
							</div>
							<div class="rec_img" style="text-align: center;">
								<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
								<img src="../upload/${recipe.main_photo}" class="main_image img-thumbnail">
								</a>
							</div>
							<div class="icon">
								<i class="icon_chu"></i><i class="icon_best"></i>
							</div>
							<div class="info" style="text-align: left;">
								<ul style="display: flex;" class="normal_tag">
									<c:forEach var="tag" items="${fn:split(recipe.tags, ',')}">
										<li style="font-size: 50%; font-weight: bold;">#${tag}&nbsp;&nbsp;</li>
									</c:forEach>
								</ul>
							</div>
							<div class="info_title" style="padding-left: 20px;">
								<a href="/recipe/detail?idx= ${recipe.RECIPE_IDX}"> <span>${recipe.name}</span></a>
							</div>
							<br>
						</div>
					</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="vi">
			<ul class="vi pagination" style="text-align: center; justify-content: center">
				<c:if test="${currentPage != '1'}">
					<li style="text-align: center;">
					<a href="view_ranking?currentPage=1">
						 <span class="arrow glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${startPage != 1}">
					<li>
					<a href="view_ranking?currentPage=${startPage - 1}">
						<span class="arrow glyphicon glyphicon-chevron-left"></span>
					</a>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${pp ==currentPage}">
						<li class="active"><a href="view_ranking?currentPage=${pp}">${pp}</a></li>
					</c:if>
					<c:if test="${pp !=currentPage}">
						<li><a href="view_ranking?currentPage=${pp}">${pp}</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage != totalPage}">
					<li>
					<a href="view_ranking?currentPage=${endPage + 1}">
						 <span class="arrow glyphicon glyphicon-chevron-right"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage != totalPage}">
					<li>
					<a href="view_ranking?currentPage=${totalPage}">
						 <span class="arrow glyphicon glyphicon-forward"></span>
					</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>































