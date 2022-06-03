<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">

	#menu_area{
		margin-top: 80px;
		margin-bottom: 50px;
	}
	
	#cate_table{
		width: 100%;
		margin-bottom: 20px;
	}
	
	#cate_table tr{
		
	}
	
	#cate_table th {
    	
    	border-bottom: 1px solid #bbbbbb;
    	font-weight: bold;
    	text-align: center;
    	background: #f9f9f9;
    	font-size: 19px;
    	color: #666;
    	width: 150px;
    	height: 50px;
    	padding: 20px;
	}
	
	#cate_table td {
		line-height : 50px;
		padding-left: 10px;
	}
	#menu_area{
		text-align: center;
	}

	#cate_menu { 
		list-style: none;
		display: table;
		width: 100%;
		table-layout: fixed;
		text-align: center;
	}
	
	#cate_menu li{
		cursor : pointer;
		float: left;
		margin-left: 100px;
	}
	
	.cate_icon{
		width: 96px;
    	height: 96px;
    	display: block;
	}
	#cate_icon01{
		background: url("/image/icon-all.png");
	}
	
	#cate_icon01.cate_icon.active, #cate_icon01:hover{
		background: url("/image/icon-all-red.png");
	}
	
	#cate_icon01:color{
		background: url("/image/icon-all-red.png");
	}
	
	#cate_icon02 {
		background: url("/image/icon-cate.png");
	}
	
	#cate_icon02.cate_icon.active, #cate_icon02:hover{
		background: url("/image/icon-cate-red.png");
	}
	
	#cate_icon03 {

		background: url("/image/icon-ingre.png");
	}
	
	#cate_icon03.cate_icon.active, #cate_icon03:hover{
		background: url("/image/icon-ingre-red.png");
	}
	
	#cate_icon04{

		background: url("/image/icon-method.png");
	}
	
	#cate_icon04.cate_icon.active, #cate_icon04:hover{
		background: url("/image/icon-method-red.png");
	}
	
	#cate_icon05{
		background: url("/image/icon-portion.png");	
	}
	
	#cate_icon05.cate_icon.active, #cate_icon05:hover{
		background: url("/image/icon-portion-red.png");
	}
	
	#cate_icon06{

		background: url("/image/icon-level.png");
	}
	
	#cate_icon06.cate_icon.active, #cate_icon06:hover{
		background: url("/image/icon-level-red.png");
	}

	#cate_table {
		text-align: center;
	}
	
	#table_area {
		display : inline-block;
		border-top: 2px solid #f64646;
	}
	
	#cate_table{
		border-top: 2px solid #f64646;
		border-collapse: collapse;
		border-spacing: 2px;
	}
	
	#cate_table td{
		text-align: left;
	}
	
	#cate_table a{
		font-size: 20px;
    	color: #666;
    	text-decoration: none;
	}
	
	#cate_table a:hover{
		color: #f64646;
		text-decoration: none;

	}
	
	#cate_table a:link {
		text-decoration: none;
	}
	
	
	#cate_table a:after {
	    width: 1px;
	    height: 18px;
	    background: #c2c2c2;
	    display: inline-block;
	    content: '';
	    margin: 0 20px;
	}
	
	#list_area {
		width: 100%;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr; 
		justify-items: center;
		gap: 20px 20px;
		background-color: #f3f3f3;
		padding-top: 20px;
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
		color: red;
	}
	
	
	.normal_tag {
		padding-left: 20px;
		padding-top: 10px;
	}
	
	.normal_tag li{
		list-style : none;
		color: gray;
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
	
	#menu_table{
		display: inline-block;
	}
	#menu_table tr{
		float: left;
		margin-left: 50px;
		cursor: pointer;
	}
	
	#menu table tr td a{
	}	
	
	.ca.pagination > .active > a, .ca.pagination > .active > a:focus,
	.ca.pagination > .active > a:hover, .ca.pagination > .active > span,
	.ca.pagination > .active > span:focus, .ca.pagination > .active > span:hover{
		background-color: crimson;
		border-color: crimson;
		color: white;
	}
	.ca.pagination > li > a, .ca.pagination > li > span{
		color: crimson;
		font-size: 20px;
		margin-left: 10px;
	}
	.arrow{
		color: crimson;
		font-size: 20px;
	}
	div.ca{
		margin-bottom: 80px;
	}
</style>
<script type="text/javascript">
$(function() {
	$("#cate_icon01").addClass("active");
	setTable();
	
	$(".table td a").click(function() {
		$(this).parent().parent().siblings().hide();
		$(this).css("color", "#f64646");
		$(this).siblings().css("color", "#666");
		//console.log($(this).html());
		//console.log($(this).parent().siblings("th").html());
		var category = $(this).parent().siblings("th").attr("value");
		var item = $(this).html();
		
		if(category=="portion"){
			item = $(this).attr("value");
		}
		
		loadPage(category, item, ${currentPage});
	});
	
	$("#menu_table tr").click(function() {
		$(this).children("td").children("a").addClass("active");
		$(this).siblings().children("td").children("a").removeClass("active");
		var cat= $(this).children("td").children("span").attr("value");
		
		if (cat=="whole"){
			$(".table td a").css("color", "#666");
			$("#cate_table tbody tr th").parent().show();
			location.href = "/collection/category";
		}
		else{
			$(".table td a").css("color", "#666");
			$("#cate_table tbody tr th[value="+cat+"]").parent().show();
			$("#cate_table tbody tr th[value="+cat+"]").parent().siblings().hide();
		}
		
	});
	function setTable() {
		if (${category != null}){
			$("#menu_table tr td span[value=${category}]").parent().parent().siblings().children("td").children("a").removeClass("active");
			$("#menu_table tr td span[value=${category}]").siblings("a").addClass("active");
			
			$("#cate_table tbody tr th[value=${category}]").parent().show();
			$("#cate_table tbody tr th[value=${category}]").parent().siblings().hide();
		}
		
		if (${item!= null}){
			$("#cate_table tbody tr td a:contains('${item}')").css("color",  "#f64646");
		}	
	}
	
	function loadPage(category, item){
		location.href = "?category=" + category + "&item=" + item;	
	}
});
</script>
</head>
<body>
<div class="container">
	<div id="menu_area">
		<table id="menu_table">
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon01"></a><br><span class="menu_name" value="whole">전체</span>
				</td>
			</tr>
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon02"></a><br><span class="menu_name" value = "category">종류</span>
				</td>
			</tr>
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon03"></a><br><span class="menu_name" value = "main_ing">주 재료</span>
				</td>
			</tr>
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon04"></a><br><span class="menu_name" value = "cooking">방법</span>
				</td>
			</tr>
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon05"></a><br><span class="menu_name" value = "portion">인분 수</span>
				</td>
			</tr>
			<tr>
				<td>
					<a class="cate_icon" id="cate_icon06"></a><br><span class="menu_name" value = "level">난이도</span>
				</td>
			</tr>
		</table>

	</div>
	<div style="text-align: center;">
		<div id="table_area">
			<table id="cate_table" class="table table-bordered">
				<caption></caption>
				<tbody>
					<tr> 
					<th value = "category">종류</th> 
					<td>
						&nbsp;&nbsp;&nbsp;
						<a href="#">밥/죽</a>
						<a href="#">반찬</a>
						<a href="#">국물</a>
						<a href="#">면</a>
						<a href="#">디저트</a>
						<a href="#">양식</a> 
						<a href="#">일식</a>
						<a href="#">중식</a>
						<a href="#">퓨전</a>
						<a href="#">떡/만두</a>
						<a href="#">양념/소스</a>
						<a href="#">샐러드</a>
						<a href="#">음료</a> 
						<a href="#">기타</a>  
					</td>
					</tr>
					
					<tr> 
					<th value = "main_ing">주 재료</th> 
					<td>
						&nbsp;&nbsp;&nbsp;
						<a href="#">소고기</a>
						<a href="#">돼지고기</a>
						<a href="#">닭고기</a>
						<a href="#">육류</a>
						<a href="#">해물</a>
						<a href="#">채소류/버섯</a>
						<a href="#">계란/유제품</a>
						<a href="#">쌀</a>
						<a href="#">밀가루</a>
						<a href="#">콩/견과류</a>
						<a href="#">기타</a> 
					</td>
					</tr>
					
					<tr> 
						<th value = "cooking">방법</th>
					<td>
						&nbsp;&nbsp;&nbsp;
						<a href="#">구이</a>
						<a href="#">찜</a>  
						<a href="#">끓임</a> 
						<a href="#">볶음</a> 
						<a href="#">튀김</a> 
						<a href="#">조림</a>
						<a href="#">부침</a>  
						<a href="#">무침</a> 
						<a href="#">비빔</a> 
						<a href="#">삶음</a> 
						<a href="#">회</a> 
						<a href="#">절임</a> 
						<a href="#">데치기</a> 
						<a href="#">기타</a> 
					</td> 
					</tr>
					<tr> 
						<th value = "portion">인분 수</th>
					<td>
						&nbsp;&nbsp;&nbsp;
						<a href="#" value="1" >1인분</a>
						<a href="#" value="2">2인분</a>
						<a href="#" value="3">3인분</a>
						<a href="#" value="4">4인분 이상</a>
					</td> 
					</tr>
					
					<tr> 
						<th value = "level">난이도</th>
					<td>
						&nbsp;&nbsp;&nbsp;
						<a href="#">입문</a>
						<a href="#">초급</a>
						<a href="#">중급</a>
						<a href="#">고급</a>
						<a href="#">숙련자</a> 
						<a href="#">어려움</a> 
						<a href="#">전문가</a> 
					</td> 
					</tr>
				</tbody>
			</table>
		</div>
		</div>
		<div id="list_area">
			<c:forEach var="recipe" items="${list}" varStatus="i">
				<div class="box" style="float: left;">
					<div class="rec_img" style="text-align: center;">
						<a href="/recipe/detail?idx=${recipe.RECIPE_IDX}"> 
						<img src="../upload/${recipe.main_photo}" class="main_image img-thumbnail" style="width: 90%;">
						</a>
					</div>
					<div class="icon">
						<i class="icon_chu"></i><i class="icon_best"></i>
					</div>
					<div class="info" >
						<ul class="normal_tag" style="display: flex;">
							<c:forEach var="tag" items="${fn:split(recipe.tags, ',')}">
								<li style="float: left; font-size: 70%; font-weight: bold;">#${tag}&nbsp;&nbsp;</li>
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
		<br><br>
		<div class="ca">
			<ul class="ca pagination">
				<c:if test="${currentPage != '1'}">
					<li>
						<c:if test="${category!=null}">
							<a href="?currentPage=1&category=${category}&item=${item}">
								<span class="arrow glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
							</a>
						</c:if>
						<c:if test="${category==null }">
							<a href="?currentPage=1">
								<span class="arrow glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
							</a>
						</c:if>
					</li>
				</c:if>
				
				<c:if test="${startPage != 1}">
					<li>
						<c:if test="${category!=null}">
							<a href="?currentPage=${startPage - 1}&category=${category}&item=${item}">
								<span class="arrow glyphicon glyphicon-chevron-left"></span>
							</a>
						</c:if>
						<c:if test="${category==null }">
							<a href="?currentPage=${startPage - 1}">
								<span class="arrow glyphicon glyphicon-chevron-left"></span>
							</a>
						</c:if>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${pp ==currentPage}">
						<li class="active">
							<c:if test="${category!=null}">
								<a href="?currentPage=${pp}&category=${category}&item=${item}">${pp}</a>
							</c:if>
							<c:if test="${category==null}">
								<a href="?currentPage=${pp}">${pp}</a>
							</c:if>
						</li>
					</c:if>
					<c:if test="${pp !=currentPage}">
						<li>
							<c:if test="${category!=null}">
								<a href="?currentPage=${pp}&category=${category}&item=${item}">${pp}</a>
							</c:if>
							<c:if test="${category==null}">
								<a href="?currentPage=${pp}">${pp}</a>
							</c:if>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage != totalPage}">
					<li>
						<c:if test="${category!=null}">
						<a href="?currentPage=${endPage + 1}&category=${category}&item=${item}">
							<span class="arrow glyphicon glyphicon-chevron-right"></span>
						</a>
						</c:if>
						<c:if test="${category==null }">
							<a href="?currentPage=${endPage + 1}">
								<span class="arrow glyphicon glyphicon-chevron-right"></span>
							</a>
						</c:if>
					</li>
				</c:if>
				
				<c:if test="${currentPage < totalPage}">
					<li>
					<c:if test="${category!=null}">
						<a href="?currentPage=${totalPage}&category=${category}&item=${item}">
							<span class="arrow glyphicon glyphicon-forward"></span>
						</a>
					</c:if>
					<c:if test="${category==null }">
						<a href="?currentPage=${totalPage}">
							<span class="arrow glyphicon glyphicon-forward"></span>
						</a>
					</c:if>
					</li>
				</c:if>
			</ul>
		</div>
</div>
</body>

</html>















