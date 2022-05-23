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
 
.body{
	text-align: center;
}

header{
	padding-top: 50px;
}

.container{
	height: 600px;
}

#login_wrap{
	padding-top: 50px;
}

.login_wrap{
	width: 600px;
	margin-left: 260px;
	margin-top: 50px;
}

/*로그인 폼*/



.input-box{
    position:relative;
    margin:10px 0;
}
.input-box > input{
    background:transparent;
    border:none;
    border-bottom: solid 1px #ccc;
    padding:20px 0px 5px 0px;
    font-size:14pt;
    width:100%;
}

input::placeholder{
    color:transparent;
}

input:placeholder-shown + label{
    color:#aaa;
    font-size:14pt;
    top:15px;
}

input:focus + label, label{
    color:#8aa1a1;
    font-size:10pt;
    pointer-events: none;
    position: absolute;
    left:0px;
    top:0px;
    transition: all 0.2s ease ;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    -o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown){
    border-bottom: solid 1px #8aa1a1;
    outline:none;
}

input[type=submit]{
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    width:100%;
    height:35px;
    font-size: 14pt;
    margin-top:100px;
}

#forgot{
    text-align: right;
    font-size:12pt;
    color:rgb(164, 164, 164);
    margin:10px 0px;
}

#login_btn{
	height: 60px;
	width: 280px;
}

#naver_id_login{
	margin-top: 10px;
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
		<!-- java -->
		<c:if test="${sessionScope.saveid == 'yes'}">
			<c:set var ="loginid" value="${sessionScope.loginid}"/>
		</c:if>
		<c:if test="${sessionScope.saveid == 'null' || sessionScope.saveid == 'no'}">
			<c:set var ="loginid" value=""/>
		</c:if>
		<!-- container -->
		<div class="container" id="container">
			<div class="login_wrap" id="login_wrap">
		   		<h2>로그인</h2> 
		   		<form action="process" method="post"> 
		   		<div class="input-box"> 
		   		<input id="UserID" type="text" name="UserID" placeholder="아이디"
		   		value="${loginid}"> 
		   		<label for="UserID">아이디</label> 
		   		</div> <div class="input-box"> 
		   		<input id="password" type="password" name="password" placeholder="비밀번호"> 
		   		<label for="password">비밀번호</label> 
		   		</div>
		   		<div id="forgot">
		   		<input type="checkbox" name="chkid" ${loginid == ""?"":"checked"}>
   						 아이디 저장</div> 
		   		<input type="submit" value="로그인" id="login_btn"> </form>
		   		<!-- 네이버 아이디로 로그인 버튼 -->
		   		<div id = "naver_id_login"></div>
			</div>
			
		</div>
		<!-- //container -->
	</div>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 

 
<script type="text/javascript">
 
         var naver_id_login = new naver_id_login("bE43jdaj6ZKwPRwdWSzJ", "http://localhost:9000/");    // Client ID, CallBack URL 삽입
                                            // 단 'localhost'가 포함된 CallBack URL
         var state = naver_id_login.getUniqState();
        
         naver_id_login.setButton("green", 3, 60);
         naver_id_login.setDomain("http://localhost:9000/login/login");    //  URL
         naver_id_login.setState(state);
      /*    naver_id_login.setPopup(); */
         naver_id_login.init_naver_id_login();
 
</script>

<script type="text/javascript">
        var naver_id_login = new naver_id_login("bE43jdaj6ZKwPRwdWSzJ", "http://localhost:9000/"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
        
        // 접근 토큰 값 출력
        alert(naver_id_login.oauthParams.access_token);
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('email'));
            alert(naver_id_login.getProfileData('nickname'));
            alert(naver_id_login.getProfileData('age'));
            
        }
</script>
</body>
</html>