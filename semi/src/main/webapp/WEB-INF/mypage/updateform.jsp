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
	img.inputPhoto{
		width: 800px;
		height: 450px;
		object-fit: cover;
		margin-bottom: -250px;
		opacity: 0.5;
	}
	

.bodyers{
text-align: center;
}
</style>
<script type="text/javascript">
$(function () {
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
					+"' style='height: "+h+"px; object-fit: contain;'>";
			$(id).prev().html(str);
		}
		reader.readAsDataURL($(id)[0].files[0]);
	}

$("#inputPhoto").change(function() {
	      img_preview("#inputPhoto", 200);
	   });
});

</script>

</head>
<body>

	<div class="bodyers" >
		<div class="revise_form" id="revise_form"   >

			<h3>회원가입수정</h3>
			<form action="rivise" method="post" class="photo" enctype="multipart/form-data" >
				<table class="userimpo" style="text-align: center;" ">

					<tr>
						<td style="text-align: center;"><label for="inputPhoto"
							class="inputPhoto" style="cursor: pointer;">
								<img class="photo" src="../image/per__son.png"
								>
						</label> <input type="file" id="inputPhoto" name="upload_photo"
							accept=".jpg, .jpeg, .png" style="opacity: 0; font-size: 0px;"
							class="form-control" required="required"></td>
					</tr>
					
					<tr>
							<th style="width: 600px; text-align: center;">아이디</th>
							<td><input type="text" name="userid" id="userid"
								class="form-control" value="${dto.userid}" 
								style="width: 250px; text-align: left;"></td>
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
							style="width: 250px;" /> &nbsp;
							<button type="button" class="btn btn-sm btn-primary"
								id="search_btn" style="width: 100px;">
								주소 검색&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
							</button> &nbsp; <br>
						<br> <input type="text" name="address2"
							class="form-control
			   					required="
							required" placeholder="상세주소를 입력하세요" style="width: 250px;"
							value="${dto.address}"> &nbsp; <br></td>
					</tr>
					<tr>
						<th style="width: 500px; text-align: center;">본인소개</th>
						<td colspan="3"><input name="intro"
							style="resize: none; width: 400px; height: 75px;"
							class="form-control" placeholder="본인을 소개해주세요" required="required">

						</td>
					</tr>
				</table>
				<br>
				<button type="submit" class="btn btn-warning" id="revise"
					style="width: 700px; height: 50px; margin: 20px 40px; text-align: center;"
					>회원수정</button>
			</form>
		</div>


		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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