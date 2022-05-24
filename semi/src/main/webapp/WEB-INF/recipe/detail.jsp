<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/detail.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="root" value="<%=request.getContextPath()%>"/>
<style type="text/css">
	.comphoto {
		max-width: 100%;
	}
</style>
<script type="text/javascript">
$(function(){
	var login = '${sessionScope.loginok}';
	
	$("#rate_button").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else{
			addRate();	
		}
	});

	
	$("#recom_button").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else{
			addRecommend();	
		}
	});
	
	$("#commentbutton").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else if ($("#comment_content").val() == ""){
			alert("댓글 내용을 입력하여 주십시오");
		}
		else{
			console.log($("content").val());
			submitComment();
		}
	});
	
	$("#scrap_button").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else{
			scrapRecipe();
		}
	});
});

function addRate() {
	$.ajax({
		type: "POST",
		dataType : "JSON",
		url: "addrate",
		data: {"idx":${dto.RECIPE_IDX},"rate":$("input[name='rating']:checked").val()},
		success : function(data) {
			//console.log(data.volunteer);
			//console.log(data.rate);
			$("#total_rate").html((data.rate / data.volunteer).toFixed(1));
			$("#total_volunteer").html(data.volunteer);
		}
	});
}

function addRecommend() {
	$.ajax({
		type: "POST",
		dataType : "JSON",
		url: "addrecom",
		data: {"idx":${dto.RECIPE_IDX}},
		success : function(data) {
			$("#total_recommendation").html(data.recom);
		}
	});
}

function showComment() {
	
}

function submitComment(){
	
}

function scrapRecipe(){
	var id = '${sessionScope.login}';
	$.ajax({
		type: "GET",
		dataType: "JSON",
		url: "scrap" ,
		data: {"idx":${dto.RECIPE_IDX}, "id":id},
		success: function() {
			$("#scrap_button").html("구독");
		}
	});
}

function editRecipe(){
	location.href = "/updateform?idx=${idx}"
}

function deleteRecipe(){
	location.href = "/delete?idx=${idx}"
}


</script>
</head>
<body>
	<!-- 모달 부분 -->
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        		<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">알림</h4>
      			</div>
      			<div class="modal-body">
        			로그인 후 이용햐여 주십시오
      			</div>
      			<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        		<button type="button" class="btn btn-success" onclick="location.href='../login/login'">로그인</button>
        		<button type="button" class="btn btn-primary" onclick="location.href='../member/signup'">회원가입</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- 레시피 부분 -->
	<div id="content">
		<!-- 레시피 소개 부분 -->
		<div id ="main_area">
			<div id="subject_area">
				<div id="name_section"><h1>${dto.name}</h1></div>
				<div id="id_section"><h3>${dto.userID} </h3></div>
				<div id="star_section">
					<div id="rate_section">
						<span class="glyphicon glyphicon-star" ></span>
						<c:if test="${dto.total_volunteer == 0}">
							<span id="total_rate">0.0</span>
						</c:if>
						<c:if test="${dto.total_volunteer != 0}">
							<span id="total_rate"><fmt:formatNumber value="${dto.total_rate / dto.total_volunteer}" pattern="0.0"/></span>
						</c:if>
						평가인원: <span id="total_volunteer">${dto.total_volunteer}</span>
					</div>
					<div class="star-rating">
						<input type="radio" id="5-stars" name="rating" value="5" checked="checked"/>
  						<label for="5-stars" class="star">&#9733;</label>
  						<input type="radio" id="4-stars" name="rating" value="4" />
  						<label for="4-stars" class="star">&#9733;</label>
  						<input type="radio" id="3-stars" name="rating" value="3" />
  						<label for="3-stars" class="star">&#9733;</label>
  						<input type="radio" id="2-stars" name="rating" value="2" />
  						<label for="2-stars" class="star">&#9733;</label>
  						<input type="radio" id="1-star" name="rating" value="1" />
  						<label for="1-star" class="star">&#9733;</label>
					</div>
					<div>
						<button type="button" id="rate_button">평점 주기</button>
					</div>
				</div>
				<div>
					<button id="scrap_button" type="button"><span class="glyphicon glyphicon-heart"></span>찜하기</button>
				</div>
			</div>
			<hr>
			<div id="tag_area">
				<ul>
					<c:forEach var="tag" items="${fn:split(dto.tags, ':')}">
						<li><a href=''>${tag}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div id="image_area">
				<img src="${dto.main_photo}" id="main_photo">
			</div>
			<div id="explain_area">
				<div id="ingredient_area">
					<div>
						<h3>재료</h3>
					</div>
					<div>
						<c:forEach var="ing" items="${ingredients}">
							<span>${ing.name}</span>						
						</c:forEach>
					</div>
				</div>
				<div id="level_area">
					<div id="level_section">
						<h3>분량</h3>
						<h1>${dto.portion }인분</h1>
					</div>
					<hr>
					
					<div id="portion_section">
						<h3>난이도</h3>
						<h1>${dto.level }</h1>
					</div>
				</div>
			</div>
		</div>
		
		<hr>
		<!-- 레시피 설명 부분  -->
		<div id="recipe_area">
			<div id="recipe_board">
				<h3>조리순서</h3>
				<c:forEach var="step" items="${steps}" varStatus="i">
					<p class="step_section"><br><b>Step ${step.step}</b></p>
					<p class="explain_section">${step.text}<br><br></p>
					<p class="image_section"><img src="${step.photo}"></p>
				</c:forEach>		
			</div>
			<c:if test="${dto.complete_photo != Null}">
				<h3>완성 사진</h3>
				<div id="complete_photos">
					<c:forEach var="photo" items="${fn:split(dto.complete_photo, ':')}">
						<img src="${photo}" class="comphoto">
					</c:forEach>
				</div>
			</c:if>
		</div>
		<button type="button" class="btn btn-info" id="recom_button">추천</button>
		<div id="recommned_section">
			추천 수 : 
			<span id="total_recommendation">${dto.total_recom}</span>
		</div>
		<div class="btn-group btn-group-justified">
    			<a href="#" class="btn btn-danger recipebtn" id=""><span>목록</span></a>
    			<a href="#" class="btn btn-danger recipebtn" id="editbtn"><span>수정</span></a>
    			<a href="#" class="btn btn-danger recipebtn" id="delbtn"><span>삭제</span></a>
  		</div>
	</div>		
		<div id="comment_area">
			<h3><span class="glyphicon glyphicon-comment"></span> 댓글 (${fn:length(comments)})</h3>
			<hr>
			<div class="comment_board">
				<c:forEach var="cmt" items="${comments }">
										
				</c:forEach>
				<form class="comment_form" action="addcom" method="post">
					<input type="hidden" name="RECIPE_IDX" value="${idx}">
					<input type="hidden" name="userID" value="${sessionScope.loginid}">
					<textarea class="form-control" rows="3" id="comment_content" name="content" placeholder="후기를 남겨주세요!"></textarea>
				</form>
				<button type="button" id="commentbutton">등록</button>
			</div>
		
		</div>
</body>
</html>