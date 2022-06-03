<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>레시피 랭킹</title>
<style type="text/css">
	ul.select{
		margin-top: 80px;
	}
	
	.nav li a{
		font-weight : bold;
		color: black;
		cursor: pointer;
	}
	
	.nav li.active a{
  		color:red;
	} 
	
		
	#first_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
		column-gap: 30px;
		padding-top : 30px;
		padding-bottom : 30px;
	}
	
	.first_div{
		position: relative;
		text-align: center;
		width: 80%;
		background-color: white;
	}
	
	#first_div_1:before{
		position: absolute; 
		left:5px; top:-5px; 
		 
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-1st-medal.png')no-repeat;
	}
	
	#first_div_2:before{
		position: absolute; 
		left:5px; top:-5px; 
		 
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-2nd-medal.png')no-repeat;
	}
	
	#first_div_3:before{
		position: absolute; 
		left: 5px; top:-5px; 
		
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-3rd-medal.png')no-repeat;
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
    	font-size: 20px;
    	line-height: 25px;
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
	
	.normal_tag li{
		font-size: 11px;
	}
	
	
	#normal_ranking {
	width: 100%;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    justify-items: center;
    gap: 20px 20px;
    padding-top: 20px;
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
	
	.box{
		width: 360px;
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
		
		padding-top: 5px;
	}
	
	.normal_tag li{
		color: gray;
	}
	
	#page_selector {
		text-align: center;
	}
	.ne.pagination > .active > a, .ne.pagination > .active > a:focus,
	.ne.pagination > .active > a:hover, .ne.pagination > .active > span,
	.ne.pagination > .active > span:focus, .ne.pagination > .active > span:hover{
		background-color: crimson;
		border-color: crimson;
		color: white;
	}
	.ne.pagination > li > a, .ne.pagination > li > span{
		color: crimson;
		font-size: 20px;
		margin-left: 10px;
	}
	.arrow{
		color: crimson;
		font-size: 20px;
	}
	div.ne{
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
			
	});
	
</script>
</head>
<body>
<div class="container">
	<ul class="select nav nav-tabs justify-content-end">
	  <li><a data-toggle="tab" href="ranking?currentPage=1">추천순</a></li>
	  <li><a data-toggle="tab" href="view_ranking?currentPage=1">조회순</a></li>
	  <li class="active"><a data-toggle="tab" style="color: #f64646;" href="new_ranking?currentPage=1">최신순</a></li>
	</ul>
	<div id="wrap_ranking">
		<div id="normal_ranking" style=" text-align: center;">
			<c:forEach var="recipe" items="${list}" varStatus="i">
				<div class="box" style="  text-align: center;">
					<div class="rec_img" style=" vertical-align: middle;  text-align: center;">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
							<img src="../upload/${recipe.main_photo}" class="main_image img-thumbnail" style="width:90%;">
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
		</div>
	</div>
	<div class="ne">
			<ul class="ne pagination">
				<c:if test="${currentPage != '1'}">
					<li>
					<a href="new_ranking?currentPage=1">
						 <span class="arrow glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${startPage != 1}">
					<li>
					<a href="new_ranking?currentPage=${startPage - 1}">
						<span class="arrow glyphicon glyphicon-chevron-left"></span>
					</a>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${pp ==currentPage}">
						<li class="active"><a href="new_ranking?currentPage=${pp}">${pp}</a></li>
					</c:if>
					<c:if test="${pp !=currentPage}">
						<li><a href="new_ranking?currentPage=${pp}">${pp}</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage != totalPage}">
					<li>
					<a href="new_ranking?currentPage=${endPage + 1}">
						 <span class="arrow glyphicon glyphicon-chevron-right"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage != totalPage}">
					<li>
					<a href="new_ranking?currentPage=${totalPage}">
						 <span class="arrow glyphicon glyphicon-forward"></span>
					</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
</body>
</html>































