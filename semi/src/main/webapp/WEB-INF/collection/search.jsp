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
		width: 200px;
		height: 150px;
		object-fit: cover;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="gallery11">
	<h2 class="main"><b style="color: crimson;">"${research}"</b>&nbsp;검색 결과</h2>
		<b>총 ${tot} 개의 검색결과가 있습니다.</b><br>
		<c:forEach var="l"  items="${list}" varStatus="i"> 
			<img src="../upload/${l.main_photo}" class="searchResults"
			onclick="location.href='/recipe/detail?idx=${l.RECIPE_IDX}'">
		</c:forEach>
	<br><br>
</div>
</body>
</html>
