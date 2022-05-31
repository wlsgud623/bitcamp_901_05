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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body * {
	font-family: 'Gowun Dodum'; 
}

div.container {
	text-align: center;
	width: 1170px;
	
}

.rec_img img{
	overflow: hidden; 
}


.rec_img img:hover{
	transform:scale(1.1);           
	transition: transform .5s; 	
	overflow: hidden; 
	
}

.txt {
    width: 1000px; 
    position: absolute;
    left: 50%;
    top: 25%;
   	margin-left: -900px; 
    text-decoration: none;
    color: white;
    font-size: 40px;
    padding-bottom: 0;
    font-family: 'Song Myung';
}

h3{
	font-family: 'Song Myung';
}


.tag{
	padding: 0;
}

.tag span{
	font-size: 18px;
	font-family: 'Gowun Dodum'; 
	color: black;
}


.info_tag span{
/* font-family: 'Jua' */
	font-size: 12px;
	color: gray;
}

.info_title span{
	font-size: 25px;
	color: black;
	font-family: 'Gowun Dodum';
}

.info_title a:hover{
	text-decoration: none;
}

.info_title span:hover{
	color: red;
	font-weight: bold;
	
}

.clickbtn{	
	width: 200px;
	height: 50px;
	padding: 5px 10px;
	border: 1px solid white;
	background-color: white;
	border-radius: 20px;
	color: black;
	font-size: 20px;	
	font-family: 'Gowun Dodum'; 
	margin-top: 40px;
}

.clickbtn:hover{
	border: 1px solid #c12231;
	background-color: #c12231;
	border-radius: 20px;
	color: white;
}

img.recipes_icon{
	width: 35px;
	position: relative;
}

.wrap {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.wrap2 {
	padding-left: 20px;
}

.rec_recipe {
	margin-left: 50px;
}

img.line{
	 width: 1000px;
	 margin-top: 20px;
}

img.logo{
	float: right; 
	width: 200px;
	bottom: 0;
}

.content_text {
	margin-top: 1000px;
	margin-bottom: 250px;
	height: 600px;
	width: 1000px;
	padding-top: 50px;
	/* border: 2px solid #CD1F48; */
	text-align: left;
	/* border-radius: 30px; */
	margin-left: 60px;
	/* border-top: 1px solid #CD1F48; */
}

.content_text b {
	font-size: 23px;
	font-family: 'East Sea Dokdo';
	color: #c12231;
}

div {
	display: block;
}

b.title{
	/* font-family: 'Gowun Batang'; */
	font-size: 30px;
}

h2 i{
	font-size: 30px;
}

/* 하단 슬라이드  */
/* 초기화 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

li {
	list-style-type: none;
}

/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow {
	width: 1000px;
	height: 200px;
	position: relative;
	margin: 50px auto;
	overflow: hidden; 
	
	/*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}

.slides {
	position: absolute;
	left: 50px;
	top: 0;
	width: 100%; /* 슬라이드할 사진과 마진 총 넓이 */
	transition: left 0.5s ease-out;
	overflow: hidden;
	/*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

.slides a{
	text-decoration: none;
}

.slides li{
	
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child {
	margin-left: 10px;
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child) {
	float: left;
	margin-right: 100px;
}

.slides a{
	text-decoration: none;
}

.slides a li {
	float: left;
	font-size: 15px;
	font-family: 'Gowun Dodum'; 
}

.slides img{
	border-radius: 50%; 
	width: 120px;
	margin-bottom: 10px;
}

.controller span {
	position: absolute;
	background-color: transparent;
	color: black;
	text-align: center;
	border-radius: 50%;
	padding: 10px 20px;
	top: 20%;
	font-size: 30px;
	cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover {
	background-color: rgba(128, 128, 128, 0.11);
}

.prev {
	left: 0;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover {
	transform: translateX(-10px);
}

.next {
	right: 0px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover {
	transform: translateX(10px);
}

</style>



<script type="text/javascript">
$(function() {
	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = 5; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	const slideWidth = 1500; //한개의 슬라이드 넓이
	const slideMargin = 100; //슬라이드간의 margin 값

	//전체 슬라이드 컨테이너 넓이 설정
	slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

	function moveSlide(num) {
	  slides.style.left = -num * 400 + 'px';
	  currentIdx = num;
	}

	prev.addEventListener('click', function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */

	  if (currentIdx !== 0) moveSlide(currentIdx - 1);
	});

	next.addEventListener('click', function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx !== slideCount - 1) {
	    moveSlide(currentIdx + 1);
	  }
	});

	if(${kakao=="yes"}){
		alert("login 카카오 로그인 성공");
			var s = "";
		s += "<div class='kakao_logout' style='text-align: center;'>";
		s += "<button class='btn btn-success' onclick='kakaoLogout()'>";
	        s += "<span>로그아웃</span></button></div>";
	    $(".logoutbtn").html(s);
	    
	    $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기
	}
		
});
</script>
</head>
<body>
 	 	<%-- <!-- 홈페이지 로그인 -->

		<c:if test="${sessionScope.loginok == null}">
			<div class="loginbtn" style="text-align: center;">
				<button type="button" class="btn btn-warning btn-sm" 
					style="width: 100px;" onclick="location.href='/login'">로그인</button>
			</div>
		</c:if>
		
		<!-- 홈페이지 로그아웃 -->
		<div class="logoutbtn" style="text-align: center;">
		<c:if test="${sessionScope.loginok != null}">
			<b style="font-family: 'Gowun Batang'">${sessionScope.loginname}(${sessionScope.loginid}) 님</b>
			&nbsp;
			<button type="button" class="btn btn btn-sm" onclick="logout()">로그아웃</button>
		</c:if>
		</div> --%>

		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%; ">
			<!-- <!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" class=""></li>
				<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="width: 100%">
				<div class="item active" >
					<div class="sub_item" >
							<a href="/recipe/detail?idx=72"> 
							<img src="img/main/main_01.jpg" alt="food_img" style="width: 100%">
							<div class="txt">
								<h3>색다른 메뉴가 끌릴땐</h3>
									카레토마토솥밥
								<div class="tag"><span>#채식</span><span> #이색메뉴</span></div>
								<button class="clickbtn">레시피 바로 보기<span></span></button>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="sub_item">
						<a href="/recipe/detail?idx=74"> 
							<img src="img/main/main_03.jpg" alt="food_img"  style="width: 100%">
							<div class="txt" style="padding-left: 200px;">
								<h3>특별한 날엔</h3>
								카레 샥슈카
								<div class="tag"><span>#집들이음식</span><span> #양식</span></div>
								<button class="clickbtn">레시피 바로 보기<span></span></button>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="sub_item">
						<a href="/recipe/detail?idx=73"> 
							<img src="img/main/main_02.jpg" alt="food_img" style="width: 100%">
							<div class="txt" >
								<h3>쌀쌀한 날에 생각나는</h3>
								떡만두국
						<div class="tag"><span>#떡만둣국</span><span> #뜨끈한국물</span></div>
						<button class="clickbtn">레시피 바로 보기<i></i></button>	
						</div>
						</a>
					</div>
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		
		<!-- 슬라이더 끝 -->

		
		<br>
		<br>
	
		<script type="text/javascript">
	let arr;
	</script>
<div class="container">

		
		<!-- 추천레시피 시작 -->
		<b class="title">&nbsp;추천레시피<!-- <img src="img/main/recipes.png" class="recipes_icon"> --></b>
		<br>
		<br>
		<br>
		<div class="rec_recipe" style="width: 1170px;">
			<c:forEach var="dto" items="${list}" varStatus="i" begin="25" end="39">
				<div class="box" style="float: left; width: 30%">
					<div class="rec_img">
						<a href="/recipe/detail?idx=${dto.RECIPE_IDX}"> 
						<img src="../upload/${dto.main_photo}" class="mainimage" style="width: 90%;">
						</a>
					<%-- 	<c:if test="${dto.main_photo%4 == 0}"><br></c:if>  --%>
					</div>
					<br>
					<div class="info">
						<div class="info_tag">
							<span><script type="text/javascript">
						var tags = "<c:out value='${dto.tags}'/>";
						arr = tags.split(",");
						for(var tag of arr){
							document.write("#" + tag + " ");
						} 
					</script></span>
						</div>
					</div>
					<div class="info_title">
						<a href="/recipe/detail?idx=${RECIPE_IDX}"><span>${dto.name}</span>
						</a>
					</div>
					<br>
				</div>
			</c:forEach>
		</div>
		<!-- 추천레시피 끝 -->
		
		
		<!-- 소개글 시작-->
		<div class="content_text">
		<img class="line" src="../img/main/line.png">
		<br><br><br>
			<b>모두의 밥상은 수만가지의 레시피를 종류별, 재료별, 난이도별로 분류하여, <br>각자의 라이프스타일에 맞는 레시피를 쉽고
				편리하게 찾을 수 있는 서비스를 제공하고 있습니다. <br>백주부님 레시피를 하나하나 찾기 힘든 주부님들을 위해!
				배달 음식으로 지갑이 가벼워진 자취생들을 위해! <br>번거로운 재료준비는 줄이고 쉽고 간단한 방법으로 모두의
				밥상이 풍요로워지는 경험을 해보세요!
			</b><img class="logo" src="img/main/logo2.png">
			<img class="line" src="../img/main/line.png">
		</div>
		<b class="title">카테고리<!-- <i class="fa-brands fa-bilibili"></i> --></b>
		<br>
		
<!-- 카테고리 시작 -->
		<div id="slideShow">
			<ul class="slides">
				<a href="/collection/category?category=category&item=밥/죽&currentPage=1">
					<li><img src="img/main/c02.jpg"><br>밥/죽</li>
				</a>
				<a href="/collection/category?category=category&item=반찬&currentPage=1">
					<li><img src="img/main/c01.jpg"><br>반찬</li>
				</a>
				<a href="/collection/category?category=category&item=국물&currentPage=1">
					<li><img src="img/main/국.jpg"><br>국물</li>
				</a>
				<a href="/collection/category?category=category&item=면&currentPage=1">
					<li><img src="img/main/c04.jpg"><br>면</li>
				</a> 	
				<a href="/collection/category?category=category&item=디저트&currentPage=1">
					<li><img src="img/main/c03.jpg"><br>디저트</li>
				</a>
				<a href="/collection/category?category=category&item=양식&currentPage=1">
					<li><img src="img/main/양식.jpg"><br>양식</li>
				</a>
				<a href="/collection/category?category=category&item=일식&currentPage=1">
					<li><img src="img/main/일식.jpg"><br>일식</li>
				</a>
				<a href="/collection/category?category=category&item=중식&currentPage=1">
					<li><img src="img/main/중식.jpg"><br>중식</li>
				</a>
				<a href="/collection/category?category=category&item=퓨전&currentPage=1">
					<li><img src="img/main/퓨전.jpg"><br>퓨전</li>
				</a>
				<a href="/collection/category?category=category&item=떡/만두&currentPage=1">
					<li><img src="img/main/만두.jpg"><br>떡/만두</li>
				</a>
				<a href="/collection/category?category=category&item=양념/소스&currentPage=1">
					<li><img src="img/main/소스.jpg"><br>양념/소스</li>
				</a>
				<a href="/collection/category?category=category&item=샐러드&currentPage=1">
					<li><img src="img/main/샐러드.jpg"><br>샐러드</li>
				</a>
				<a href="/collection/category?category=category&item=음료&currentPage=1">
					<li><img src="img/main/음료.jpg"><br>음료</li>
				</a>
				<a href="/collection/category?category=category&item=기타&currentPage=1">
					<li><img src="img/main/기타.jpg"><br>기타</li>
				</a>
			</ul>
			<p class="controller">
				<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
				<span class="prev">&lang;</span> <span class="next">&rang;</span>
			</p>
		</div>
		<!-- 카테고리 끝 -->
		
	</div>
	
	
	
<!-- 네이버 아이디로 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

	var naver_id_login = new naver_id_login("bE43jdaj6ZKwPRwdWSzJ", "http://localhost:9000/");
	// 접근 토큰 값 출력
	/* alert(naver_id_login.oauthParams.access_token); 토큰 넘어오는지 확인*/
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	/*  alert(naver_id_login.getProfileData('name')); 값 넘어오는지 확인 */ 
		
	    var name = naver_id_login.getProfileData('name');
	    
	    $.ajax({
			type: "post",
			dataType: "json",
			url: "/naver_login",
			data: {"name":name},
			success: function(data) {
				alert("네이버 로그인 성공");
					var s = "";
					s += "<div class='naver_logout' style='text-align: center;'>";
					s += "<button class='btn btn-success' onclick='naverLogout()'>";
			        s += "<span>로그아웃</span></button></div>";
				    $(".logoutbtn").html(s);
				    
				    $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기
			}	
		});
	}

	//네이버 로그아웃
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {	
		openPopUp();
		setTimeout(function() {
			closePopUp();	
			location.reload();
			}, 500);
		history.replaceState({}, null, location.pathname); //url 숨기기
	}
	
	//홈페이지 로그아웃
	function logout(){
		$.ajax({
			type: "get",
			dataType: "text",
			url: "/logout",
			success: function(){
				location.href="/login";
				alert("로그아웃되었습니다")
			}
		});
	}
         
        
      //카카오 로그인
       $.ajax({
   			type: "post",
   			dataType: "text",
   			url: "/kakao_login",
   			data: {"id":id},
   			success: function(data) {
   				alert("login 카카오 로그인 성공"); 
   				var s = "";
		s += "<div class='kakao_logout' style='text-align: center;'>";
		s += "<button class='btn btn-success' onclick='kakaoLogout()'>";
        s += "<span>로그아웃</span></button></div>";
	    $(".logoutbtn").html(s);
	    
	    $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기			
   			}	
   		});      
 
       //카카오 로그아웃
     	var testPopUp;
     	function openPopUp() {
     	    testPopUp= window.open("http://developers.kakao.com/logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
     	}
     	function closePopUp(){
     	    testPopUp.close();
     	}
     	
     	function kakaoLogout() {	
     		openPopUp();
     		setTimeout(function() {
     			closePopUp();	
     			location.href="/";
     			}, 500);
     		history.replaceState({}, null, location.pathname); //url 숨기기
     	}
</script>
</body>
</html>
