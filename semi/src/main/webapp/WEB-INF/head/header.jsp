<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
		
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta charset="UTF-8">
<title>모두의 밥상</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
   <script type="text/javascript">
         $(function(){
	     $("ul.sub").hide();
		 $("ul.menu li").hover(function(){
		    $("ul:not(:animated)",this).slideDown("fast");
			},
			function(){
			   $("ul",this).slideUp("fast");
			});
      });	
   </script>

<style>
s .page-header{
	top: 0;
	left: 0;
	right: 0;
	width: 100%;s
	height: 300px;
	min-width : 960px;
	box-shadow:0 1px 1px rgba(0,0,0,0.25);
 	/*아래 택스트와 공백없애기*/
	
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

*{
    margin: 0;
 	padding: 0;
 	list-style-type: none;}
    
#container{
	margin-top:30px;
    background-color: #FF3232;
    height: 50px;
 }
 
 ul.menu{
  		width: 1320px;
  		text-align: center;
  		margin-left: auto;
  		margin-right: auto;
  }
  
ul.menu li{ 
    float: left;
	 width: 150px;
	 height: 48px;
	 background-color: #FF3232; 
	 position: relative;
	 font-size: 40px; 
	 text-align: center;
 }
 
 .li{ 
    float: left;
 width: 150px;
 height: 48px;
 background-color:  #FF3232; 
 position: relative;
 font-size: 40px; 
 text-align: center;
 }
 
    ul.menu li a{
    display: block;
 width: 100%;
 height: 100%;
 line-height: 48px;
 /* text-indent: 30px; */
 font-weight: bold;
 color: #eee;
 text-decoration: none;	
 font-size: 20px;
 	 
 }
 
 .sub_sub{
 float: left;
 width: 150px;
 height: 48px;
 margin-left: 150px;
 margin-top: 0px;
 background-color:  #EB0000; 
 /* position: relative; */
 font-size: 40px; 
 text-align: center;

 }
 
    ul.menu li a:hover{
    background-color: white;
    color: black;
 }
    ul.menu li ul.sub{
    position: absolute;
 }
    ul.menu{
    zoom: 1;
 }
    ul.menu:after{
    height: 0;
 visibility: hidden;
 content: ".";
 display: block;
 clear: both;
 }

</style>


<br><br>

		<!-- 로고 -->
	<header class="page-header" role="banner"> <!-- screenreader:시각장애인을 위한 읽어주는코드 -->
<!-- 		<img alt="logo" src="../img/logo.png"> -->
		
		
		<!-- 검색창 -->
		<div class="search" style="width: 1500px;">
		<img alt="logo" src="../img/logo.png" style="width:150px; position: absolute; top:70px; left: 200px;" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="s_value" id="s_value" maxlength="20" placeholder="검색어를 입력해주세요." style="width: 600px;height: 70px;border-radius: 50px; border: 2px solid gray; text-align: center;">&nbsp;&nbsp;&nbsp;
			<button type="button" style="border-style: none; background-color:white;"><b class="glyphicon glyphicon-search" style="width: 70px; height: 70px;"></b> </button>
	
		
		<!-- 해쉬테그 -->
		<div class="heshi" style="color: black; font-weight: bold; position: absolute;right: 15%; top:95px;">
			<ul>
				<li>
				<a href="#" onclick="document.topfrm.s_value.value='라면';document.topfrm.submit();"># 라면 # 냉면</a><br>
				<a href="#" onclick="document.topfrm.s_value.value='김치찌개';document.topfrm.submit();"># 김치찌개</a>
			</li>
			</ul>
			<br><br>
			</div>		
		</div>
			 
<div id="container">
   <ul class="menu" >
       <li class="li" style="border-right: 3px solid white; padding-top: 5px;"><a href="#"><span class="glyphicon glyphicon-list" style="font-size: 30px;"></span></a>
	     <ul class="sub">
		    <li><a href="#">종류</a>
				<ul class="sub_sub">
				    <li class="li"><a href="#">전체메뉴</a></li>
					<li><a href="#">신메뉴</a></li>
					<li><a href="#">양념치킨</a></li>
					<li><a href="#">후라이드치킨</a></li>
				</ul>
		    </li>
			<li><a href="#">재료</a>
			<ul class="sub_sub">
				    <li class="li"><a href="#">전체메뉴</a></li>
					<li><a href="#">신메뉴</a></li>
					<li><a href="#">양념치킨</a></li>
					<li><a href="#">후라이드치킨</a></li>
				</ul>
			</li>
			<li><a href="#">조리법</a></li>
			<li><a href="#">난이도</a></li>
		 </ul>
		 </li>
	    <li><a href="#">랭킹</a>
	    
		</li>
		<li style="float: right;"><a href="#">회원가입</a>
	    
		</li>
		<li style="float: right;"><a href="#">로그인</a>
	    
		</li>
		
   </ul>
   </div>
			



			
	</header>
		
		
		
	
			
			
			
			
			
			
			
			
			
			
	
	
<script type="text/javascript">
	//var win = $(window);
	//$(".header:last").text("scrollTop:" + win.scrollTop() ); /*text형식으로 (윈도우스크롤양)안에 있는걸 header마지막에 뿌린다*/

	
</script>


	</div></html>
	
	