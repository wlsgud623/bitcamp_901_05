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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		font-family : 'BinggraeMelona-Bold';
		height: 100%;
	}
	p {
	line-height: 26px; 
	color: #666; 	
	width:90%;
	}
	#content{
		background-color: #f64646;
		padding-top: 50px;
		padding-bottom: 50px;
		padding-left: 200px;
		padding-right: 200px;
	}
	
	.main_area {
		font-family : 'BinggraeMelona-Bold';
		border: 1px solid black;	
		background-color: white;
		margin-bottom: 200px;
		
	}
	
	#scrap_button {
		float: right;
	}
	.recipe_area {
		font-family : 'BinggraeMelona';
		border: 1px solid black;
		background-color: white;
		margin-bottom: 200px;	
	}
	
	.comment_area {
		font-family : 'BinggraeMelona';
		border: 1px solid black;
		background-color: white;	
	}
	
</style>
</head>
<body>
	<div id="content">
		<div class="main_area">
			<div class="subject_area">
				<h1 id="food_name">요리 제목</h1>
				<button id="scrap_button"><span class="glyphicon glyphicon-heart"></span>찜하기</button>
			</div>
			<div class="tag_area">
				TAGS
			</div>
			<p>-</p>
			<img src="" id="main_photo">
			<div class="explain_area">
				<div class="ingredient_area">
				
				</div>
				<div></div>
			</div>
		</div>
		<div class="recipe_area">
			<h3>만드는 방법</h3>
			<div class="recipe_board">
			
			</div>
		
		</div>
		<div class="comment_area">
			<div class="comment_board">
				<h4>댓글 <span class="glyphicon glyphicon-comment"></span> </h4>
			</div>
		
		</div>
	</div>
</body>
</html>