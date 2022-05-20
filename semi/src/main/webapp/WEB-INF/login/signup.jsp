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

/* css 기본설정 */

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { 
   margin: 0; 
   padding: 0; 
   border: 0; 
   font-size: 100%; 
   font: inherit; 
   vertical-align: baseline; 
} 

body { 
   line-height: 1; 
} 

ol, ul { 
   list-style: none; 
} 

table { 
   border-collapse: collapse; border-spacing: 0; 
}

/* css 시작 */
 
/* .body{
	text-align: center;
} */

header{
	padding-top: 50px;
	text-align: center;
}

.container{
	height: 800px;
	padding-top: 100px;
}

 .memberform{
   	 padding: 10px 170px;
   }
   
   h3{
     text-align: center;
   }
   
    table tr td{
   	padding-top: 20px;
   } 
   
   
   
   #address_search{
   	text-align: center;
   	background-image: url(../img/search_icon.png);
   	background-size: 10%;
   	background-position: 70px center;
   	background-repeat: no-repeat;
   	
   } 
   
   #address_search::placeholder{
   	color: black;
   	background-color: 
   }
   
   table.mem{
		margin-left: 80px;
   }

</style>
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

//비밀번호 일치하는지 체크
	$("#password2").keyup(function (){
		var pass1 = $("#password1").val();
		var pass2 = $("#password2").val();
		if(pass1 == pass2){
			$("b.passok").text("비밀번호가 일치합니다.").css("color","blue");
		}else{
			$("b.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
		}
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
			   					style="width: 100px;" >아이디체크</button>
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
			   					<input type="text" id="address_search" name="address" readonly style="width: 300px;" class="form-control"
			   					placeholder="주소 검색"/>		
							<br><br>
			   					<input type="text" name="address_detail" style="width: 300px;" class="form-control
			   					required="required" placeholder="상세주소를 입력하세요">
			   					
			   					&nbsp;
			   					<br>
			   					<b class="passok"></b>
			   				</td>
			   			</tr>
			   		</table>
			   		<br>
					<button type="submit" class="btn btn-warning"
					style="width: 700px; height: 50px; margin-top: 20px;">회원가입</button>
			   </form>
			 </div>
		</div>
		<!-- //container -->
		 <table>
        <tr>
            <th>이름</th>
            <td><input type="text" name="user_name"></td>
        </tr>
        <tr>
            <th>주소</th>
            <td><input type="text" id="address_search" name="address" readonly /></td>
        </tr>
        <tr>
            <th>상세 주소</th>
            <td><input type="text" name="address_detail" /></td>
        </tr>
    </table>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
    document.getElementById("address_search").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_search").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
	</div>
</body>
</html>