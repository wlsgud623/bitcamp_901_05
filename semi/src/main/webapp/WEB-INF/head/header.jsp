<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta charset="UTF-8">
<title>모두의 밥상</title>


<style>
.page-header{
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 300px;
	min-width : 960px;
	box-shadow:0 1px 1px rgba(0,0,0,0.25);
	position: absolute; /*아래 택스트와 공백없애기*/
	
}
.page-header.sticky{
	position: fixed; top: 0;
/*스크롤양이 많아져 sticky class가 붙엇을때의위치*/
}

body * {
	font-size: 15px;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.heshi {

	position: absolute;
	font-size: 20px;
	right: 80%;
	height: 3px;
	float: right;
}

.s_value{
	font-size: 20px;

	
}

.search {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

body {
	background: #424242;
	margin: 50px 0;
}
#menubar {
	width: 100%; height: 80px; background-color: red;
}
#menubar-menus {
	width: 1000px;
	margin: 0 auto;
	list-style: none;
	padding: 0;
	text-align: center;
	font-size: 0;
	display: table;
}
#menubar-menus li {
	display: table-cell;
	color: white;
	height: 80px;
	padding: 0 20px;
	margin: 0;
	font-size: 20px; 
	vertical-align: middle;
}
#menubar-menus li div {
	position: absolute;
	width: 100%;
	
	color: red;
	left: 0;
	bottom: 40px;
	display: none;
	padding: 50px 0;
}

</style>
</head>
<script type="text/javascript">
function () {
	var wind = $(window),
	header = $('.page-header'),
	headerOffsetTop = header.offset().top;
	
	wind.scroll(function () {
		if(this.scrollTop() >= headerOffsetTop){ 
			header.addClass('sticky');
		}else{
			header.removeClass('sticky');
		}
	});
</script>

<script type="text/javascript">
	$(function() {
		var menubarTop = $("#menubar").position().top;
		var height = $("#menubar").height();
		var subMenuTop = menubarTop + height;

		$("#menubar-menus li").click(function(event) {
			
			$(this).find("#menu").css("top", subMenuTop).slideDown();
		
			});
		});

		

</script>
<body>
<div class="high">
		<!-- 로고 -->
	<header class="page-header" role="banner"> <!-- screenreader:시각장애인을 위한 읽어주는코드 -->
		<img alt="logo" src="../img/logo.png" style="padding-left: 5%;">
		
		
		<!-- 검색창 -->
		<div class="search">
			<input type="text" name="s_value" id="s_value" value="검색어를 입력해주세요"
						maxlength="30" placeholder="" title=&nbsp;"검색어를 입력해주세요."
						style="width: 600px;height: 50px;border-radius: 50px; border: 2px solid gray;">&nbsp;&nbsp;&nbsp;
			<img src="../img/se.png" style="width: 45px; height: 45px;"></img>
		</div>
		
		<!-- 해쉬테그 -->
		<div class="heshi" style="color: black; font-weight: bold; position: absolute;right: 5%; top: 40px;">
			<ul>
				<li>
				<a href="#"
					onclick="document.topfrm.s_value.value='라면';document.topfrm.submit();">#라면</a>
				</li><br> 
				<li>
				<a href="#"
					onclick="document.topfrm.s_value.value='김치찌개';document.topfrm.submit();">#김치찌개</a>
				</li><br>
				 <li><a href="#"
					 onclick="document.topfrm.s_value.value='오뎅탕';document.topfrm.submit();">#오뎅탕</a>
				</li>
			</ul>
			<br><br>
			</div>
		
		<!-- manu -->
		
			<br>
			<hr>
			<div id="menubar">
				<ul id="menubar-menus" style="font-size:3em; font-weight: bold; ">
					<li><a href="#" >종류
						<div id="menu">
								<ul style=" width: 200px; height: 200px;">
									<li><a href="#">#재료</a></li><br>
									<li><a href="#">#조리법</a></li><br>
									<li><a href="#">#난이도</a></li><br>
									<li><a href="#">#검색</a></li><br>
								</ul>
						</div>
					</li>
				
					<li><a href="#">랭킹</a></li>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<li class="login"><a href="#"><c:if test="${sessionScope.loginok == null}">
						<button type="button" class="btn btn-success" 
						onclick="location.href='${root}/login/login'">로그인</button>
					</c:if>
					
					<c:if test="${sessionScope.loginok != null}">
						<b>${sessionScope.loginid}(${sessionScope.loginname}) 님</b>
						&nbsp;
						<button type="button" class="btn btn-success" 
						onclick="logout()">로그아웃</button>
					</c:if></a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>		
			
			
			
			
			
			</script>
			



			
	</header>
		
		
		
	
			
			
			
			
			
			
			
			
			
			
	
	
<script type="text/javascript">
	//var win = $(window);
	//$(".header:last").text("scrollTop:" + win.scrollTop() ); /*text형식으로 (윈도우스크롤양)안에 있는걸 header마지막에 뿌린다*/

	
</script>
</body>
</html>