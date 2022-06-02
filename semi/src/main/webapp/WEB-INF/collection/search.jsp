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
	.pagination > .active > a, .pagination > .active > a:focus,
	.pagination > .active > a:hover, .pagination > .active > span,
	.pagination > .active > span:focus, .pagination > .active > span:hover{
		background-color: crimson;
		border-color: crimson;
	}
	.pagination > li > a, .pagination > li > span{
		color: crimson;
		font-size: 20px;
		margin-left: 10px;
	}
	img.searchResults{
		width: 320px;
		height: 240px;
		object-fit: cover;
		cursor: pointer;
	}
	b.searchWord{
		 color: crimson;
		 font-size: 36px;
	}
	table.searchResults td{
		height: 400px;
		width: 440px;
		vertical-align: top;
	}
	ul.searchResults{
		list-style: none;
		margin-left: 50px;
	}
	ul.searchResults li{
		float: left;
		margin-right: 15px;
		color: gray;
		letter-spacing: 0px;
		font-size: 18px;
	}
	h3.searchResults{
		font-size: 25px;
		cursor: pointer;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="container">
	<h1 class="main"><b class="searchWord">"${research}"</b>&nbsp;검색 결과</h1>
	<h3>총 ${tot} 개의 검색결과가 있습니다.</h3><br>
	<table class="searchResults">
		<tr>
			<c:forEach var="l" items="${list}" varStatus="i">
				<td style="text-align: center;">
					<img src="../upload/${l.main_photo}" class="searchResults"
					onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'"><br>
					<ul class="searchResults">
						<c:forTokens var="tag" items="${l.tags}" delims=",">
							<li>#${tag}</li>
						</c:forTokens>
					</ul><br>
					<h3 onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'"
					class="searchResults">${l.name}</h3>
				</td>
				<c:if test="${i.count%3==0}"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table>
	
	<div class="paging" id="searchPage">
	<ul class="pagination">
		<c:if test="${startPage!=1}">
			<li><a href="search?research=${research}&currentPage=${startPage-1}">◀이전</a></li>
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
			<li><a href="search?research=${research}&currentPage=${endPage+1}">다음▶</a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>
