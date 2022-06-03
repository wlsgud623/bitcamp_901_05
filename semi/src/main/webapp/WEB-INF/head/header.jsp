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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
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

#s_value{
   font-size: 25px;
	width: 700px;
	height: 70px;
	border: 2px solid gray;
	padding-left: 75px;
   
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
 
 /* .li{ 
     float: left;
    width: 150px;
    height: 48px;
    background-color:  #c12231; 
    position: relative;
    font-size: 40px; 
    text-align: center;
 } */
 
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
 
  .side_item{
     /* padding-left: 1fd0px; fd*/
  }

  /* 버튼 크기 */
 .side_item a{
/*  background-color: white;
    word-spacing: 5rem;
    border-radius:50px;
    border:1px solid gray;
   padding: 2px 3px;
   box-shadow: 2px 2px 2px gray;
    font-size: 15px;
    margin-right: 10px;
    text-decoration: none;
   
    line-height: 27px;
     box-sizing: border-box;
     padding-bottom: 2px;
     opacity: 100%;
     width: 120px;
   height: 40px;
   text-align: center; */
    
   float: left;
   margin-top: 21px;
   margin-left: 3px;
   padding-left: 4px;
   font-size: 1.5rem;
 
   }
   
   .side_item a:after {
    width: 1px;
    height: 18px;
    background: #c2c2c2;
    display: inline-block;
    content: '';
    margin: 0 20px;
}
   
   
   .side_item li{
   
   
   /* border: 1px solid #c1c1c1fff; */
       
   /*  border-radius: 50px; */
   }
 .side_item a:hover{
    color:red;
    box-shadow: 0 0 0 0 gray;
    text-decoration: none;

  /*  border-radius:50px; */
   background-color: white;
   font-weight: bold;
   
   
   
   }
   
.side_item a:after{
   color: black;
}

.side_item a:visited{
   color: black;
}
    
/* 버튼 감싸는 여백 */
 .side_item li{
    padding-left: 20px;
    padding-right: 50px;
    background-color: #bbb0a500;
    
 }
 
 .side_item li:hover {
    padding-left: 20px;
    padding-right: 50px;
    background-color: #bbb0a500;
    
 }
 

 
 .dropdown-item{
   width:100px;
   border-top: 2px solid white;
   border-bo: 1px solid gray;
   font-size:18px;
   font-weight: bold;
   float: left;
   height: 45px;
   line-height: 45px;
   color: #c12231;
   margin-left: 50px;
  
/*    margin-left: 500px; */
/* color: #c12231; */
   
 }
  
 /* 피치퍼프*/
.dropdown-item:hover{
   background-color: white;
   color: #c12231;
  ;

}

.dropdown-item >li > a{ 
   text-align: center;
   border:  1px solid white;
 /*   border-radius: 50%; */
  /*  box-shadow: 2px 2px 2px gray; */
   background-color: #bbb0a500;
   padding: 10px 10px;
   font-size: 15px;
  

   
   
   
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

/*전체 박스*/
.dropdown-menu{
width: 1520px;
background-color:    #bbb0a500; 
margin-top: 12px;
/* box-shadow: 2px 2px 2px 2px gray; */
margin-left: 50px;
height: 200px;


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
   font-size: 20px;
   height: 18px;
   
}

.list_icon:hover{
   
   
   color: white;
   text-decoration: none;
   font-size: 20px;
   height: 18px;
   cursor: pointer;
}



.loginbtn a:hover{
   text-decoration: none;
   color: white;
}

.loginbtn button{
   border: 0;
   outline: 0;
   text-decoration: none;
   color: white;
   font-size: 1.7rem;
   position: absolute;
   margin-top: -27px;
   margin-left: 70px;
   clear: none;

}

.loginbtn a{
   float: left;
   text-decoration: none;
   color: white;
   font-size: 1.7rem;
   
   margin-top: -19px;
   padding-right: 23px;
   

}

.loginbtn button:hover{
   text-decoration: none;
   color: white;
}




.logoutbtn button{
    color: white;
	font-size: 1,7rem;
    text-decoration: none;
	position: absolute;
	margin-top: -5px;

   
}


.logoutbtn button:hover{
	border: 0;
   outline: 0;
	
   border: 2px solid #c12231;
   text-decoration: none;
   color: white;

   
}

.logoutbtn b{
   color: white;
   font-size: 1.5rem;
   position: relative;
   top: 1px;
   margin-top: -29px;
   right: 150px;
}

/*.page{
 position: absolute;
 font-size: 1.7rem;
 right: 30px;
}*/

/*.menupoint{
	position: absolute;
	font-size: 1.7rem;
	left: 250px;
}*/

#searchAuto{
	width: 700px;
	height: 10px;
	display: block;
	z-index: 10;
	position: relative;
	left: 23.3%;
}
#searchAuto li{
	list-style: none;
	background-color:white;
	opacity: 90%;
	border-left: 1px solid gray;
	border-right: 1px solid gray;
	text-align: left;
	height: 35px;
	line-height: 35px;
}
#searchAuto li a{
	text-decoration: none;
	color: black;
	margin-left: 25px;
	font-size: 17px;
}
#searchAuto li a:hover{
	text-decoration: none;
	color: black;
}
#searchAuto li:hover{
	background-color: #e9ecef;
}
.searchIcon{
	width: 20px;
	margin-left: 25px;
	padding-bottom: 5px;
}
#searchAuto li:last-child{
	border-bottom: 1px solid gray;
}
</style>
<c:set var="root" value="<%=request.getContextPath() %>"/> <!-- 절//대경로... -->
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
    
    
   
    //검색어 추천 리스트
    $("#s_value").keyup(function() {
		$("#searchAuto").css("visibility", "visible");
		var s="";
		$.ajax({
			type:"get",
			dataType:"json",
			data:{"searchWord":$("#s_value").val()},
			url:"${root}/searchauto",
			success:function(data) {
				if(data.length>=1 && $("#s_value").val()!=""){
					data.forEach(function(i) {
						s+="<li><img src='../img/search-icon.jpg' class='searchIcon'>"
							+"<a href='/search?research="+i+"'>"+i+"</a></li>";
					});
					$("#searchAuto").html(s);
				} else{
					$("#searchAuto").html("");
				}
			}
		});
	});
	$("#searchAuto").mouseleave(function() {
		$("#searchAuto").css("visibility", "hidden");
	});
  
});
</script>

<body>
<br><br>
<div class="container">
      <!-- 로고 -->
<!--    <header class="page-header" role="banner" >  -->
      

      
      <!-- 헤더 -->
      <div class="searchbar"  style="text-align: center;  width: 1170px; margin-bottom: 50px; margin-top: 50px;">
      
      <img alt="logo" src="../img/logo.png" onclick="location.href='/'" style="width:200px; float: left; margin-right: -100px; margin-top: -30px; cursor: pointer;">
         <input type="text"  id="s_value" maxlength="20" placeholder="검색어를 입력해주세요." autocomplete="off">&nbsp;&nbsp;&nbsp;
         <button type="button" class="search" style="border-style: none; 
         background-color:transparent;"><b class="glyphicon glyphicon-search " style="font-size: 30px; margin-left: -150px;'"></b> </button>
      	<ul id="searchAuto">
		</ul>
      
         <ul class="heshi" >
            <li>
            <a onclick="href='/search?research=면'"># 라면 # 냉면</a> <br><br>
            <a onclick="href='/search?research=김치'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# 김치찌개</a>
         </li>
         </ul>
         <br><br>
            
      </div> 
      </div>
      
      <nav class="navbar navbar-expand-sm" style="background-color: #c12231; margin-bottom: 10px;">

       
        
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
            <ul class="navbar-nav navbar-dark">
                <li class="nav-item dropdown" style="padding-right: 25px; height: 48px;">
                    <!-- 드롭다운 메뉴-->
                    <a class="list_icon glyphicon glyphicon-align-justify" data-toggle="dropdown" style=" font-weight: bold; position: absolute; left: 400%;" ></a>
                    <div class="dropdown-menu" style="margin-left: -20px; margin-top: 5px; background-color:white; opacity: 90%">                 
                        <ul class="side_item">               
                              <li class="dropdown-item" style="margin-top: 10px;  ">종류
                              </li>
                             
                              
							      
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
                     
                      <ul class="side_item">
                      <li class="dropdown-item">재료</li>
                          
                         
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
                     
                      <ul class="side_item" >
                        
                              <li class="dropdown-item">방법</li>
                           
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
                    <a class="nav-link" href='http://localhost:9000/ranking/ranking' style="position: absolute; color:white; left: 20%;">랭킹</a>
                </li>
                <li class="nav-item" style="color: white  ; font-size: 1.7rem; ">
                    <a class="nav-link" href='http://localhost:9000/collection/category' style="position: absolute; color:white; left: 30%;">컬렉션</a>
                </li>
       
       
       			<!-- 홈페이지 로그인 -->
                <c:if test="${sessionScope.loginok == null}">
                <li class="nav-item" style="color: white; font-size: 1.7rem; ">
                    <a class="nav-link" href="/login" style="position: absolute; color: white; right: 20%;">로그인</a>
                </li>
                <li class="nav-item" style="color: white; font-size: 1.7rem; ">
                    <a class="nav-link" href='${root}/member/signup?UserID=${sessionScope.loginid}' style="position: absolute; color: white; right: 10%;">회원가입</a>
                </li>   
                </c:if>
                  
                  <!-- 홈페이지 로그아웃 -->
                  <c:if test="${sessionScope.loginok != null}">
                     <li class="nav-item" style="color: black; font-size: 1.7rem; ">
                    	<a class="nav-link" style="font-family: 'Gowun Batang'; position: absolute; color: white; right: 37.5%; font-weight: bold;">${sessionScope.loginname}(${sessionScope.loginid}) 님</a>
               		 </li>
                     <li class="nav-item" style="color: white; font-size: 1.7rem; ">
                    	<a class="nav-link menupoint" onclick="logout()" style="position: absolute; color: white; right: 30%; cursor: pointer;">로그아웃</a>
               		 </li>
               		 <li class="nav-item" style="color: white; font-size: 1.7rem; ">
                    	<a class="nav-link page" href='${root}/mypage/mypage?UserID=${sessionScope.loginid}' style="position: absolute; color: white; right: 17.5%;">MY PAGE</a>
                	 </li>
                	 <li class="nav-item" style="color: white; font-size: 1.7rem; ">
                    	<a class="nav-link recipe" href='${root}/input/input' style="position: absolute; color: white; right: 5%;">MY RECIPE</a>
                	 </li>
                  </c:if>
              
           
            </ul>  
          
        </div>
    </nav>

            
  <!-- 네이버 아이디로 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">

       var naver_id_login = new naver_id_login("bE43jdaj6ZKwPRwdWSzJ", "http://localhost:9000/");
       // 접근 토큰 값 출력
       /* alert(naver_id_login.oauthParams.access_token); 토큰 넘어오는지 확인*/
       // 네이버 사용자 프로필 조회
       naver_id_login.get_naver_userprofile("naverSignInCallback()");
       
       // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
       function naverSignInCallback() {
       /*  alert(naver_id_login.getProfileData('name')); 값 넘어오는지 확인 */ 
          
           var name = naver_id_login.getProfileData('name');
           
           $.ajax({
             type: "post",
             dataType: "json",
             url: "/naver_login",
             data: {"name":name},
             success: function(data) {
             /*    alert("로그인되었습니다"); */
                   $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기
                   location.href="http://localhost:9000/";
                   var s = "";
                 
                   s += "<li class='nav-item' style='color: white; font-size: 1.7rem;'>";
                   s += "<a class='nav-link' onclick='naverLogout()'";
                   s += "style='position: absolute; color: white; right: 20%;'>로그아웃</a></li>"; 
                   $(".loginbtn").html(s);
                    
             }   
          });
       }

       //네이버 로그아웃
       var testPopUp;
       function openPopUp() {
           testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
       }
       function closePopUp(){
           testPopUp.close();
       }
       
       function naverLogout() {   
          openPopUp();
          setTimeout(function() {
             closePopUp();   
             location.reload();
             }, 500);
          history.replaceState({}, null, location.pathname); //url 숨기기
       }
       
       //홈페이지 로그아웃
       function logout(){
          $.ajax({
             type: "get",
             dataType: "text",
             url: "/logout",
             success: function(){
                location.href="/login";
                alert("로그아웃되었습니다")
             }
          });
       }
             
            
          //카카오 로그인
          /*  $.ajax({
                type: "post",
                dataType: "text",
                url: "/kakao_login",
                data: {"id":id},
                success: function(data) {
                   alert("login 카카오 로그인 성공"); 
                   var s = "";
          s += "<div class='kakao_logout' style='text-align: center;'>";
          s += "<button class='btn' onclick='kakaoLogout()'>";
            s += "<span>로그아웃</span></button></div>";
           $(".logoutbtn").html(s);
           
           $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기         
                }   
             });   */    
     
           if(${kakao=="yes"}){
             /*alert("카카오 로그인 성공"); */
             $(".loginbtn").css('visibility', 'hidden');  //로그인 버튼 숨기기
             location.href="http://localhost:9000/";
             var s = "";
           
             s += "<li class='nav-item' style='color: white; font-size: 1.7rem;'>";
             s += "<a class='nav-link' onclick='kakaoLogout()'";
             s += "style='position: absolute; color: white; right: 20%;'>로그아웃</a></li>"; 
             $(".loginbtn").html(s);
          }
           
           
           
           //카카오 로그아웃
            var testPopUp;
            function openPopUp() {
                testPopUp= window.open("http://developers.kakao.com/logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
            }
            function closePopUp(){
                testPopUp.close();
            }
            
            function kakaoLogout() {   
               openPopUp();
               setTimeout(function() {
                  closePopUp();   
                  location.href="/";
                  }, 500);
               history.replaceState({}, null, location.pathname); //url 숨기기
            }
            
            
    </script>      

</body>
</html>