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
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Nanum+Myeongjo&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->
<script src="main.js"> </script>
<link rel="stylesheet" href="/css/main.css">
<script type="text/javascript">
$(function() {
	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = 4; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	const slideWidth = 2100; //한개의 슬라이드 넓이
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


//태그 변수
let arr;

</script>
</head>
<body>

<!-- 슬라이더 시작 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- <!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1" class=""></li>
		<li data-target="#myCarousel" data-slide-to="2" class=""></li>
	</ol>
	<div class="carousel-inner" style="width: 100%">
		<div class="item active" >
			<div class="sub_item" >
					<a href="/recipe/detail?idx=79"> 
					<img src="img/main/main_01.jpg" alt="food_img">
					<div class="txt">
						<h3>색다른 메뉴가 끌릴땐</h3>
							카레토마토솥밥
						<div class="tag"><span>#채식</span><span>#이색메뉴</span></div>
						<button class="clickbtn">레시피 바로 보기</button>
					</div>
				</a>
			</div>
		</div>
		<div class="item">
			<div class="sub_item">
				<a href="/recipe/detail?idx=81"> 
					<img src="img/main/main_03.jpg" alt="food_img">
					<div class="txt_2">
						<h3>특별한 날엔</h3>
						카레 샥슈카
						<div class="tag"><span>#집들이음식</span><span> #양식</span></div>
						<button class="clickbtn">레시피 바로 보기</button>
					</div>
				</a>
			</div>
		</div>
		<div class="item">
			<div class="sub_item">
				<a href="/recipe/detail?idx=80"> 
					<img src="img/main/main_02.jpg" alt="food_img">
					<div class="txt">
						<h3>쌀쌀한 날에 생각나는</h3>
						떡만두국
				<div class="tag"><span>#떡만둣국</span><span> #뜨끈한국물</span></div>
				<button class="clickbtn">레시피 바로 보기</button>	
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
		class="glyphicon glyphicon-chevron-right"></span> 
		<span class="sr-only">Next</span>
	</a>
</div>
<br><br>

<div class="container">
	<!-- 추천레시피 시작 -->
	<b class="title">&nbsp;추천레시피</b>
	<br><br><br>
	<div class="rec_recipe">
		<c:forEach var="dto" items="${list}" varStatus="i" begin="25" end="39">
			<div class="box" style="float: left; width: 30%">
				<div class="rec_img">
					<a href="/recipe/detail?idx=${dto.RECIPE_IDX}"> 
					<img src="../upload/${dto.main_photo}" class="mainimage">
					</a>
				</div>
				<div class="info" style="margin-top: 5px;">
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
					<a href="/recipe/detail?idx=${dto.RECIPE_IDX}"><span>${dto.name}</span>
					</a>
				</div>
				<br>
			</div>
		</c:forEach>
	</div>
	
	<!-- 소개글 시작-->
	<div class="content_text">
	<img class="line" src="../img/main/line.png">
	<br><br><br>
		<b>모두의 밥상은 수만가지의 레시피를 종류별, 재료별, 난이도별로 분류하여, <br>각자의 라이프스타일에 맞는 레시피를 쉽고
			편리하게 찾을 수 있는 서비스를 제공하고 있습니다. <br>백주부님 레시피를 하나하나 찾기 힘든 주부님들을 위해,
			배달 음식으로 지갑이 가벼워진 자취생들을 위해! <br>번거로운 재료준비는 줄이고 쉽고 간단한 방법으로 모두의
			밥상이 풍요로워지는 경험을 해보세요!
		</b><img class="logo" src="img/main/logo2.png">
		<img class="line" src="../img/main/line.png">
	</div>
	
	<!-- 카테고리 시작 -->
	<b class="title">카테고리</b>
	<br>
	<div class="category">
		<div id="slideShow">
			<ul class="slides">
				<li>
					<a href="/collection/category?category=category&item=밥/죽&currentPage=1">
						<img src="img/main/c02.jpg"><br>밥/죽
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=반찬&currentPage=1">
						<img src="img/main/c01.jpg"><br>반찬
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=국물&currentPage=1">
						<img src="img/main/국.jpg"><br>국물
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=면&currentPage=1">
						<img src="img/main/c04.jpg"><br>면
				</a> 
				</li>
				<li>
					<a href="/collection/category?category=category&item=디저트&currentPage=1">
						<img src="img/main/c03.jpg"><br>디저트
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=양식&currentPage=1">
						<img src="img/main/양식.jpg"><br>양식
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=일식&currentPage=1">
						<img src="img/main/일식.jpg"><br>일식
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=중식&currentPage=1">
						<img src="img/main/중식.jpg"><br>중식
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=퓨전&currentPage=1">
						<img src="img/main/퓨전.jpg"><br>퓨전
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=떡/만두&currentPage=1">
						<img src="img/main/만두.jpg"><br>떡/만두
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=양념/소스&currentPage=1">
						<img src="img/main/소스.jpg"><br>양념/소스
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=샐러드&currentPage=1">
						<img src="img/main/샐러드.jpg"><br>샐러드
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=음료&currentPage=1">
						<img src="img/main/음료.jpg"><br>음료
					</a>
				</li>
				<li>
					<a href="/collection/category?category=category&item=기타&currentPage=1">
						<img src="img/main/기타.jpg"><br>기타
					</a>
				</li>
				<!-- 안쓰는 li -->
				<li>
					<a href="/collection/category?category=category&item=기타&currentPage=1">
						<img src="img/main/기타.jpg"><br>기타
					</a>
				</li>
			</ul>		
		</div>   
		<p class="controller">
			<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
			<span class="prev">&lang;</span> <span class="next">&rang;</span>
		</p>
	</div>
</div>
</body>
</html>
