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
 
.header{
	text-align: center;
}
</style>
</head>

<script type="text/javascript">

$(function() {	 
	
	//아이디 중복 체크
		$("#idcheck").click(function() {
			$.ajax({
				type: "get",
				dataType: "json",
				url: "idcheck",
				data: {"UserID":$("#UserID").val()},
				success: function(data) {
					if(data.count == 0){
						$("b.idok").text("사용 가능한 아이디 입니다.").css("color","blue");
					}else {
						$("b.idok").text("이미 존재하는 아이디 입니다.").css("color","red");
						$("#UserID").val("");
						$("#UserID").focus();
					}	
				}
			});
		});



//이메일 선택
$("#email3").change(function() {
	var s = $(this).val();
	if (s == "-"){
		$("#email2").val("");
		$("#email2").focus();
	}else{
		$("#email2").val(s);
	}
});	
});

function check() {
var a = $("b.idok").text();
var b = $("b.passok").text();

if(a != '사용 가능한 아이디 입니다.'){
	alert("아이디체크 버튼을 눌러서 중복 확인을 해주세요.");
	$("b.idok").text("아이디 중복 체크가 필요합니다.").css("color","red");
	return false;
}else if(b != '비밀번호가 일치합니다.'){
	alert("비밀번호를 제대로 입력해주세요.");
	$("#password1").val("");
	$("#password2").val("");
	$("#password1").focus();
	return false;
}else{
	return true;
}
}  





</script>
<body>
	<div class="body">
		<header class="header">
			<a href="../">
			<img src="../img/logo.png">
			</a>
		</header>
		<!-- container -->
		<div class="container" id="container">
			<div class="member_form">
			   <h3 >회원가입수정</h3><br><br>
			   <form action="update" method="post" class="form-inline"
			   		 style="border-top: 1px solid black; height: 1000px;"
			   		 onsubmit="return check()">
			   		<br>
			   		<table style="width: 600px;" class="mem">
			   			
			   			<tr>
			   				<th style="width: 130px;">사진수정</th>
			   				<td>
			   					<input type="file" name="photo" style="width: 300px;" class="form-control"
			   					required="required">
			   				</td>
			   			</tr>
			   			
			   			
			   			<tr>
			   				<th style="width: 130px;">아이디</th>
			   				<td>
			   					<input type="text" name="UserID" id="UserID" style="width: 300px;" class="form-control"
			   					required="required" value="${dto.userid }">
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-danger" id="idcheck"
			   					style="width: 100px;">아이디체크</button>
			   					&nbsp;
			   					<br>
			   					<b class="idok"></b>
			   				</td>
			   			</tr>
			   			<tr rowspan="2">
			   				<th style="width: 130px;">비밀번호확인</th>
			   				<td>
			   					
			   					<input type="password" id="password2" style="width: 300px;" class="form-control"
			   					required="required" placeholder="비밀번호입력하세요">
			   					&nbsp;
			   					<br>
			   					<b class="passok"></b>
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">핸드폰</th>
			   				<td>
			   					<input type="text" name="hp" style="width: 300px;" class="form-control"
			   					required="required" value="${dto.hp}">
			   				</td>
			   			</tr>
					 
			   			<tr>
			   				<th style="width: 130px;">이메일</th>
			   				<td>
			   					<input type="text" name="email1" style="width: 140px;" class="form-control"
			   					required="required">
			   					<b>@</b>
			   					<input type="text" name="email2" id="email2" style="width: 140px;" class="form-control"
			   					required="required" value="${dto.email}">&nbsp;
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
			   					placeholder="주소를 입력해주세요" value="${dto.adress}"/>		
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-primary" id="search_btn"
			   					style="width: 100px;">주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span></button>
			   					&nbsp;
							
			   					<input type="text" name="address2" style="width: 300px;" class="form-control
			   					required="required" placeholder="상세주소를 입력하세요">
			   					&nbsp;
			   					<br>
			   				</td>
			   			</tr>
			   			
			   				<tr>
			   				<th style="width: 130px;">자기소개</th>
			   				<td>
			   					<input type="text" name="intro" style="width: 300px;" class="form-control"
			   					required="required" value="${dto.intro}">
			   				</td>
			   			</tr>
			   			
			   		</table>
			   		<br>
					<button type="submit" class="btn btn-warning"
					style="width: 700px; height: 50px; margin: 20px 40px;">수정</button>
			   </form>
			 </div>
		</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	</div>
</body>
</html>