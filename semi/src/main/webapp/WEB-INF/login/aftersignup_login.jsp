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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Nanum+Myeongjo&family=Song+Myung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
.body {
	text-align: center;
	height: 700px;
	font-family: 'Gowun Dodum';
}

header {
	padding-top: 20px;
}

.logo{
	margin-left: 450px;
	width: 150px;
}

i{
	color: red;
	font-size: 120px;
}

.container {
	height: 600px;
	padding-top: 40px;
}

.p{
	font-size: 19px;
	margin-bottom: 30px;
}
.sign.btn{
	margin-top: 10px;
	width: 200px;
	height: 40px;
	/* font-family: 'Song Myung'; */
	font-size: 17px;
	border: 1px solid #c12231;
	color: #c12231;
	background-color: white;
}
.btn:focus,.btn:active {
   outline: none !important;
   box-shadow: none;
}



.btn:hover{
	margin-top: 10px;
	width: 200px;
	height: 40px;
/* 	font-family: 'Song Myung'; */
	font-size: 17px;
	background-color: #c12231;
	color: white;
}


/* .btn a:hover{
	color: white;
} */

.btn a{
	text-decoration: none;
	color: black;
}

</style>

</head>
<body>
	<div class="body">
		<header class="header">
			<a href="../"> 
				<img class="logo" src="../img/logo.png">
			</a>
		</header>
		<div class="container">
	<!-- 		<i class="fa-regular fa-circle-check"></i> -->
			<i class="fa-solid fa-check"></i>
			<h1>회원가입이 <b>완료</b> 되었습니다.</h1>
			<br>
			<p class="p"><b>${name}</b>님 회원가입을 축하합니다.<br>지금 로그인하고 레시피를 공유해보세요!</p>
			<hr>
			<h3></h3>
				
			<button class="sign btn" onclick="location.href='http://localhost:9000/login'">로그인하러 가기</button>	
			&nbsp;	
			<button class="sign btn" onclick="location.href='http://localhost:9000/'">홈으로</button>
			
		</div>
	</div>
</body>
</html>