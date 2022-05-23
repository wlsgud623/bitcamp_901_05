<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
body {
 font-size: 2rem;
 font-family: 'Jua';
 }
</style>
</head>
<body>
	<div class="body">
		<header class="header">
			<a href="../">
			<img src="../img/logo.png">
			</a>
		</header>
		<!-- container -->
		<div class="container" id="container">
			<div class="memberform">
			   <h3>회원가입</h3><br><br>
			   <form action="insert" method="post" class="form-inline"
			   		 style="border-top: 1px solid black; height: 1000px;"
			   		 onsubmit="return check()">
			   		<br>
			   		<table style="width: 600px;" class="mem">
			   			<tr>
			   				<th style="width: 130px;">이 름</th>
			   				<td>
			   					<input type="text" name="name" style="width: 300px;" class="form-control"
			   					required="required">
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">아이디</th>
			   				<td>
			   					<input type="text" name="UserID" id="UserID" style="width: 300px;" class="form-control"
			   					required="required">
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-danger" id="idcheck"
			   					style="width: 100px;">아이디체크</button>
			   					&nbsp;
			   					<br>
			   					<b class="idok"></b>
			   				</td>
			   			</tr>
			   			<tr rowspan="2">
			   				<th style="width: 130px;">비밀번호</th>
			   				<td>
			   					<input type="password" name="password" id="password1" style="width: 300px;" class="form-control"
			   					required="required" placeholder="비밀번호">
							<br><br>
			   					<input type="password" id="password2" style="width: 300px;" class="form-control"
			   					required="required" placeholder="한번 더 입력">
			   					&nbsp;
			   					<br>
			   					<b class="passok"></b>
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">핸드폰</th>
			   				<td>
			   					<input type="text" name="hp" style="width: 300px;" class="form-control"
			   					required="required">
			   				</td>
			   			</tr>

			   			  
			   			<tr>
			   				<th style="width: 130px;">이메일</th>
			   				<td>
			   					<input type="text" name="email1" style="width: 140px;" class="form-control"
			   					required="required">
			   					<b>@</b>
			   					<input type="text" name="email2" id="email2" style="width: 140px;" class="form-control"
			   					required="required">&nbsp;
			   					<select id="email3" class="form-control">
			   						<option value="-">직접입력</option>
			   						<option value="naver.com">네이버</option>
			   						<option value="nate.com">네이트</option>
			   						<option value="google.com">구글</option>
			   					</select>
			   				</td>
			   			</tr>
			   				<tr rowspan="2">
			   				<th style="width: 130px;">주소</th>
			   				<td>
			   					<input type="text" id="address_search" name="address1" readonly style="width: 300px;" class="form-control"
			   					placeholder="주소를 입력해주세요"/>		
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-primary" id="search_btn"
			   					style="width: 100px;">주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span></button>
			   					&nbsp;
							<br><br>
			   					<input type="text" name="address2" style="width: 300px;" class="form-control
			   					required="required" placeholder="상세주소를 입력하세요">
			   					&nbsp;
			   					<br>
			   				</td>
			   			</tr>
			   			
			   		</table>
			   		<br>
					<button type="submit" class="btn btn-warning"
					style="width: 700px; height: 50px; margin: 20px 40px;">회원가입</button>
			   </form>
			 </div>
		</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
   		$("#address_search,#search_btn").click(function(){	
   	 	//주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            	oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_search").value = data.address; // 주소 넣기
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
                console.log(data);
            }
        }).open();
    });
   }
</script>
	</div>
</body>
</html>