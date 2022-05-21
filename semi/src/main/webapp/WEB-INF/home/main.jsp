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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<style type="text/css">
	.container{
		text-align: center;
		width: 1200px;
		
	}

	.carousel slide{
		padding-right: 0px;
	}
	
	div.carousel-inner{
		text-align: center;
	}
	
	div.sub_item{
	 	float: left; 
		margin: 0 auto;
	}
	
	.mainimage{
		margin-top: 20px;
		margin-left: 10px;
	}
	
	.content{
		height: 600px;
	}

	.content_text{
		width: 1100px;
		height: 600px;
		margin: 0 auto;
		padding: 100px 100px;;
		font-size: 20px; 
		border: 5px solid #CD1F48;
		text-align: left;
	}
	
	.content_text img {
		float: right;
	}
	
 	.sub_item2 img{
		width: 200px;
		height: 200px;
		border: 1px solid white;
		border-radius: 80%;
	} */
	
/* 	div.sub_item2{
		width: 100px;
		height: 100px;
		border: 1px solid black;
		border-radius: 50px;
	}
	 */

	
</style>
</head>
<body>
<div class="container">  
	<br><br><br><br>
   <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 1200px;">
    <!-- <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol> 

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
      	<div class="sub_item" >
        	<img src="img/main/2.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/3.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/4.jpg" alt="New york" style="width:33%;">
         	
      </div>
   </div>

      <div class="item">
      <div class="sub_item" >
        	<img src="img/main/5.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/6.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/7.jpg" alt="New york" style="width:33%;">
      </div>
      </div>
    
      <div class="item">
      <div class="sub_item" >
        	<img src="img/main/8.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/9.jpg" alt="Chicago" style="width:33%;">
         	<img src="img/main/10.jpg" alt="New york" style="width:33%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br><br><br>
<div class="rec_recipe" width="600px;">
	<h1 style="padding-left: 20px;">&nbsp;추천 레시피</h1>
	<br>
	
	<c:forEach var="a" begin="1" end="15">
		<img src="img/main/${a}.jpg" class="mainimage" style="width: 30%;">
		 <%-- <c:if test="${a%3 == 0}"><br></c:if>  --%>
	</c:forEach>
</div>
<br><br><br><br>

<div class="content">
	<div class="content_text">
	<b>모두의 밥상은 수만가지의 레시피를 종류별, 재료별, 난이도별로 분류하여 각자의 라이프스타일에 맞는 레시피를 <br>쉽고 편리하게 찾을 수 있는 서비스를 제공하고 있습니다. 
	<br>백주부님 레시피를 하나하나 찾기 힘든 주부님들을 위해! 배달 음식으로 지갑이 가벼워진 자취생들을 위해!
	<br>번거로운 재료준비는 줄이고 쉽고 간단한 방법으로 모두의 밥상이 풍요로워지는 경험을 해보세요!</b>
	<img src="img/main/logo2.png">
</div>
	<div class="home_category">
	 <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 1200px;">
    <!-- <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol> 

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
      	<div class="sub_item2" >
	      	<c:forEach var="a" begin="1" end="5">
				<img src="img/main/${a}.jpg" class="mainimage">
			</c:forEach>
      </div>
   </div>
      <div class="item">
      <div class="sub_item2" >
        	<c:forEach var="a" begin="6" end="10">
				<img src="img/main/${a}.jpg" class="mainimage">
			</c:forEach>
      </div>
	</div>
</div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> 

<script> var naverLogin = new naver.LoginWithNaverId( { 
	clientId: "bE43jdaj6ZKwPRwdWSzJ", 
	callbackUrl: "http://localhost:9000/", 
	isPopup: true, 
	callbackHandle: true /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ } ); /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
	naverLogin.init(); /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
	
	window.addEventListener('load', function () { 
				naverLogin.getLoginStatus(function (status) { 
					if (status) { /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
					// 유저 아이디, 이메일 주소, 이름을 Session에 저장하였습니다. 
						sessionStorage.setItem("user_info",naverLogin.user.id); 
						sessionStorage.setItem("naver_email", 
						naverLogin.user.getEmail()); 
						sessionStorage.setItem("naver_name", naverLogin.user.getName()); // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장합니다. 
						sessionStorage.setItem("kinds","naver"); 
						// 회원가입 혹은 로그인 시 처리하기 위한 페이지 입니다. 예를 들어 DB 
						/* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */ 
						location.href = "/comuser/member/join/?flag=WRITE"; 
					} else { 
						console.log("callback 처리에 실패하였습니다."); 
					} }); 
				}); 
	</script>



</body>
</html>