
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


<body>

	<div class="header">
		<div class="main11">
		</div>
		
		<div class="category11">
		</div>
	
		<h1>검색결과</h1>
		
		<div class="gallery11">
			<h2 class="main">검색 결과</h2>
				<c:forEach var="a" begin="4" end="12">
						<img src="/imgfood/${a}.jpg" style="width: 250px;height: 150px; class="contents">
					<c:if test="${a%3==0}"><br></c:if>
				</c:forEach>
		<br><br>
		
		</div>
		
		<div class="button11">
		</div>
		
		<div class="picture11">
		</div>
		
		
	</div>
</body>

</html>















