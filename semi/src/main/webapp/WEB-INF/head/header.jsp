<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta charset="UTF-8">
<title>모두의 밥상</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
   <script type="text/javascript">
         $(function(){

      });	
   </script>

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
    background-color: #c12231;
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
	 background-color: #c12231; 
	 position: relative;
	 font-size: 40px; 
	 text-align: center;
 }
 
 .li{ 
    float: left;
 width: 150px;
 height: 48px;
 background-color:  #c12231; 
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
 background-color:  #c12231; 
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
 
 a{
 	float: left;
 }

</style>
<script type="text/javascript">

$(function () {
	
	$(".search").click(function () {
		var push = $("#s_value").val();
		location.href='${root}/search?research='+push;
	});
});

</script>
<c:set var="root" value="<%=request.getContextPath() %>"/> <!-- 절대경로 -->
<body>
<br><br>

		<!-- 로고 -->
	<header class="page-header" role="banner"> </header>
		
		
		<!-- 검색창 -->
		<div class="searchbar" style="width: 1500px;">
			
				<img alt="logo" src="../img/logo.png" style="width:150px; position: absolute; top:70px; left: 200px;" >
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text"  id="s_value" maxlength="20" placeholder="검색어를 입력해주세요." style="width: 600px;height: 70px;border-radius: 50px; border: 2px solid gray; text-align: center;">&nbsp;&nbsp;&nbsp;
			<button type="button" class="search" style="border-style: none; background-color:white;"><b class="glyphicon glyphicon-search " style="width: 70px; height: 70px;"></b> </button>
			
		
		<!-- 테그 -->
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
		
		
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

        <!-- Toggler/collapsibe Button -->
        
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
            <ul class="navbar-nav navbar-dark">
                <li class="nav-item dropdown">
                    <!-- 드롭다운 메뉴-->
                    <a class="navbar-toggler-icon nav-link dropdown-toggle" href="#" data-toggle="dropdown"></a>
                    <div class="dropdown-menu">
                    <ul>
                    <li>
                        <a class="dropdown-item" href="#">종류</a>
                        
                        <ul>
                        
                        <li><a href="">#카레</a></li>
			               <ul>
			               <li><a href="">#마요네스</a></li>
			               <li><a href="">#마요네스</a></li>
			               	
			               
			               </ul> 
			              </ul>               
			            <li><a href="">#마요네스</a></li>
			            <li><a href="">#카레</a></li>
			                			                
			            <li><a href="">#마요네스</a></li>
			            <li><a href="">#카레</a></li>
			                			                
			            <li><a href="">#마요네스</a></li>
                      
                        </ul>  </div>
                        <a class="dropdown-item" href="#">재료</a>
                        <a class="dropdown-item" href="#">방법</a>
                       </li> 
                      </ul>
                      
                      
			      
                    
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">랭킹</a>
                </li>

                <li class="form-inline ml-auto nav-item">
                    <a class="nav-link" href="member/signup">회원가입</a>
                </li>
                <li class="form-inline ml-auto nav-item">
                    <a class="nav-link " href="/login/login">로그인</a>
                </li>
            </ul>
          
        </div>
    </nav>

				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		



		
		
	
			
			
			
			
			
			
			
			
			
			
	
	

</body>
</html>
	
	