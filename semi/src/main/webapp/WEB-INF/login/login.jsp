<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Nanum+Myeongjo&family=Song+Myung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">

/* css 기본설정 */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
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

.top{
	height: 30px;
	background-color: #c12231;
	color: white;
	font-size: 15px;
	line-height: 30px;
	margin-bottom: 50px;
}

.body {
	text-align: center;
	height: 1100px;
	font-family: 'Gowun Dodum';
}

header {
	padding-top: 100px;
}

.logo{
	margin-left: 450px;
	width: 150px;
}


.container {
	height: 600px;
	padding-top: 30px;
}

#login_wrap {
	padding-top: 50px;
}

.login_wrap {
	width: 600px;
	margin-left: 260px;
	margin-top: 50px;
}

.login_wrap h2{
	font-size: 40px;
}

/*로그인 폼*/
.input-box {
	position: relative;
	margin: 10px 0;
}

.input-box>input {
	background: transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 100%;
}

input::placeholder {
	color: transparent;
}

input:placeholder-shown+label {
	color: #aaa;
	font-size: 14pt;
	top: 15px;
}

input:focus+label, label {
	color: #8aa1a1;
	font-size: 10pt;
	pointer-events: none;
	position: absolute;
	left: 0px;
	top: 0px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown) {
	border-bottom: solid 1px #8aa1a1;
	outline: none;
}

input[type=submit] {
	background-color: #8aa1a1;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 35px;
	font-size: 14pt;
	margin-top: 100px;
}

#forgot {
	text-align: right;
	font-size: 12pt;
	color: rgb(164, 164, 164);
	margin: 10px 0px;
}

#login_btn {
	height: 50px;
	width: 580px;
	margin-top: 50px;
    border: 1.5px solid #bebebe; 
    color: #bebebe; 
    background-color: white; 
    border-radius: 15px; 
    font-size: 20px;
	
}

#login_btn:hover{
	width: 580px; 
	height: 50px; 
	margin-top: 50px;
  	border: 1px solid #c12231; 
    color: white; 
    background-color: #c12231; 
    border-radius: 15px; 
    font-size: 20px;
}

.signupbtn1{
	height: 50px;
	width: 580px;
	margin-top: 10px;
    border: 1.5px solid #bebebe; 
    color: #bebebe; 
    background-color: white; 
    border-radius: 15px; 
    font-size: 20px;
}

.signupbtn1:hover{
	width: 580px; 
	height: 50px; 
	margin-top: 10px;
  	border: 1px solid #c12231; 
    color: white; 
    background-color: #c12231; 
    border-radius: 15px; 
    font-size: 20px;
}

.loginbtn{
	width: 100%;
	height: 100px;
}

#naver_id_login {
	margin-top: 10px;
	margin-left: 15px;
}

.button-login img{
    margin-top: 10px;
    height: 60px;
    width: 280px;
    border-radius: 5px;
    
   
}

.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}

.hr-sect::before,
.hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>

</head>
<body>
	<div class="body">
		<header class="header">
			<a href="../"> <img class="logo" src="../img/logo.png">
			</a>
		</header>
		<!-- java -->
		<c:if test="${sessionScope.saveid == 'yes'}">
			<c:set var="loginid" value="${sessionScope.loginid}" />
		</c:if>
		<c:if
			test="${sessionScope.saveid == 'null' || sessionScope.saveid == 'no'}">
			<c:set var="loginid" value="" />
		</c:if>
		<!-- container -->
		<div class="container" id="container">
			<div class="login_wrap" id="login_wrap">
				<h2>로그인</h2>

				<!-- login form -->
				<form action="loginprocess" method="post">
				<input type="hidden" name="ref" value="${ref}">
					<div class="input-box">
						<input id="userid" type="text" name="userid" placeholder="아이디"
							value="${loginid}"> <label for="userid">아이디</label>
					</div>
					<div class="input-box">
						<input id="password" type="password" name="password"
							placeholder="비밀번호"> <label for="password">비밀번호</label>
					</div>
					<div id="forgot">
						<input type="checkbox" name="chkid" ${loginid == ""?"":"checked"}>
						아이디 저장
					</div>
					<input type="submit" value="로그인" id="login_btn">
					<button type="button" class="signupbtn1" onclick="location.href='http://localhost:9000/member/signup'">회원가입</button>
				</form>
				<br>
				<div class="hr-sect">또는</div>
				<br>
				
				<div class="loginbtn">
					<!-- naver_login -->
					<div id="naver_id_login" style="float: left;"></div>
					
					<!-- kakao_login -->
					<div class="button-login">
                		<a id="kakao-login-btn" >
    						<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg">
    					</a>
            		</div>
           			<br> 	
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
 		//네이버 로그인//
         var naver_id_login = new naver_id_login("bE43jdaj6ZKwPRwdWSzJ", "http://localhost:9000/");    // Client ID, CallBack URL 삽입 (단 'localhost'가 포함된 CallBack URL)
         var state = naver_id_login.getUniqState();   
         naver_id_login.setButton("green", 3, 60); //color, type, height
         naver_id_login.setDomain("http://localhost:9000/login");    //  URL
         naver_id_login.setState(state);
         naver_id_login.init_naver_id_login();
         
      	//카카오 로그인//
         Kakao.init('1a4bc9d5729e6318b48f52fd55ffdcc1');
         $("#kakao-login-btn").on("click", function(){
             //1. 로그인 시도
             Kakao.Auth.login({
                 success: function(authObj) {
                  
                   //2. 로그인 성공시, API 호출
                   Kakao.API.request({
                     url: '/v2/user/me',
                     success: function(res) {
                       console.log(res);
                       var id = res.id;
         			   scope : 'account_email';
         			   /* alert('로그인성공'); */
                       //location.href="http://localhost:9000/";
                       $.ajax({
                  			type: "post",
                  			dataType: "json",
                  			url: "/kakao_login",
                  			data: {"id":id},
                  			success: function(data) {
                  				location.href="/kakao_main";                  				
                  			}	
                  	   });
                		}
                   });
                   console.log(authObj);
                   var token = authObj.access_token;
                 },
                 fail: function(err) {
                   alert(JSON.stringify(err));
                 }
               });    
         });
         
       //로그인 실패시
         if(${msg != '0'}){        
         	var message = "${msg}";
         	var url = "${url}";
         	alert(message);
         	document.location.href = "/login";
         }
</script>
</body>
</html>