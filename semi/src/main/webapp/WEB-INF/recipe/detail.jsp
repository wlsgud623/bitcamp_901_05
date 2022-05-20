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
<link rel="stylesheet" href="/css/detail.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<style type="text/css">
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    	font-family: 'BinggraeMelona-Bold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BinggraeMelona-Bold.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
	
	@font-face {
    	font-family: 'BinggraeMelona';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BinggraeMelona.woff') format('woff');
    	font-weight: normal;
   		font-style: normal;
	}	

	body {
		height: 100%;
	}
	
	ul {
		list-style: none;
	}
	
	div {
		max-width: 100%;
	}
	
	img{
		max-width: 100%;
	}
			
	#content{
		padding-top: 50px;
		padding-bottom: 50px;
		padding-left: 100px;
		padding-right: 100px;
		border: 2px solid #ff001d;
		margin-left: 300px;
		margin-right: 300px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#main_area {
		font-family : 'BinggraeMelona-Bold';
		text-align: center;
		
	}
	
	#subject_area {
		display: grid;
		grid-template-columns: 2fr 1fr 1fr 1fr;
	}
	
	#name_section h1{
		font-size: 45px;
		font-family: 'BinggraeMelona-Bold';
		margin: 50px;	
	}
	
	#star_section {
		align-content : center;
		align-items : center;
		justify-content: center;
	}	
	
	.star-rating {
  		display:flex;
  		flex-direction: row-reverse;
  		font-size:1.5em;
  		justify-content:space-around;
  		padding:0 .2em;
  		width:5em;
  		border: 1px solid black;
	}

	.star-rating input {
  		display:none;
	}

	.star-rating label {
  		color:#ccc;
  		cursor:pointer;
	}

	.star-rating :checked ~ label {
  		color:#f90;
	}

	.star-rating label:hover,
	.star-rating label:hover ~ label {
  		color:#fc0;
	}
	
	#scrap_button {
		margin-right: 50px;
	}
	
	#image_area{
		margin-top: 50px;
	}
	
	#tag_area {
		display : flex;
		margin-top: 45px;
    	margin-bottom: 40px;
    	justify-content: center;
	}
	
	#tag_area b{
		font-size: 20px;
		font-weight: bold;
	}
	
	#tag_area li {
    	display: inline-block;
    	margin: 5px 2px;
    	min-height: 40px;
	}
	
	#tag_area li a {
    	font-size: 20px;
    	line-height: 25px;
    	color: #777777;
    	padding: 5px 20px 7px;
    	border: 1px solid #c1c1c1;
    	background: #fff;
    	border-radius: 50px;
    	text-decoration: none;
	}
	
	#tag_area li a:hover{
		background: #f64646; 
		color: #fff;
		border:1px solid #f64646;
	}
		
	#explain_area {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(20%, 40%));
		row-gap : 50px;
		column-gap : 200px;
		justify-content: center;
		margin-bottom: 40px;
	}
	
	#ingredient_area {
		display : flex;
		font-size: 20px;
		color : #fff;
		background: #bf132b;
		position: relative;
		padding-left: 50px;
		padding-top: 20px;
	}
	
	#ingredient_area:before{
		position: absolute; 
		left:10px; top:-5px; 
		width:28px; 
		height: 39px; 
		display: block; 
		content: ''; 
		background:url('/image/stats_i.png')no-repeat;
	}
	
	#level_area {
		font-size: 20px;
		color : #fff;
		background: #bf132b;
		position: relative;
		padding-left: 50px;
		padding-right : 50px;
		padding-top: 20px;
	}
	
	#level_area:before{
		position: absolute; 
		left:10px; top:-5px; 
		width:28px; 
		height: 39px; 
		display: block; 
		content: ''; 
		background:url('/image/stats_i.png')no-repeat; 
	}
	
	#level_section {
		display: flex;
	}
	
	#portion_section { 
		display: flex;
	}
	
	#recipe_area {
		font-family : 'BinggraeMelona';
		border: 1px solid black;
		margin-bottom: 200px;
		padding-left: 55px;
		padding-right: 55px;
		padding-bottom: 30px;		
	}
	
	#recipe_board p {
		font-size: 24px;
	}
	
	.step_section b{
		color: rgb(191, 19, 43);
		
	}
	
	.explain_section {
	}
	
	.image_section {
		
	}
	
	
	.recipebtn { 
		height: 50px;
	}
	
	.recipebtn span{
		font-weight : bold; 
		font-size : 20px;
		height: 50px;
	}
	
	#comment_area {
		font-family : 'BinggraeMelona';
		border: 2px solid #ff001d;
		margin-left: 300px;
		margin-right: 300px;
		margin-top: 50px;
		margin-bottom: 50px;
		padding-top: 50px;
		padding-bottom: 50px;
		padding-left: 100px;
		padding-right: 100px; 
	}
	
	#comment_board {
		background-color: #ccc;
	}
	
</style>
<script type="text/javascript">
$(function(){
	  $(".fancy-button").mousedown(function(){
	    $(this).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(){
	        $(this).removeClass('active');
	    })
	     $(this).addClass("active");
	  });
	});
</script>
</head>
<body>
	<h1> <c:out value="${root}"></c:out> </h1>
	<!-- 레시피 부분 -->
	<div id="content">
		<!-- 레시피 소개 부분 -->
		<div id ="main_area">
			<div id="subject_area">
				<div id="name_section"><h1>비어 캔 치킨</h1></div>
				<div id="id_section"><h3>작성자 ID </h3></div>
				<div id="star_section">
					<div id="rate_section">
						<span class="glyphicon glyphicon-star"></span>
					</div>
					<div class="star-rating">
						<input type="radio" id="5-stars" name="rating" value="5" />
  						<label for="5-stars" class="star">&#9733;</label>
  						<input type="radio" id="4-stars" name="rating" value="4" />
  						<label for="4-stars" class="star">&#9733;</label>
  						<input type="radio" id="3-stars" name="rating" value="3" />
  						<label for="3-stars" class="star">&#9733;</label>
  						<input type="radio" id="2-stars" name="rating" value="2" />
  						<label for="2-stars" class="star">&#9733;</label>
  						<input type="radio" id="1-star" name="rating" value="1" />
  						<label for="1-star" class="star">&#9733;</label>
					</div>
					<div>
						<button type="button">평점 주기</button>
					</div>
				</div>
				<div>
					<button id="scrap_button" type="button"><span class="glyphicon glyphicon-heart"></span>찜하기</button>
				</div>
			</div>
			<hr>
			<div id="tag_area">
				<b>태그</b>
				<ul>
					<li><a href="">#비어</a></li>
					<li><a href="">#치킨</a></li>
				</ul>
			</div>
			<div id="image_area">
				<img src="/image/chicken.jpg" id="main_photo">
			</div>
			<div id="explain_area">
				<div id="ingredient_area">
					<div>
						<h2>재료</h2>
					</div>
					<div>
					
					</div>
				</div>
				<div id="level_area">
					<div id="level_section">
						<h2>분량</h2>
					</div>
					<hr>
					
					<div id="portion_section">
						<h2>난이도</h2>
					</div>
				</div>
			</div>
		</div>
		
		<hr>
		<!-- 레시피 설명 부분  -->
		<div id="recipe_area">
			<div id="recipe_board">
				<h3>조리순서</h3>
				<p class="step_section"><br><b>Step 1</b></p>
				<p class="explain_section">닭을 제외한 모든 재료를 다 섞고, 살짝만 가열해 소금과 설탕을 녹인 후 식힌다.<br><br></p>
				<p class="image_section"><img src="/image/305_1.jpg"></p>
				<p class="step_section"><br><b>Step 2</b></p>
				<p class="explain_section">식힌 용액에 닭을 30분간 담가 염지한다.<br><br></p>
				<p class="image_section"><img src="/image/305_1.jpg"></p>
				<p class="step_section"><br><b>Step 3</b></p>
				<p class="explain_section">가열한 후라이팬에 기름을 두르고 염지한 닭을 2분간 굽는다.<br><br></p>
				<p class="image_section"><img src=""></p>
				<p class="step_section"><br><b>Step 4</b></p>
				<p class="explain_section">180도 오븐에서 20~25분간 구워 완성한다.<br><br></p>
				<p class="image_section"><img src="/image/305_1.jpg"></p>			
			</div>
			<div id="complete_photos">
				
			</div>
		</div>
		<div class="fancy-button">
  				<div class="left-frills frills"></div>
  				<div class="button">추천!</div>
  				<div class="right-frills frills"></div>
		</div>
		<div class="btn-group btn-group-justified">
    			<a href="#" class="btn btn-danger recipebtn"><span>목록</span></a>
    			<a href="#" class="btn btn-danger recipebtn"><span>수정</span></a>
    			<a href="#" class="btn btn-danger recipebtn"><span>삭제</span></a>
  		</div>
	</div>
		<div id="comment_area">
			<c:set var="comment_number" value="6"/>
			<h3><span class="glyphicon glyphicon-comment"></span> 댓글 (${comment_number })</h3>
			<hr>
			<div class="comment_board">
				
			</div>
		
		</div>
</body>
</html>