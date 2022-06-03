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
<style type="text/css">
	.se.pagination > .active > a, .se.pagination > .active > a:focus,
	.se.pagination > .active > a:hover, .se.pagination > .active > span,
	.se.pagination > .active > span:focus, .se.pagination > .active > span:hover{
		background-color: crimson;
		border-color: crimson;
		color: white;
	}
	.se.pagination > li > a, .se.pagination > li > span{
		color: crimson;
		font-size: 20px;
		margin-left: 10px;
	}
	img.searchResults{
		width: 320px;
		height: 160px;
		object-fit: cover;
		cursor: pointer;
	}
	img.searchResults:hover{
		transform:scale(1.2);
	}
	b.searchWord{
		 color: crimson;
		 font-size: 36px;
	}
	table.searchResults td{
		height: 260px;
		width: 440px;
		vertical-align: top;
	}
	ul.searchResults{
		list-style: none;
		margin-left: 20px;
	}
	ul.searchResults li{
		float: left;
		margin-right: 15px;
		margin-top: 5px;
		color: gray;
		letter-spacing: 0px;
		font-size: 11px;
		font-weight: bold;
	}
	div.searchResults{
		margin-bottom: -10px;
		text-align: center;
	}
	h3.searchResults{
		font-size: 25px;
		cursor: pointer;
		font-weight: bold;
	}
	h3.searchResults:hover{
		color: crimson;
	}
	.gallery11{
		background-color: #f3f3f3;
		padding-top: 20px;
	}
	.arrow{
		color: crimson;
		font-size: 20px;
	}
	#searchPage{
		margin-bottom: 80px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="container">
	<h1 class="main"><b class="searchWord">"${research}"</b>&nbsp;검색 결과</h1>
	<h3>총 ${tot} 개의 검색결과가 있습니다.</h3><br>
	<div class="gallery11">
		<table class="searchResults">
			<tr>
				<c:forEach var="l" items="${list}" varStatus="i">
					<td style="text-align: center;">
						<img src="../upload/${l.main_photo}" class="searchResults img-thumbnail"
						onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'"><br>
						<div class="searchResults">
							<ul class="searchResults">
								<c:forTokens var="tag" items="${l.tags}" delims=",">
									<li>#${tag}</li>
								</c:forTokens>
							</ul>
						</div><br>
						<h3 onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'"
						class="searchResults">${l.name}</h3>
					</td>
					<c:if test="${i.count%3==0}"></tr><tr></c:if>
				</c:forEach>
			</tr>
		</table>
	</div>
	
	<div class="paging" id="searchPage">
		<ul class="se pagination">
			<c:if test="${startPage!=1}">
				<li><a href="search?research=${research}&currentPage=${startPage-1}">
					<span class="arrow glyphicon glyphicon-forward" style="transform:scaleX(-1);"></span>
				</a></li>
			</c:if>
			<c:forEach var="p" begin="${startPage}" end="${endPage}">
				<c:if test="${p==currentPage}">
					<li class="active"><a href="search?research=${research}&currentPage=${p}">${p}</a></li>
				</c:if>
				<c:if test="${p!=currentPage}">
					<li><a href="search?research=${research}&currentPage=${p}">${p}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage!=totalPage}">
				<li><a href="search?research=${research}&currentPage=${endPage+1}">
					<span class="arrow glyphicon glyphicon-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>
