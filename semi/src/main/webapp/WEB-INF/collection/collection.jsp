
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

<c:set var="root" value="<%=request.getContextPath() %>"/> <!-- 절대경로 -->
<body>
<div class="contaniner">
	<div class="header">
		<div class="main11">
		</div>
		
		<div class="category11">
			조리법
		</div>
	
		<h1>검색결과</h1>
		
		<div class="gallery11">
			
			<h2 class="main"><b>${research}</b>검색 결과</h2>
			<b>총 ${tot} 개의 검색결과가 있습니다.</b>
				<c:forEach var="a"  items="${list}" varStatus="i"> 
			
					<a href='${root}/recipe/detail?idx=${list[i.index]}'>${list}</a><!-- 하나씩 -->
				</c:forEach>
		<br><br>
		
		</div>
		
		<div class="button11">
		</div>
		
		<div class="picture11">
		</div>
		
		
	</div>
</div>
</body>

</html>















