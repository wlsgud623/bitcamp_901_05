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
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Song+Myung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- modal -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
/* css 기본설정 */

/* html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { 
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
   border-collapse: collapse; 
   border-spacing: 0; 
} 

/* css 시작 */
 
 .body{
	 font-family: 'Gowun Dodum';
	 height: 1450px;
} 

header{
	text-align: center;
}

.logo{
	margin-left: 500px;
	width: 120px;
}

.top{
	height: 30px;
	background-color: #c12231;
	color: white;
	font-size: 15px;
	line-height: 30px;
	margin-bottom: 50px;
}

.container{
	height: 500px;
	padding-top: 50px;
	font-family: 'Gowun Dodum';
}

 .memberform{
   	 width: 78%;
   }

form{
 	border-top: 2px solid gray; 
 	height: 100%; 
 	width: 70%;
 	margin-left: 250px;
}
   
h1{
   	 padding-left: 55%;
     font-size: 40px;
 
     
   }
   
table tr td{
   	padding-top: 25px;
   } 
    
.required_title{
	font-size: 15px;
	float: right;
}
    
.required{
	color: 	#FF6A89;
	font-size: 15px;
}
 
#idcheck,#search_btn{
 	 width: 150px; 
     height:30px; 
     border: 1px solid #FF6A89; 
     color: #FF6A89; 
     background-color: white; 
     border-radius: 20px; 
     font-size: 13px;
 }
   
label {
  display: block;
}

.agree{
	border-top: 2px solid gray;
	width: 100%;

}

.signupbtn{
	width: 600px; 
	height: 60px; 
	margin-top: 20px;
	margin-bottom: 100px;
    border: 2px solid #c12231; 
    color: #c12231; 
    background-color: white; 
    border-radius: 10px; 
    font-size: 25px;
}   	

.signupbtn:hover{
	width: 600px; 
	height: 60px; 
	margin-top: 20px;
	margin-bottom: 100px;
  	border: 1px solid #c12231; 
    color: white; 
    background-color: #c12231; 
    border-radius: 10px; 
    font-size: 25px;
}

span button{
	float: right;
	border-radius: 40px; 
}	

span.agree_all{
	font-size: 20px;
	font-weight: bold;
}	

h4.modal-title{
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}	

/* .agree_all1{
	margin-left: 30px;
 	font-size: px;
}	
 */
.agree_all1 span{
 	margin-left: 40px;
 
 }

 


.agree1{
	width: 100%;
	
 }
 
 .agree1 span{
 	margin-left: 30px;
 	font-size: 17px;
 }
 
 input[type=checkbox] + label {
	display: inline-block;
	width: 23px;
	height: 23px;
	border: 1px solid #bcbcbc;
	border-radius: 50%;
	cursor: pointer;
	position: absolute;
	margin-right: 20px;
	 
}

input[type=checkbox] {
	display: none;
}

input[type=checkbox]:checked + label::after {
	content:'✓';
	position: absolute;
	left: 30%;
}

input[id="agree_all"] {
	display: none;
}

input[id="agree_all"]:checked + label::after {
	content:'✓';
	font-size: 25px;
	position: absolute;
	top: -6px;
	left: 7px;
}
 
input[id="agree_all"] + label {
	display: inline-block;
	width: 29px;
	height: 29px;
	border: 1px solid #bcbcbc;
	border-radius: 50%;
	cursor: pointer;
	position: absolute;
	margin-right: 20px;
	 
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
					$("b.idok").text("사용 가능한 아이디 입니다.").css("color","#B7A4EE");
				}else {
					$("b.idok").text("이미 존재하는 아이디 입니다.").css("color","#FF6A89");
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
			$("b.passok").text("비밀번호가 일치합니다.").css("color","#B7A4EE");
		}else{
			$("b.passok").text("비밀번호가 일치하지 않습니다.").css("color","#FF6A89");
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
			<div class="top">지금 회원가입하고 레시피를 직접 등록해보세요!</div>
			<a href="../">
			<img class="logo" src="../img/logo.png">
			</a>
		</header>
		<!-- container -->
		<div class="container" id="container">
			<div class="memberform">
			   <h1>회원가입</h1><br><br>
			   <form action="insert" method="post" class="form-inline" onsubmit="return check()">
			   		<br>
			   		<span class="required_title"><span class="required">*</span>필수입력사항</span>
			   		<table style="width: 100%;" class="mem">
			   			<!-- <tr>
			   				<td colspan="2">
			   					<span class="required_title">*필수입력항목</span>
			   				</td>
			   			</tr> -->
			   			<tr  style="">
			   				<th style="width: 130px;">이 름<span class="required">*</span></th>
			   				<td>
			   					<input type="text" name="name" style="width: 300px;" class="form-control"
			   					required="required" placeholder="이름을 입력해주세요">
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">아이디<span class="required">*</span></th>
			   				<td>
			   					<input type="text" name="userid" id="UserID" style="width: 300px;" class="form-control"
			   					required="required" placeholder="아이디 입력후 중복체크 해주세요">
			   					&nbsp;
			   					<button type="button" id="idcheck">아이디 체크</button>
			   					&nbsp;
			   					<br>
			   					<b class="idok"></b>
			   				</td>
			   			</tr>
			   			<tr rowspan="2">
			   				<th style="width: 130px;">비밀번호<span class="required">*</span></th>
			   				<td>
			   					<input type="password" name="password" id="password1" style="width: 300px;" class="form-control"
			   					required="required" placeholder="비밀번호를 입력해주세요">
							<br><br>
			   					<input type="password" id="password2" style="width: 300px;" class="form-control"
			   					required="required" placeholder="비밀번호 확인">
			   					&nbsp;
			   					<br>
			   					<b class="passok"></b>
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">핸드폰<span class="required">*</span></th>
			   				<td>
			   					<input type="text" name="hp" style="width: 300px;" class="form-control"
			   					required="required"  placeholder="숫자만 입력해주세요">
			   				</td>
			   			</tr>

			   			  
			   			<tr>
			   				<th style="width: 130px;">이메일<span class="required">*</span></th>
			   				<td>
			   					<input type="text" name="email1" style="width: 130px;" class="form-control"
			   					required="required" placeholder="예) tablemodu">
			   					<b>@</b>
			   					<input type="text" name="email2" id="email2" style="width: 140px;" class="form-control"
			   					required="required" placeholder="naver.com">&nbsp;
			   					<select id="email3" class="form-control" style="width: 150px;">
			   						<option value="-">직접입력</option>
			   						<option value="naver.com">네이버</option>
			   						<option value="nate.com">네이트</option>
			   						<option value="gmail.com">구글</option>
			   					</select>
			   				</td>
			   			</tr>
			   				<tr rowspan="2">
			   				<th style="width: 130px;">주소<span class="required">*</span></th>
			   				<td>
			   					<input type="text" id="address_search" name="address1" readonly style="width: 300px;" class="form-control"
			   					placeholder="주소를 입력해주세요"/>		
			   					&nbsp;
			   					<button type="button" id="search_btn"
			   					style="width: 150px;">주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span></button>
			   					&nbsp;
							<br><br>
			   					<input type="text" name="address2" style="width: 300px;" class="form-control
			   					required="required" placeholder="상세주소를 입력해주세요">
			   					&nbsp;
			   					<br><br>
			   				</td>
			   			</tr>
			   		</table>
			   		<br>
			   	<!-- 	<table class="agree"> -->
			   			<tr>
			   				<td>

			   					<hr>
			   					<br>
			   					<!-- <div class="agree"> -->
			   					  <div class="agree_all1">
								  <input type="checkbox" name="agree_all" id="agree_all">
								  <label for="agree_all"></label>
								  <span class="agree_all">전체 동의합니다</span>
								  <br><br>
								  <span>선택항목에 동의하지 않은 경우에도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</span>
								</div>
								<br>
								<div class="agree1">
								  <input type="checkbox" name="agree" id="agree1" value="1" required="required">
								  <label for="agree1"></label>
								  <span>이용약관 동의<strong>(필수)</strong>
								  		&nbsp;&nbsp;
								  		<!-- Trigger the modal with a button -->
  										<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal" style="border-radius: 10%; float: right;">약관보기</button>
  								  </span>
  								  </div>
								<br>
								  <div class="agree1">
								  <input type="checkbox" name="agree" id="agree2"  value="2" required="required">
								  <label for="agree2"></label>
								  <span>개인정보 수집, 이용 동의<strong>(필수)</strong>
								  		&nbsp;&nbsp;
								  		<!-- Trigger the modal with a button -->
  										<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal">약관보기</button>
  								  </span>
  								  </div>
								<br>
								  <div class="agree1">
								  <input type="checkbox" name="agree" id="agree3" value="3" required="required">
								  <label for="agree3"></label>
								  <span>개인정보 이용 동의<strong>(필수)</strong>
										
								  		<!-- Trigger the modal with a button -->
  										<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal">약관보기</button>
  								  </span>
  								  </div>
								<br>
								<div class="agree1">
								  <input type="checkbox" name="agree" id="agree4" value="4">
								  <label for="agree4"></label>
								  <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong>
								  		&nbsp;&nbsp;	
								  		<!-- Trigger the modal with a button -->
  										<button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal">약관보기</button>
  								  </span>
  								  </div>
								<br><br>
								
			   				</td>
			   			</tr>
			   		</table>
			   		<!-- <div class="container"> -->
					  <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">이용약관</h4>
					        </div>
					        <div class="modal-body">
					          <p>제 1장 총칙 
					          <br>제 1 조(목적)
							  <br>본 약관은 모두의식탁이 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
								
								<br>제 2 조(약관의 효력과 변경)
								
								<br>1. 모두의식탁은 이용자가 본 약관 내용에 동의하는 경우, 모두의식탁의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
								<br>2. 모두의식탁은 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 국가공간정보포털의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 국가공간정보포털은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.
								<br>3. 변경된 약관은 국가공간정보포털 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.
								
								<br>제 3 조(약관 외 준칙)
								
								<br>본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
								
								<br>제 4 조(용어의 정의)
								
								<br>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
								<br>1. 이용자 : 본 약관에 따라 국가공간정보포털이 제공하는 서비스를 받는 자
								<br>2. 가입 : 국가공간정보포털이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
								<br>3. 회원 : 국가공간정보포털에 개인 정보를 제공하여 회원 등록을 한 자로서 국가공간정보포털이 제공하는 서비스를 이용할 수 있는 자.
								<br>4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 국가공간정보포털에서 부여하는 문자와 숫자의 조합
								<br>5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합
								<br>6. 탈퇴 : 회원이 이용계약을 종료시키는 행위
								<br>7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.
								</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
					        </div>
					      </div>
					    </div>
					  </div>
					<hr>
					<button type="submit" class="signupbtn">회원가입</button>
				   </form>
			 </div>
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
    
 // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
        agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
          agreeChk[i].checked = e.target.checked;
        }
    });
</script>

</body>
</html>