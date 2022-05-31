<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Song+Myung&display=swap" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="css" href="css.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>모두의 밥상</title>
   <script type="text/javascript"></script>


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
	
	padding: 0px;
	list-style: none;
	font-family: 'Gowun Dodum'; 
	color : black;
}

.heshi > li {
	margin-top: -80px;
	
}

.heshi > li > a {
float: right;
	/* margin-top: -80px; */
	 top: 50px;
	/*font-size: 20px;
	left: 86%;
	cursor: pointer; */
	
	text-decoration: none;
 	color: black;
}

.s_value{
	font-size: 20px;

	
}

/*  .search {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}  */

*{
    
 	padding: 0;
 	list-style-type: none;
 	letter-spacing : 0.2em;
 	
 	}
    
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
	 font-size: 2px;
 	 
 }
 
 .sub_sub{
	 float: left;
	 width: 150px;
	 height: 48px;
	 margin-left: 150px;
	 margin-top: 5px;
	 background-color:  #c12231; 
	 /* position: relative; */
	 font-size: 1.5rem; 
	 text-align: center;

 }
 
    ul.menu li a:hover{
     background-color: white;
     color: black;
 }
    ul.menu li ul.sub{
   
 }
    ul.menu{
    margin-top:10px;
     zoom: 1;
 }
    ul.menu:after{
   	 height: 0;
	 visibility: hidden;
	 content: ".";
	 display: block;
	 clear: both;
 }


 .hider{
	display: none;
 }
 

 .side_item a{
	font-weight:bold;
 	font-size: 1.5rem;
 	margin-right: 10px;
 	word-spacing : 6rem;
 	text-decoration: none;
 	float: left;

    line-height: 25px;
    color: #777777;
  
    border: 1px solid #c1c1c1;
    	
    border-radius: 50px;
    	
	}
 .side_item a:hover{
	background: #c12231; 
	color: #fff;
	border:1px solid #c12231;
	}
 	
 }
 
.dropdown-item >li > a{ 
	text-align: center;
}
 
.dropdown-item:hover{
	background-color: #E0E0E0; 
}
 

.dropdown-item{
font-weight: bold;
float: left;
}


a:link {
  color : black;
  text-decoration: none;
}

a:hover {
  color : black;
  text-decoration: underline;
}
a:active {
  color : black;
  text-decoration: none;
}

.dropdown-menu{
margin-top: 10px;
box-shadow: 2px 2px 2px 2px gray;
}

.nav-link
{
	margin-top: -1px;
}

.nav-link:hover{
	text-decoration: none;
}



.list_icon{
	color: white;
	text-decoration: none;
	font-size: 20px;s
	
}

.list_icon:hover{
	color: white;
	text-decoration: none;
	font-size: 20px;
	height: 18px;
	cursor: pointer;
}


</style>
<script type="text/javascript">

$(function () {
	
	$(".search").click(function () {
		var val= $("#s_value").val();
		
		if(val != ""){
			var push = $("#s_value").val();
			location.href='${root}/search?research='+push;
		}else{
			alert("검색어를 입력해주세요!");
		}
		
	});




    //서브메뉴 숨기기
    var li=$(".dropdown-item").next();
    while(li.length!=0){
    	li.addClass("hider");
    	li=li.next();
    }
    
    $(".dropdown-item").mouseover(function () {
    	$(this).siblings().removeClass("hider");
    	$(this).parent().siblings().eq(0).children().eq(0).siblings().addClass("hider");
    	$(this).parent().siblings().eq(1).children().eq(0).siblings().addClass("hider");
    	
	});
    
    
  
});
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/> <!-- 절//대경로... -->
<body>
<br><br>
<div class="container">


		
		<!-- 헤더 -->
		<div class="searchbar"  style="text-align: center;  width: 1170px; margin-bottom: 50px; margin-top: 50px;">
		<img alt="logo" src="../img/logo.png" style="width:200px; float: left; margin-right: -100px; margin-top: -30px; ">
			<input type="text"  id="s_value" maxlength="20" placeholder="검색어를 입력해주세요." style="width: 700px;height: 70px;border-radius: 50px; border: 2px solid gray; text-align: center;">&nbsp;&nbsp;&nbsp;
			<button type="button" class="search" style="border-style: none; 
			background-color:transparent;"><b class="glyphicon glyphicon-search " style="font-size: 30px; margin-left: -150px;'"></b> </button>
		
		
			<ul class="heshi" >
				<li>
				<a onclick="href='/search?research=면'"># 라면 # 냉면</a> <br><br>
				<a onclick="href='/search?research=김치'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# 김치찌개</a>
			</li>
			</ul>
			<br><br>
				
		</div> 
		</div>
		
		<nav class="navbar navbar-expand-sm" style="background-color: #c12231;">

       
        
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
            <ul class="navbar-nav navbar-dark">
                <li class="nav-item dropdown" style="padding-right: 25px;">
                    <!-- 드롭다운 메뉴-->
                    <a class="list_icon glyphicon glyphicon-align-justify" data-toggle="dropdown" style=" font-weight: bold; position: relative; left: 700%;" ></a>
                    <div class="dropdown-menu" >                 
                        <ul class="side_item" style="width: 1650px;">               
                       		 <li class="dropdown-item" style="font-size: 2rem; color: gray;">종류</li>

                                 <li><a href="/search?research=밥/죽">#밥/죽</a></li>
                                 <li><a href="/search?research=반찬">#반찬</a></li>
                                 <li><a href="/search?research=국물">#국물</a></li>
                                 <li><a href="/search?research=면">#면</a></li>
                                 <li><a href="/search?research=디저트">#디저트</a></li>
                                 <li><a href="/search?research=양식">#양식</a></li>
                                 <li><a href="/search?research=일식">#일식</a></li>
                                 <li><a href="/search?research=중식">#중식</a></li> 
                                 <li><a href="/search?research=퓨전">#퓨전</a></li>
                                 <li><a href="/search?research=떡/만두">#떡/만두</a></li>
                                 <li><a href="/search?research=빵/과자">#빵/과자</a></li>
                                 <li><a href="/search?research=양념/소스">#양념/소스</a></li>
                                 <li><a href="/search?research=샐러드">#샐러드</a></li>
                                 <li><a href="/search?research=음료">#음료</a></li>
                                 <li><a href="/search?research=기타">#기타</a></li>
                               

								
							</ul>
							
							 <ul class="side_item" style="width: 1650px;">
							 <li class="dropdown-item" style="font-size: 2rem; color: gray;">재료</li>
			                 
                         
                     			 <li><a href="/search?research=소고기">#소고기</a></li>
                                 <li><a href="/search?research=돼지고기">#돼지고기</a></li>
                                 <li><a href="/search?research=닭고기">#닭고기</a></li>
                                 <li><a href="/search?research=육류">#육류</a></li>
                                 <li><a href="/search?research=해물">#해물</a></li>
                                 <li><a href="/search?research=채소류/버섯">#채소류/버섯</a></li>
                                 <li><a href="/search?research=계란/유제품">#계란/유제품</a></li>
                                 <li><a href="/search?research=쌀">#쌀</a></li>
                                 <li><a href="/search?research=밀가루">#밀가루</a></li>
                                 <li><a href="/search?research=콩/견과류">#콩/견과류</a></li>
                                 <li><a href="/search?research=기타">#기타</a></li>
                        
                       		 

								
							</ul>
							
							 <ul class="side_item" style="width: 1650px;">
                        
                       		 <li class="dropdown-item" style="font-size: 2rem; color: gray;">방법</li>
			                  
		                         <li><a href="/search?research=구이">#구이</a></li>
		                         <li><a href="/search?research=찜">#찜</a></li>
                     			 <li><a href="/search?research=끓임">#끓임</a></li>
                                 <li><a href="/search?research=볶음">#볶음</a></li>
                                 <li><a href="/search?research=튀김">#튀김</a></li>
 								 <li><a href="/search?research=조림">#조림</a></li>
                                 <li><a href="/search?research=부침">#부침</a></li>
								 <li><a href="/search?research=무침">#무침</a></li>
                                 <li><a href="/search?research=비빔">#비빔</a></li>
                                 <li><a href="/search?research=삶음">#삶기</a></li>
							 	 <li><a href="/search?research=회">#회</a></li>
							 	 <li><a href="/search?research=절임">#절임</a></li>
							     <li><a href="/search?research=데치기">#데치기</a></li>
                                 <li><a href="/search?research=기타">#기타</a></li>

							</ul>
			             
                        
                        <!--  <a class="dropdown-item" href="#">재료</a>
                        <a class="dropdown-item" href="#">방법ㄹㄹ</a>-->
                      
                      
                      </div>
                      
                    
			     <p style=clear:both;></p>
                
                <li class="nav-item" style="color: white  ; font-size: 1.7rem; ">
                    <a class="nav-link" href="ranking/ranking"  style="position: absolute; color:white; left: 20%;">랭킹</a>
                </li>
 		
                <li class="nav-item" style="color: white; float: right; font-size: 1.7rem;">
                    <a class="nav-link" href="member/signup" style="position: absolute; color:white; right: 10%;">회원가입</a>
                </li>
                <li class="nav-item" style="color: white; float: right; font-size: 1.7rem;">
                    <a class="nav-link " href="/login" style="position: absolute; color:white; right: 20%;">로그인</a>
                </li>
           
            </ul>  
          
        </div>
    </nav>

				
		

</body>
</html>

	
	