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
		background-color: #f3f3f3;
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
		background-color: #f3f3f3;
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
		
	}
	
	.info_title a{
		color: black;
	}
	
	.info_title a span{
		font-weight: bold;
		font-size: 2.5rem;
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
	<ul class="nav nav-tabs justify-content-end">
	  <li><a data-toggle="tab" href="ranking?currentPage=${currentPage}">추천순</a></li>
	  <li class="active"><a data-toggle="tab" style="color: #f64646;" href="view_ranking?currentPage=${currentPage}">조회순</a></li>
	  <li><a data-toggle="tab" href="new_ranking?currentPage=${currentPage}">최신순</a></li>
	</ul>
	<div id="wrap_ranking">
		<div id="first_ranking">
			<c:if test="${currentPage==1}">
				<c:forEach var="recipe" items="${list}" varStatus="i" begin="0" end="2">
					<div class="first_div" id="first_div_${i.count }">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}">
							<img src="${recipe.main_photo}" class="img-thumbnail" style="width: 80%;">
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
				<hr>
			</c:if>
		</div>
		<div id="normal_ranking">
			<c:if test="${currentPage==1}">
				<c:forEach var="recipe" items="${list}" varStatus="i" begin="3">
					<div class="box" style="float: left; width: 400px;">
						<div>
							<h3 style="text-shadow:2px 2px 5px #f64646; color: white; font-weight: bold;">${i.index + 1}.</h3>
						</div>
						<div class="rec_img" style="text-align: center;">
							<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
							<img src="../img/main/${recipe.main_photo}" class="main_image img-thumbnail">
							</a>
						</div>
						<div class="icon">
							<i class="icon_chu"></i><i class="icon_best"></i>
						</div>
						<div class="info" style="text-align: left;">
							<ul style="display: flex;" class="normal_tag">
								<c:forEach var="tag" items="${fn:split(recipe.tags, ':')}">
									<li>#${tag}&nbsp;&nbsp;</li>
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
						<div class="box" style="float: left; width: 400px;">
							<div>
								<h3 style="text-shadow:2px 2px 5px #f64646; color: white; font-weight: bold;">${i.count + (currentPage-1) * 12 + 3}.</h3>
							</div>
							<div class="rec_img" style="text-align: center;">
								<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
								<img src="../img/main/${recipe.main_photo}" class="main_image img-thumbnail">
								</a>
							</div>
							<div class="icon">
								<i class="icon_chu"></i><i class="icon_best"></i>
							</div>
							<div class="info" style="text-align: left;">
								<ul style="display: flex;" class="normal_tag">
									<c:forEach var="tag" items="${fn:split(recipe.tags, ':')}">
										<li>#${tag}&nbsp;&nbsp;</li>
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
	<div>
			<ul class="pagination">
				<c:if test="${currentPage != '1'}">
					<li>
					<a href="view_ranking?currentPage=1">
						 <span class="glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${startPage != 1}">
					<li>
					<a href="view_ranking?currentPage=${startPage - 1}">
						<span class="glyphicon glyphicon-chevron-left"></span>
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
						 <span class="glyphicon glyphicon-chevron-right"></span>
					</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage != totalPage}">
					<li>
					<a href="view_ranking?currentPage=${totalPage}">
						 <span class="glyphicon glyphicon-forward"></span>
					</a>
					</li>
				</c:if>
			</ul>
		</div>
</body>
</html>































