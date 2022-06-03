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
<style type="text/css">


*{ 
   line-height: 1; 
   text-align: center;
   
} 



ol, ul { 
   list-style: none; 
} 

table { 
   border-collapse: collapse; border-spacing: 0; 
}




 .memberform{
   	 padding: 10px 170px;
   }
   
   h3{
     text-align: center;
   }
   
    table tr td{
   	padding-top: 20px;
   } 
    
 
   
   table.mem{
		margin-left: 130px;
   }
   
  
	
	label.inputPhoto{
		font-family: 'Cafe24SsurroundAir';
		text-align: center;
		width: 800px;
		height: 450px;
		cursor: pointer;
	}
	#inputPhoto > img{
		width: 100%;
		
		object-fit: cover;
		margin-bottom: -250px;
		opacity: 0.5;
	}
	

.bodyers{
text-align: center;
}

span {
	color: red;
}	

.table-default  th {
	font-size: 2rem;
}

.table-default  tr {
	font-size: 2rem;
}

h1{
	font-weight: bold;
	bo
}

#container{
	opacity:0;
}
</style>
<script type="text/javascript">
$(function () {
	
	//로그인 체크
    if (${sessionScope.loginok != 'yes'}) {
       alert("로그인 후 이용해주세요");
       location.href="/login";
    }
    
    //아이디 체크
    if (${sessionScope.loginid != dto.userid}) {
    	
    alert("개인정보 수정은 본인만 가능합니다");
       location.href="/";
    }else{
    	var password =  prompt("PASSWD 입력하세요","");
    	if  (password != "${dto.password}")  {
    		alert("비밀번호가 틀립니다");
    		history.back();
        }else {
        	alert("회원수정페이집니다.");
        	$("#container").css("opacity", "100");
        }
    	
    }
	
	

	
	function img_preview(id, h) {
		var reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
		var file=$(id)[0].files[0];
		if (!file.type.match(reg)){
			alert("이미지 파일이 아닙니다.");
			return;
		}
		
		var reader=new FileReader();
		reader.onload=function(e) {
			var str="<img src='"+e.target.result
					+"' style='height:300px ; width:300px; ' class='img-circle' >" ;
			$(id).prev().html(str);
		}
		reader.readAsDataURL($(id)[0].files[0]);
	}

$("#inputPhoto").change(function() {
			
	      img_preview("#inputPhoto", 100);
	   });


function check(){
    var a = $("b.passok").text();
    if(a != 'ok'){
       alert("비밀번호를 제대로 입력해 주세요");
       $("#pass1").val("");
       $("#pass2").val("");
       $("#pass1").focus("");
       return false; //action 호출되지 않음..
    } else {
       return true;
    }
 }
//비밀번호 일치하는지 체크/////
	$("#password2").keyup(function (){
		var pass1 = $("#password1").val();
		var pass2 = $(this).val();
		if(pass1 == pass2){
			$("b.passok").text("비밀번호가 일치합니다.").css("color","blue");
		}else{
			$("b.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
		}
	});



	
	
});



</script>

</head>
<body>

		<div class="container" id="container" 
			style="text-align: center; width: 1200px; height: 1300px; background-color: white; ">

			<form action="rivise" method="post" class="photo" enctype="multipart/form-data" >


				<fieldset style="border: 5px solid gray; background-color: white; border-radius: 5%; ">
					<legend>
						<h1>MY PAGE 수정</h1>
						<font style="vertical-align: inherit; font-size: 1.7rem; "><${dto.name}회원님의 정보를 수정하십시오.></font>
					</legend><br>
					<div class="box" style="border-radius:50%; " >
					  <div class="shape" ></div>
		 			 <c:if test="${dto.photo != null}">
				
						<label for="inputPhoto"
							class="inputPhoto" style="cursor: pointer; border-radius:50%; width: 500px; height: 300px;">
								<img src="../upload/${dto.photo}"  class="img-circle" style=" width: 300px; height: 300px; ">
						</label> <input type="file" id="inputPhoto" name="upload_photo"
							accept=".jpg, .jpeg, .png" style="opacity: 0; font-size: 0px; width: 500px;"
							class="form-control">
					
					</c:if>
					<c:if test="${dto.photo==null}">
					  <label for="inputPhoto"
							class="inputPhoto" style="cursor: pointer; border-radius:50%; width: 500px; height: 300px;">
								<img src="../image/per__son.png"  class="img-circle" style=" width: 300px; height: 300px; ">
						</label> <input type="file" id="inputPhoto" name="upload_photo"
							accept=".jpg, .jpeg, .png" style="opacity: 0; font-size: 0px; width: 500px;"
							class="form-control">
					</c:if>
					

                     <p style="clear: none;"></p>
					    <br><p>${dto.name}님은 현재</p><p style="color: #c12231; font-weight: bold;"> 모두의 밥상 </p><p>회원입니다.</p>
					</div>

			
					<table class="table table-default" style="text-align: left; background-color: white;">

						<tr>
							<th style="width: 600px; text-align: center;">아이디</th>
							<td><input type="text" name="userid" id="userid"
								class="form-control" value="${dto.userid}" readonly="readonly"
								style="width: 250px; text-align: left;"></td>
						</tr>

						<tr rowspan="2">
			   				<th style="width: 600px; text-align: center; ">비밀번호<span class="required">*</span></th>
			   				<td>
			   					<input type="password" name="password" id="password1" style="width: 300px;" class="form-control"
                           placeholder="새 비밀번호를 입력해주세요">
							<br>
			   					<input type="password" id="password2" style="width: 300px;" class="form-control"
			   					placeholder="비밀번호 확인">
			   					
			   					&nbsp;
			   					<br>
			   					<b class="passok"></b>
			   				</td>
			   			</tr>

						<tr>
							<th style="width: 600px; text-align: center;">핸드폰</th>
							<td><input type="text" name="hp" class="form-control" 
								value="${dto.hp}" style="width: 250px;"></td>
						</tr>


						<tr>
							<th style="width: 600px; text-align: center;">이메일</th>
							<td><input type="text" name="email" class="form-control" 
								style="width: 250px;" value="${dto.email}"></td>
						</tr>
						<tr>
						<th style="width: 500px; text-align: center;">주소</th>
						<td><input type="text" id="address_search" name="address1"
							class="form-control" placeholder="주소를 입력해주세요"
							style="width: 250px;" value="${address1}"> &nbsp;
							<button type="button" class="btn btn-sm " 
								id="search_btn" style="width: 100px; position: relative; left: 50px; bottom: 30px; border: 2px solid #9D9393; " >
								주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search" style="color: #c12231;"></span>
							</button> &nbsp; <br>
						 <input type="text" name="address2"
							class="form-control"
			   					required="required" placeholder="상세주소를 입력하세요" style="width: 250px;"
							value="${address2}"> &nbsp; <br></td>
					</tr>
						<tr>
							<th style="width: 600px; text-align: center;;">본인소개</th>
							<td colspan="3"><input name="intro" class="form-control" value="${dto.intro}"  style="height: 80px;"></td>
						</tr>
					</table>
					<br>
					<button type="submit" class="btn btn-warning" id="rivise"
					style="width: 700px; height: 50px; margin: 20px 40px; text-align: center;">회원수정</button>
				</fieldset>
			</form>
		</div>
	
	
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    window.onload = function(){
   		$("#address_search,#search_btn").click(function(){	
   	 	//주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            	oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_search").value = data.address; // 주소 넣기
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
                console.log(data);
            }
        }).open();
    });
   }
    
 //   $(document).ready(function() {
  //  	$('#revise').click(function() {
  //  		$(location).attr('href','/mypage?=${userid}');	
   // 		});
  //  	});
  
</script>
	</div>
</body>
</html>