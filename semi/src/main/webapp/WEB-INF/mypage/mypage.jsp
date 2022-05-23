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
</head>
<style>
.r_mine1,.r_mine2 {
	text-align: center;
	
}

.slideshow_nav{
	text-align: center;

}
img{
	padding-left: 40px;
}
thead th{
	background-color: #006DCC;
	color: white;
	text-align: center;
	
}

tr td:first-child,
tr td:last-child{
border-top-right-radius: 6px;
border-bottom-right-radius: 6px;
	
}

myphoto{
	border-radius: 100%;
	width: 200px;
	height: 200px;
	

}
</style>
<script type="text/javascript">
	$(function(){
	 var container = $('.own'),
	  slideGroup = container.find('.r_mine'),
	  slides = slideGroup.find('a'),
	  nav = container.find('.slideshow_nav'),
	  indicator = container.find('.indicator'),
	  slideCount = slides.length,
	  indicatorHtml = '',
	  currentIndex = 0,
	  duration = 500, /*시간 0.5초*/
	  easing = 'easeInOutExpo' /*2진*/
	  interval = 3500,  /*3.5초*/
	  timer;  /*마우스올리면 멈추기*/ /*여기까지 이름만지정*/
	  
	  //슬라이드 가로로배열
	  //slides 마다 할일필요 0,100,200,300 % left순서로
	  //console.log(slides);
	  
	  
	 $(function() {
	     console.log(${dto}); 
		 //비번체크
	      $(".userPassword1").keyup(function() {
	         var p1 = $("#userPassword1").val();
	         var p2 = $(this).val();
	         if (p1 == p2) {
	            $("b.passok").html("ok").css("color", "blue");
	         } else {
	            $("b.passok").html("fail").css("color", "red");
	         }
	      });

	      //이메일
	      $("#useremail").change(function() {
	         var s = $(this).val();
	         if (s == '-') {
	            $("#useremail").val("");
	            $("#useremail").focus();
	         } else {
	            $("#useremail").val(s);
	         }

	      });
	      //아이디중복
	      $("#UserID").click(function() {
			$.ajax({
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"UserID":$("#UserID").val()},
				success:function(data){
					if(data.count==0){
						$("b.idok").text("ok");  //membercontroller가 넘어옴
						}else{
						alert("이미존재하는 아이디입니다");
						$("#id").val("");
						$("#id").focus();
					}
				}
			});
		});
	   });
	   
	   function check(){
	      var a = $("b.passok").text();
	      if($("b.idok").text()!='ok'){
	    	  alert("아이디 중복확인 해주세요");
	    	
	    	  return false; //false해야 다음으로넘어가지않는다
	     
	       }else if(a!='ok'){
	         alert("비밀번호를 제대로 입력해 주세요");
	         $("#userPassword1").val("");
	         $("#userPassword2").val("");
	         $("#userPassword1").focus("");
	         return false; //action 호출되지 않음
	      } else {
	         return true;
	      }
	   }

</script>
<body>
<br><br><br><br>
<hr><hr><hr><hr>
<hr><hr><hr><hr>
<hr><hr><hr><hr>

<!-- 회원정보수정 -->
<div class="container">
	<form method="post" action="updateform"></form>
	<img src="../img/logo.png" class="myphoto"  >
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid gray;">
			<thead>
				<tr>
					<th colspan="2"><h4>회원정보수정양식</h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 110px;"><h5>${dto.UserID}</h5></td>
					<td><h5>
						</h5>
						<input type="hidden" name="UserID" value="">
						
						<button type="button" class="btn btn-sm btn-danger" id="idcheck">아이디체크</button>
							&nbsp;
							<b class="idok"></b>	
						</td>
						
				</tr>
				
				<tr>
					<td style="width: 110px;"><h5>비밀번호</h5></td>
					<td colspan="2"><input onkeyup="passwordCheckFunction();" 
					class="form-control" id="userPassword1" type="password" name="userPassword1"
					maxlength="20" placeholder="비밀번호입력하세요"><b class="passok"></b>
						
					
				</tr>
				
				<tr>
					<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
					<td colspan="2"><input onkeyup="passwordCheckFunction();" 
					class="form-control" id="userPassword2" type="password" name="userPassword2"
					maxlength="20" placeholder="비밀번호 확인을 입력하세요"><h5>
						</h5>
					
				</tr>
				
				<tr>
					<td style="width: 110px;"><h5>이름 : </h5></td>
					<td colspan="2"><input 
					class="form-control" id="username" type="text" name="username" 
					maxlength="20" placeholder="이름" value="${dto.name}"><h5>
						</h5></td>
					
				</tr>				
				<tr>
					<td style="width: 110px;"><h5>전화번호 : </h5></td>
					<td colspan="2"><input class="form-control" id="userhp" type="text" name="userhp"
					maxlength="20" placeholder="***-****-****" value="${dto.hp}"></td>
					
				</tr>
				
				<tr>
					<td style="width: 110px;"><h5>이메일 : </h5></td>
					<td colspan="2"><input class="form-control" id="useremail" type="email" name="useremail"
					maxlength="20" placeholder="메일" value=""></td>
						
					
				</tr>
				
				<tr>
					<td style="width: 110px;"><h5>자기소개 : </h5></td>
					<td colspan="2"><input class="form-control" id="userintro"  name="userintro">
					<h5><textarea rows="5" cols=10""></textarea>
						</h5>
					
				</tr>
				<tr>
					<td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5>
					<input class="btn btn-primary pull-right" type="submit" value="수정"></td>
				</tr>
					
			</tbody>
		
		
		</table>

</div>
	
	
	
	
<!-- 사진슬라이드 -->
<h2>내 레시피</h2>
	<div class="own">
		<div class="r_mine1">
			<a href=""><img alt="slide1" src="../image/food1.jpg"></a> 
			<a href=""><img alt="slide2" src="../image/food3.jpg"></a> 
			<a href=""><img alt="slide3" src="../image/food2.jpg"></a>
			<a href=""><img alt="slide4" src="../image/food3.jpg"></a>
		</div><!-- r_mine -->
		<br>
		<div class="slideshow_nav" style="font-size: 20px;">
			<a href="" class="prev">prev</a>
			<a href="" class="next">next</a>
		</div><!-- slideshow_nav -->
		<div class="indicator">
			
		</div><!-- indicator -->
	</div><!-- own -->
	
	
<!-- 사진슬라이드 -->
<h2>내가 찜한 레시피</h2>
	<div class="own">
		<div class="r_mine2">
			<a href=""><img alt="slide1" src="../image/food1.jpg"></a> 
			<a href=""><img alt="slide2" src="../image/food3.jpg"></a> 
			<a href=""><img alt="slide3" src="../image/food2.jpg"></a>
			<a href=""><img alt="slide4" src="../image/food3.jpg"></a>
		</div><!-- r_mine -->
		<br>
		<div class="slideshow_nav" style="font-size: 20px;">
			<a href="" class="prev">prev</a>
			<a href="" class="next">next</a>
		</div><!-- slideshow_nav -->
		<div class="indicator">
			
		</div><!-- indicator -->
	</div><!-- own -->
</body>
</html>