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
	body {

	}
	
	.nav li a{
		font-weight : bold;
		color: black;
	}
	
	.nav li.active a, .nav li a:hover,.nav li.active a:focus,.nav li.active a:hover {
  		color:red;
	} 
	
	#first_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
		column-gap: 30px;
	}
	
	.first_div{
		position: relative;
		border: 1px solid black;
		text-align: center;
	}
	
	#first_div_1:before{
		position: absolute; 
		left:5px; top:-5px; 
		width:96px; 
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-1st-medal.png')no-repeat;
	}
	
	#first_div_2:before{
		position: absolute; 
		left:5px; top:-5px; 
		width:96px; 
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-2nd-medal.png')no-repeat;
	}
	
	#first_div_3:before{
		position: absolute; 
		left: 5px; top:-5px; 
		width:96px; 
		height: 96px; 
		display: block; 
		content: ''; 
		background:url('/image/icons-3rd-medal.png')no-repeat;
	}
	
	.first_div img{

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
	
	
	#normal_ranking {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		justify-items: center;
		gap: 20px 20px;
	}
	
	.info_title a{
		color: black;
	}
	
	.info_title a span{
		font-weight: bold;
		font-size: 2.5rem;
	}\
	
	.normal_tag {
		
	}
	
	.normal_tag li{
		color: gray;
	}
	
	#page_selector {
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".nav>li>a").click(function() {
			$(this).parent().addClass("active");
			$(this).parent().siblings().removeClass("active");
		});	
	});
</script>
</head>
<body>
	<ul class="nav nav-tabs justify-content-end">
	  <li class="active"><a href="#">추천순</a></li>
	  <li class=""><a href="#">조회순</a></li>
	  <li class=""><a href="#">최신순</a></li>
	</ul>
	<div id="wrap_ranking">
		<div id="first_ranking">
			<c:forEach var="recipe" items="${list}" varStatus="i" begin="0" end="2">
				<div class="first_div" id="first_div_${i.count }">
					<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}">
						<img src="${recipe.main_photo}" class="img-thumbnail">
					</a>
					<div class="info">
						<div class="info_tag" style="text-align: center;">
							<ul>
							<c:forEach var="tag" items="${fn:split(recipe.tags, ':')}">
								<li><a href="#">#${tag}</a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
					<h3>${recipe.name }</h3>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div id="normal_ranking">
			<c:forEach var="recipe" items="${list}" varStatus="i" begin="3" end="11">
				<div class="box" style="float: left; width: 400px;">
					<div>
						<h3>${i.index + 1}.</h3>
					</div>
					<div class="rec_img">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
						<img src="../img/main/${recipe.main_photo}" class="mainimage" style="width: 90%;">
						</a>
					</div>
					<div class="icon">
						<i class="icon_chu"></i> <i class="icon_best"></i>
					</div>
					<div class="info" style="text-align: left;">
						<ul style="display: flex;" class="normal_tag">
							<c:forEach var="tag" items="${fn:split(recipe.tags, ':')}">
								<li>#${tag}&nbsp;&nbsp;</li>
							</c:forEach>
						</ul>
					</div>
					<div class="info_title" style="padding-left: 20px;">
						<a href="/recipe/detail?idx=${RECIPE_IDX}"> <span>${recipe.name}</span></a>
					</div>
					<br>
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="page_selector">
		<ul class="pagination">
			<li><a href="#">◀</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">▶</a></li>
		</ul>
	</div>
</body>
</html>































