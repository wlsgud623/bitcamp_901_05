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
	img.searchResults{
		width: 240px;
		height: 180px;
		object-fit: cover;
		cursor: pointer;
	}
	table.searchResults{
		margin-left: 50px;
	}
	table.searchResults td{
		height: 300px;
		width: 300px;
		vertical-align: top;
	}
	ul.searchResults{
		list-style: none;
	}
	ul.searchResults li{
		float: left;
	}
	b.searchResults{
		float: left;
		margin-left: 25px;
		font-size: 20px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="gallery11">
	<h2 class="main"><b style="color: crimson;">"${research}"</b>&nbsp;검색 결과</h2>
	<b>총 ${tot} 개의 검색결과가 있습니다.</b><br>
	<table class="searchResults">
		<tr>
			<c:forEach var="l" items="${list}" varStatus="i">
				<td>
					<img src="../upload/${l.main_photo}" class="searchResults"
					onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'"><br>
					<ul class="searchResults">
						<c:forTokens var="tag" items="${l.tags}" delims=",">
							<li>#${tag}</li>
						</c:forTokens>
					</ul><br><br>
					<b class="searchResults">${l.name}</b>
				</td>
				<c:if test="${i.count%4==0}"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table>
</div>
</body>
</html>
