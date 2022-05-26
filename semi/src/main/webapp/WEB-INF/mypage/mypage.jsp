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



</head>
<style>

	
	*{
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	  margin-bottom: 100%;
	  
	
	}
	
	li{
	  list-style-type: none;
	}

	
	label.inputPhoto{
		font-family: 'Cafe24SsurroundAir';
		text-align: center;
		width: 800px;
		height: 450px;
		cursor: pointer;
	}
	img.inputPhoto{
		width: 800px;
		height: 450px;
		object-fit: cover;
		margin-bottom: -250px;
		opacity: 0.5;
	}
	


/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow{
  width: 1500px;
  height: 300px;
  position: relative;
  margin: 50px auto;
  overflow: hidden;    
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}

#slideShow_two{
  width: 1500px;
  height: 300px;
  position: relative;
  margin: 50px auto;
  overflow: hidden;    
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}


.slides{

  left: 0;
  top: 0;
  width: 9000px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

.slides_two{
  position: absolute;
  left: 0;
  top: 0;
  width: 9000px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child{
  margin-left: 100px;
}

.slides_two li:first-child{
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

.slides_two li:not(:last-child){
  float: left;
  margin-right: 100px;
}

.slides_two li{
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

.controller_two span{
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

.controller_two span:hover{
  background-color: rgba(128, 128, 128, 0.11);
}


.prev{
  left: 10px;
}

.prev_two{
  left: 10px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover{
  transform: translateX(-10px);
}

.prev_two:hover{
  transform: translateX(-10px);
}

.next{
  right: 10px;
}

.next_two{
  right: 10px;
}

.next_two:hover{
  right: 10px;
}

.next:hover{
  transform: translateX(10px);
}

.person{
	text-align: center;
}
.hh3{
	padding-left: 30%;
}
</style>


<script type="text/javascript">

$(function() {
	//사진
	$("#inputPhoto").change(function() {
		img_preview("#inputPhoto", 800, 450);
	});



	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = slideImg.length; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	const slideWidth = 1800; //한개의 슬라이드 넓이
	const slideMargin = 40; //슬라이드간의 margin 값

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

<script type="text/javascript">

$(function() {
	const slides_two = document.querySelector('.slides_two'); //전체 슬라이드 컨테이너
	const slideImg_t = document.querySelectorAll('.slides_two li'); //모든 슬라이드들
	let currentIdxs = 0; //현재 슬라이드 index
	const slideCounts = slideImg_t.length; // 슬라이드 개수
	const prev_two = document.querySelector('.prev_two'); //이전 버튼
	const next_two = document.querySelector('.next_two'); //다음 버튼
	const slideWidths = 1800; 
	const slideMargins = 40; //슬라이드간의 margin 값

	//전체 슬라이드 컨테이너 넓이 설정
	slides_two.style.width = (slideWidths + slideMargins) * slideCounts + 'px';

	function moveSlide(num) {
	  slides_two.style.left = -num * 400 + 'px';
	  currentIdxs = num;
	}

	prev_two.addEventListener('click', function () {
	  if (currentIdxs !== 0) moveSlide(currentIdxs - 1);
	});

	next_two.addEventListener('click', function () {
	  if (currentIdxs !== slideCounts - 1) {
	    moveSlide(currentIdxs + 1);
	  }
	});
	});	

	</script>



<body>

<div class="bodyer" style="text-align: center; height: 100%; widows: 100%;" >
<br>
	<div class="container" id="container" style=" text-align: center; width: 1200px; height:1000px;
		background-color: white;">
			<div class="member"  >
			   <h1>MY PAGE</h1>
			   <h3  >본인 수정</h3>
				 <form action="insert" method="post" class="form-inline">
			   		<table class="men" >
						<tr style="text-align: center;">
							<td style=" text-align: center;">
								<label for="inputPhoto" style="text-align: center; 
									cursor: pointer;">
										<br><br>
										<img src="../image/per__son.png" >
									</label>
								    <input type="image" id="inputPhoto" name="upload_main" accept=".jpg, .jpeg, .png"
								    style="opacity: 0; font-size: 0px;" class="form-control">
							</td>
						</tr>
					
						<tr>
			   				<th style="width: 100px;" >이 름</th>
			   				<td>
			   					<input type="text" name="name" style="width: 250px; " class="form-control"
			   					 value="${dto.name}" disabled="disabled">
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">아이디</th>
			   				<td>
			   					<input type="text" name="userid" id="userid" class="form-control"
			   					 value="${dto.userid}"  disabled="disabled" style="width: 250px;">
			   				
			   				</td>
			   			</tr>
			   			
			   			<tr>
			   				<th style="width: 130px;">핸드폰</th>
			   				<td>
			   					<input type="text" name="hp" class="form-control"
			   					required="required" value="${dto.hp}" style="width: 250px;">
			   				</td>
			   			</tr>

			   			  
			   			<tr>
			   				<th style="width: 130px;">이메일</th>
			   				<td>
			   					<input type="text" name="email"  class="form-control"
			   					required="required" style="width: 250px;" value="${dto.email}">
			   					
			   				</td>
			   			</tr>
			   				<tr rowspan="2">
			   				<th style="width: 130px;">주소</th>
			   				<td>
			   					<input type="text" id="address_search" name="address1"class="form-control"
			   					placeholder="주소를 입력해주세요" style="width: 250px;"/>		
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-primary" id="search_btn"
			   					style="width: 100px;">주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span></button>
			   					&nbsp;
							<br><br>
			   					<input type="text" name="address2"  class="form-control
			   					required="required" placeholder="상세주소를 입력하세요" style="width: 250px;" value="${dto.address}">
			   					&nbsp;
			   					<br>
			   				</td>
			   			</tr>
			   			<tr>
			   			<th>본인소개</th>
			   				<td colspan="3" >
			   					
				    			<input name="intro" 
				    			class="form-control" placeholder="본인을 소개해주세요" 
				    			> 
				    			
	    					</td>
	    				</tr>
			   		</table>
					   		<br>
							<button type="submit" class="btn btn-warning" id="revise"
							style="width: 700px; height: 50px;  text-align: center;"
							onclick="location.href='/mypage/updateform?UserID=${userid}'">회원수정하러가기</button>
			   </form>
			 </div>
		</div>
	
<!-- <div class="down" style="position: absolute; top: 80%;"> -->	
	<h3 class="hh3">MY RECIPE</h3>
	<div id="slideShow">
	    <ul class="slides">
	    	<c:forEach var="a" items="${ownrecipeList}">
	    	 <li><img src="../img/main/${a.main_photo}" alt="사진없음" style="width: 350px; height: 300px;"></li>
				
			</c:forEach>
	     
	    </ul>  
	    <p class="controller">
	      
	      
	      <span class="prev">&lang;</span>  
	      <span class="next">&rang;</span>
	    </p>
  </div>
  <h3 class="hh3">SCRAP RECIPE</h3> 
  <div id="slideShow_two">
  <br><br><br>
	    <ul class="slides_two">
	    	<c:forEach var="a" items="${ownrecipeList}">
	    	 <li><img src="../img/main/${a.main_photo}" alt="사진없음" style="width: 350px; height: 300px;"></li>
				
			</c:forEach>
	     
	    </ul>  
	    <p class="controller_two">
	      
	      
	      <span class="prev_two">&lang;</span>  
	      <span class="next_two">&rang;</span>
	    </p>
  </div>
 		
	</div>

	</body>

</html>