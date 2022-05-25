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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">
div.container{
 	text-align: center; 
	width: 100%;	
}

.wrap{
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.wrap2{
	padding-left: 20px;	
} 

.rec_recipe{
	margin-left: 50px;
}
	
.content_text{
 	margin-top: 1200px;
	height: 650px;
	width: 1320px;
	padding: 100px 100px;
	border: 5px solid #CD1F48;	
	text-align: left;
} 

.content_text b{
	font-size: 25px; 
}

div.icon{	
    bottom: 0;
    z-index: 2;
    text-align: right;
    height: 48px;
    width: 370px;
    margin-top: 10px;
}

div{
	display: block;
}

i.icon_chu{
	background: url(../img/chu.png)no-repeat;
	width: 48px;
    height: 48px;
    content: '';
    display: inline-block;
    font-size: 0;
    margin-left: 3px;
}

i.icon_best{
	background: url(../img/best.png)no-repeat;
	width: 48px;
    height: 48px;
    content: '';
    display: inline-block;
    font-size: 0;
    margin-left: 3px;
}



/* 하단 슬라이드  */
/* 초기화 */
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

li{
  list-style-type: none;
}

/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow{
  width: 1300px;
  height: 300px;
  position: relative;
  margin: 50px auto;
  overflow: hidden;    
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}


.slides{
  position: absolute;
  left: 0;
  top: 0;
  width: 5000px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child{
  margin-left: 100px;
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child){
  float: left;
  margin-right: 100px;
}

.slides li{
  float: left;
}

.controller span{
  position:absolute;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  top: 20%;
  font-size: 50px;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}

.prev{
  left: 10px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover{
  transform: translateX(-10px);
}

.next{
  right: 10px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover{
  transform: translateX(10px);
}

</style>

<script type="text/javascript">
$(function() {
	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = slideImg.length; // 슬라이드 개수
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

});
</script>
</head>
<body>
<br><br>
<div class="container" style="width: 1500px;"> 
	<!-- 슬라이더 시작 -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1" class=""></li>
	      <li data-target="#myCarousel" data-slide-to="2" class=""></li>
	    </ol> 
	
		<!-- Wrapper for slides -->
		<div class="carousel-inner" style="width: 1290px;">
		    <div class="item active">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${list}" begin="2" end="4">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/${dto.main_photo}" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
			</div>
			 <div class="item">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${list}" begin="5" end="7">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/${dto.main_photo}" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
			</div>
			 <div class="item">
		      	<div class="sub_item">
		      		<c:forEach var="dto" items="${list}" begin="8" end="10">
		      			<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
		        			<img src="img/main/${dto.main_photo}" alt="food_img" style="width:33%;">
		        		</a>
	        		</c:forEach>
		   		</div>
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
	<!-- 슬라이더 끝 -->

	<br><br><br>	
	<script type="text/javascript">
	let arr;
	</script>
	
	<!-- 추천레시피 시작 -->
	<h1>&nbsp;추천 레시피</h1>
	<br><br>
	<div class="rec_recipe">
		<c:forEach var="dto" items="${list}" varStatus="i" begin="2" end="10">
		<div class="box" style=" float: left; width: 400px;">
			<div class="rec_img">
				<a href="/recipe/detail?idx=${dto.RECIPE_IDX}">
					<img src="../img/main/${dto.main_photo}" class="mainimage" style="width: 90%;">
				</a>
			</div>
			<div class="icon">
				<i class="icon_chu"></i>
				<i class="icon_best"></i>
			</div>
			<div class="info">
				<div class="info_tag">
					<span><script type="text/javascript">
						var tags = "<c:out value='${dto.tags}'/>";
						arr = tags.split(":");
						for(var tag of arr){
							document.write("#" + tag + " ");
						}
					</script></span>
				</div>
			</div>
			<div class="info_title">	
				<a href="/recipe/detail?idx=${RECIPE_IDX}">
					<span>${dto.name}</span>
				</a>
			</div>
		<br>
		</div> 
		</c:forEach>
	</div>
	<!-- 추천레시피 끝 -->	
		
	<!-- 소개글 시작-->	
	<div class="content_text">
		<b>모두의 밥상은 수만가지의 레시피를 종류별, 재료별, 난이도별로 분류하여 각자의 라이프스타일에 맞는 레시피를 쉽고 편리하게 찾을 수 있는 서비스를 제공하고 있습니다. 
		<br>백주부님 레시피를 하나하나 찾기 힘든 주부님들을 위해! 배달 음식으로 지갑이 가벼워진 자취생들을 위해!
		<br>번거로운 재료준비는 줄이고 쉽고 간단한 방법으로 모두의 밥상이 풍요로워지는 경험을 해보세요!</b>
		<img src="img/main/logo2.png" style="float: right">
	</div> 
	


<!-- 카테고리 시작 -->
 <div id="slideShow">
    <ul class="slides">
      <li><img src="img/main/category_1.png" alt=""></li>
      <li><img src="img/main/category_2.png" alt=""></li>
      <li><img src="img/main/category_3.png" alt=""></li>

      <li><img src="img/main/category_2.png" alt=""></li>
      <li><img src="img/main/category_3.png" alt=""></li>
    </ul>  
    <p class="controller">
      
      <!-- &lang: 왼쪽 방향 화살표
      &rang: 오른쪽 방향 화살표 -->
      <span class="prev">&lang;</span>  
      <span class="next">&rang;</span>
    </p>
  </div>
  <script src="JS/slideShow.js"></script>
<!-- 카테고리 끝 -->
</div> 	
	
<!-- 
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
</script> -->
</body>
</html>
