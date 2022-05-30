<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>모두의 밥상</title>

<style>
s .page-header{
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
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
	line-height: 1.5;
	letter-spacing:0;
	-webkit-text-size-adjust: none;
	
    font-family: 'OTTOGISans', 'Malgun Gothic', '맑은 고딕', "돋움", sans-serif;
    font-size: 16px;
    font-weight: normal;
   
    color: #777;
   
   
}


.navbar-default .navbar-nav>li {
    float: left;
    padding: 0 20px;
    position: relative;
    display: inline-block;
}
.navbar-default .navbar-nav>li.dropdown>a {
    width: 100%;
}

.heshi {

	float: right;
	font-size: 20px;
	
	height: 3px;
	
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
 	list-style-type: none;
 	}



.row{
	width: 300px;
}
a{
	float: left;
}

.navbar-nav > li > a {
    padding-top: 10px;
    padding-bottom: 10px;
    line-height: 20px;
}


.navbar-nav{
	width: 100%;
	float: left;
	margin: 0;
	display: table;

}

.dropdown-toggle{
	color: white;
}

.navbar-default .navbar-nav .dropdown-toggle:after {
    top: 20px;
}

ol, ul{
	list-style: none;
}


.navbar-collapse.collapse{
	display: block !important;
	height: auto !important;
	padding-bottom: 0;
	overflow: visible !important;
	visibility: visible !important;

}

.navbar-collapse{
	padding-right: 15px;
	padding-left: 15px;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

ol, ul {
    list-style: none;
}

ul ul ul {
    list-style-type: square;
}

ul ul {
    list-style-type: circle;
}

.mega-dropdown-menu > li > ul > li > a {
    display: block;
    clear: both;
    text-align: right;
    font-size: 17px !important;
    line-height: 32px !important;
    font-weight: 500 !important;
    color: #666 !important;

.js-navbar-collapse > ul > li {
	float:left;
	}
	
	
.navbar-default .navbar-nav>li a {
    line-height: 68px;
    font-weight: bold;
    color: #454545;
    font-size: 20px;
    color: #454545;
    position: relative;
    letter-spacing: -1.5px !important;
    width: 108%;
    min-width: 108%;
}
	
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    -webkit-box-shadow: 0 6px 12px rgb(0 0 0 / 18%);
    box-shadow: 0 6px 12px rgb(0 0 0 / 18%);
}
.menus{
	text-align: left;
}

.teg_menu{
	width: 500px;
	clear: right;
}

.mega-dropdown a {
    position: relative;
}

a {
    text-decoration: none;
    color: #777;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

.mega-dropdown-menu {
    padding: 35px 25px !important;
}

.mega-dropdown-menu > li > ul > li {
    list-style: none;
    padding: 3px 20px;
}

.navbar-nav > li > .dropdown-menu {
    margin-top: 0;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

.navbar-nav>li>.dropdown-menu {
    width: 300px;
    z-index: 13;
}


html, body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
    
    

</style>
  
<script type="text/javascript">

$(function () {
	$(".search").click(function () {
		var push = $("#s_value").val();
		location.href='${root}/search?research='+push;
	});
});	
</script>
<!-- <script type="text/javascript">

$(document).ready(function () {
   
    $("#row > li > ul > li > a").click(function () {
    	  $( '#col02' ).each( function() {
              if ( $( 'li', this ).length > 2 ) {
                $( this ).addClass( 'a' );
              }
            } );
          } );


</script> -->
<c:set var="root" value="<%=request.getContextPath() %>"/> <!-- 절대경로 -->
<body>
<br><br>

	<!-- 로고 -->
	<header class="headerer" role="banner">


		<!-- 검색창 -->
		<div class="searchbar" style="height: 500px; text-align: center;">

			<img alt="logo" src="../img/logo.png">

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="s_value"
				maxlength="20" placeholder="검색어를 입력해주세요."
				style="width: 600px; height: 70px; border-radius: 50px; border: 2px solid gray; text-align: center;">&nbsp;&nbsp;&nbsp;
			<button type="button" class="search"
				style="border-style: none; background-color: white;">
				<b class="glyphicon glyphicon-search "
					style="width: 70px; height: 70px;"></b>
			</button>

				
	<!-- 테그 -->

				<a href="#" onclick="" style="float: right; ">#라면맛집</a><br>

				<a href="#" onclick="" style="position: relative;top: 300px; right: 5%;">#XO만두</a>

		
		
		</div>
	</header>


	<div id="gnb" >
		<!-- navbar -->
	  <div class="navbar navbar-default" style="width: 100%; background-color: red; color: white; text-decoration: none;">
	
	    <!-- .nav-collapse -->
	    <div class="collapse navbar-collapse js-navbar-collapse" style="width: 100%;">
	      <ul class="nav navbar-nav">
	        <li class="dropdown mega-dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white; background-color: red;"><i></i>카테고리</a>
	
	          <ul class="dropdown-menu mega-dropdown-menu row">
			            <li class="col01">
			              <ul>
			                <!--<li class="dropdown-header"><a href="../category/cate_index.asp">카테고리</a></li>-->

			                <li class="kind" style="color: white;" ><a href="">종류</a></li>

			                <li class="ingredient" style="color: white;"><a href="">재료</a></li>

			                <li class="method" style="color: white;"><a href="../category/subCate.asp?s_cate1=11">방법</a></li>

			               

			                
			              </ul>
			            </li>
			            <li class="col02">
			            <div style="display: none; overflow: hidden;">
			              <ul>
			                <!--<li class="dropdown-header"><a href="#">인기 레시피</a></li>-->
						   <li><a href="">#면</a></li>

                                 <li><a href="">#밥/죽/떡</a></li>

                                 <li><a href="">#국</a></li>

                                 <li><a href="">#탕</a></li>

                                 <li><a href="">#밑반찬</a></li>

                                 <li><a href="">#김치/장류</a></li>

                                 <li><a href="">#양식</a></li>

                                 <li><a href="">#퓨전</a></li>

			                
			              </ul>
			              </div>
			            </li>
			           <li class="col03">
			           <div style="display: none; overflow: hidden;">
			              <ul>
			                <!--<li class="dropdown-header"><a href="#">인기 레시피</a></li>-->
						    <li><a href="">#육류</a></li>

                                 <li><a href="">#채소류</a></li>

                                 <li><a href="">#해물류</a></li>

                                 <li><a href="">#가공식품</a></li>

                                 <li><a href="">#쌀</a></li>

                                 <li><a href="">#밀가루</a></li>

                                 <li><a href="">#콩/견과류</a></li>

                                 <li><a href="">#기타</a></li>

			                
			              </ul>
			              </div>
			            </li>
			            
			             <li class="col04">
			             <div style="display: none; overflow: hidden;">
			              <ul>
			                <!--<li class="dropdown-header"><a href="#">인기 레시피</a></li>-->
						   <li><a href="">#면</a></li>

                                  <li><a href="">#끓임</a></li>

                                 <li><a href="">#조림</a></li>

                                 <li><a href="">#볶음</a></li>

                                 <li><a href="">#부침</a></li>

                                 <li><a href="">#구이</a></li>

                                 <li><a href="">#비빔</a></li>

                                 <li><a href="">#삶기</a></li>

                                 <li><a href="">#튀김</a></li>

                                 <li><a href="">#기타</a></li>


			                
			              </ul>
			              </div>
			            </li>
	          </ul>
								
	        </li>
	        <li><a href="/ranking/ranking" style="float: right;">랭&nbsp킹</a></li>
	        <!--<li><a href="../category/videoList.asp">영상 레시피</a></li>-->
	        <li class="after01"><a href="/login/login">로그인</a></li>
	        <!--<li><a href="../category/Chef.asp">셰프의 팁</a></li>-->
	        <li><a href="/member" class="c_red">회원가입</a></li>
	      </ul>
	
	    </div>
	   
	   
	  </div>
		<!-- navbar -->
	</div>
</div>

	




</body>
</html>

	
	