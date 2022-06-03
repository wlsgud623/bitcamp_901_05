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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<c:set var="root" value="<%=request.getContextPath()%>"/>
<style type="text/css">	
	.noborderbtn{
		border: 0px;
		background-color: white;
	}
	
	.item img {
  		width:100%
	}
</style>
<script type="text/javascript">
$(function(){
	var login = '${sessionScope.loginok}';
	showComment();
	$(".slider").change(function() {
		var photo_idx = $(".slider input[type=radio]:checked~").index();
		$(".bullets>label:gt("+(photo_idx)+")").css("background-color", "#fff");
		$("ul.imgs>li:gt("+(photo_idx)+")").css("opacity", "1").css("transition", "1s").css("z-index", "1");
	});
	
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
			$("#recom_button img").attr("src", "/image/icon-heart.gif");
			$(this).css("color", "red");
			addRecommend();	
		}
	});

	
	$("#commentbtn").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else if ($("#comment_content").val() == ""){
			alert("댓글 내용을 입력하여 주십시오");
			$("#comment_content").focus();
		}
		else{
			//console.log($("#comment_content").val());
			submitComment();
		}
	});

	$(document).on("click","#replybtn" ,function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else if ($("#reply_content").val() == ""){
			alert("댓글 내용을 입력하여 주십시오");
			$("#reply_content").focus();
		}
		else{
			//console.log($("#reply_content").val());
			submitRecomment();
		}
	});
	
	$(document).on("click","#editbtn" ,function() {
		updateComment();	
	});
	
	$(document).on("click","#canclebtn" ,function() {
		showComment();
	});
	
	$("#scrap_button").click(function() {
		if (login == null || login !='yes'){
			$("#loginModal").modal('show');
		}
		else{
			scrapRecipe();
		}
	});
	
	$("#editrecbtn").click(function() {
		editRecipe("${dto.userID}");
	});
	
	$("#delrecbtn").click(function() {
		deleteRecipe("${dto.userID}");
	});
	
});

function addRate() {
	$.ajax({
		type: "POST",
		dataType : "JSON",
		url: "addrate",
		data: {"idx":${dto.RECIPE_IDX},"rate":$("input[name='rating']:checked").val(), "userid":"${sessionScope.loginid}"},
		success : function(data) {
			if (data.rate==null){
				alert("이미 평점을 부여하셨습니다");
				return;
			}
			//console.log(data.volunteer);
			//console.log(data.rate);
			$("#total_rate").html((data.rate / data.volunteer).toFixed(1));
			$("#total_volunteer").html(data.volunteer);
			$("#rate_button").addClass("disabled");
		}
	});
}

function addRecommend() {
	$.ajax({
		type: "POST",
		dataType : "JSON",
		url: "addrecom",
		data: {"idx":${dto.RECIPE_IDX}, "userid":"${sessionScope.loginid}"},
		success : function(data) {
			if (data.recom==null){
				alert("이미 추천한 레시피입니다");
				return;
			}
			$("#total_recommendation").html(data.recom);
			$("#recom_button").addClass("disabled");
		}
	});
}

function showComment() {
	$.ajax({
		type: "get",
		url: "cmtlist",
		data: {"idx": ${dto.RECIPE_IDX}},
		success: function(data) {
			var s = "";
			if (data==null || data.length == 0){
				s += "<h3>댓글이 없습니다. 첫 번째 후기를 올려보세요</h3>";
				$("#cmboard").html(s);	
				var c = "댓글(" + data.length + ")";
				$("#comment_count").html(c);
				return;
			}
			
			$.each(data, function(index, element) {
				var date = new Date(element.writeday);
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var hour = date.getHours();
				var min = date.getMinutes();
				var sec = date.getSeconds();

				    month = (month < 10 ? "0" : "") + month;
				    day = (day < 10 ? "0" : "") + day;
				    hour = (hour < 10 ? "0" : "") + hour;
				    min = (min < 10 ? "0" : "") + min;
				    sec = (sec < 10 ? "0" : "") + sec;

				var str = date.getFullYear() + "-" + month + "-" + day + " " +  hour + ":" + min + ":" + sec;
				if (element.depth > 0){
					s += '<div style="display: flex; margin-left: '+ (element.depth * 30)+'px;">';
					s+= '<img src="/image/icon-reply.png" width="25px" height="25px">';
				}
				else{
					s += '<div style="display: flex;">';
				}
				s += '<div class="name_area" style="text-align: center; width : 150px;  flex-shrink: 0; padding-top: 10px;">';
				s += '<img src="/image/icon-user.png">';
				s += '<h4>'+element.userID+'</h4>';
				s += '<h5>'+str+'</h5>';	
				s += '</div>';
				s += '<div class="text_area" style="flex-grow: 1; padding: 3px 3px;">';
				s += '<div class="btn-group" style="float:right;">';
				s += '<button type="button" class="noborderbtn" onclick="showEditInput('+element.num+",'"+element.userID+"')" + ';">수정</button>&nbsp&nbsp';
				s += '<button type="button" class="noborderbtn" onclick="deleteComment('+ element.num +",'"+element.userID+"')" + ';">삭제</button>&nbsp&nbsp';
				s += '<button type="button" class="noborderbtn" onclick="showReplyInput('+element.num+');">답글</button>';
				s += '</div>';
				s += '<div class="comment_content"> <p>'+element.content+'</p></div>';
				s += '</div></div><hr style="height: 2px; background-color: black;">';
			});
			$("#cmboard").html(s);	
			var c = "댓글(" + data.length + ")";
			$("#comment_count").html(c);
		}
	});
}

function showReplyInput(num){
	if ('${sessionScope.loginok}' == null || '${sessionScope.loginok}' !='yes'){
		$("#loginModal").modal('show');
		return;
	}
	
	if ($("#" + "replyform" + num).length){ 
		showComment();
		return;
	}
	$.ajax({
		type: "get",
		url: "cmtlist",
		data: {"idx": ${dto.RECIPE_IDX}},
		success: function(data) {
			var s = "";
			$.each(data, function(index, element) {
				var date = new Date(element.writeday);
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var hour = date.getHours();
				var min = date.getMinutes();
				var sec = date.getSeconds();

				    month = (month < 10 ? "0" : "") + month;
				    day = (day < 10 ? "0" : "") + day;
				    hour = (hour < 10 ? "0" : "") + hour;
				    min = (min < 10 ? "0" : "") + min;
				    sec = (sec < 10 ? "0" : "") + sec;

				var str = date.getFullYear() + "-" + month + "-" + day + " " +  hour + ":" + min + ":" + sec;
				if (element.depth > 0){
					s += '<div style="display: flex; margin-left: '+ (element.depth * 30)+'px;">';
					s+= '<img src="/image/icon-reply.png" width="25px" height="25px">';
				}
				else{
					s += '<div style="display: flex;">';
				}
				s += '<div class="name_area" style="text-align: center; width : 150px;  flex-shrink: 0; padding-top: 10px;">';
				s += '<img src="/image/icon-user.png">';
				s += '<h4>'+element.userID+'</h4>';
				s += '<h5>'+str+'</h5>';	
				s += '</div>';
				s += '<div class="text_area" style="flex-grow: 1; padding: 3px 3px;">';
				s += '<div class="btn-group" style="float:right;">';
				s += '<button type="button" class="noborderbtn" onclick="showEditInput('+element.num+",'"+element.userID+"')" + ';">수정</button>&nbsp&nbsp';
				s += '<button type="button" class="noborderbtn" onclick="deleteComment('+ element.num +",'"+element.userID+"')" + ';">삭제</button>&nbsp&nbsp';
				s += '<button type="button" class="noborderbtn" onclick="showReplyInput('+element.num+');">답글</button>';
				s += '</div>';
				s += '<div class="comment_content" style="margin-top: 20px;"> <p>'+element.content+'</p></div>';
				s += '</div></div><hr style="height: 2px; background-color: black;">';
				if (element.num == num) {
					s+= '<form id="replyform'+element.num+'" class="replyform" name="replyform" action="addreply" method="post" style="margin-bottom: 50px;">';
					s+= '<input type="hidden" name="RECIPE_IDX" value="${dto.RECIPE_IDX}">';
					s+= '<input type="hidden" name="userID" value="${sessionScope.loginid}">';
					s+= '<input type="hidden" name="cgroup" value="'+element.cgroup+'">';
					s+= '<input type="hidden" name="seq" value="'+(element.seq+1)+'">';
					s+= '<input type="hidden" name="depth" value="'+(element.depth+1)+'">';
					s+= "<textarea class='form-control' rows='3' id='reply_content' name='content' placeholder='"+element.userID +"님의 댓글에 대댓글 작성'></textarea>";
					s+= "<button type='button' id='replybtn' class='btn' style='float:right;'>등록</button>";
					s+= "<button type='button' id='canclebtn' class='btn' style='float:right;'>취소</button>";
					s+= '</form><hr style="height: 2px; background-color: black;">';
				} 
			});
			$("#cmboard").html(s);

		}
	});
}

function showEditInput(num,userID){
	if ("${sessionScope.loginok}" == null || "${sessionScope.loginok}" !='yes'){
		$("#loginModal").modal('show');
		return;
	}
	else if ("${sessionScope.loginid}" != id){
		alert("본인이 작성한 댓글만 수정할 수 있습니다");
		return;
	}
	$.ajax({
		type: "get",
		url: "cmtlist",
		data: {"idx": ${dto.RECIPE_IDX}},
		success: function(data) {
			var s = "";
			$.each(data, function(index, element) {
				var date = new Date(element.writeday);
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var hour = date.getHours();
				var min = date.getMinutes();
				var sec = date.getSeconds();

				    month = (month < 10 ? "0" : "") + month;
				    day = (day < 10 ? "0" : "") + day;
				    hour = (hour < 10 ? "0" : "") + hour;
				    min = (min < 10 ? "0" : "") + min;
				    sec = (sec < 10 ? "0" : "") + sec;

				var str = date.getFullYear() + "-" + month + "-" + day + " " +  hour + ":" + min + ":" + sec;
				if (element.depth > 0){
					s += '<div style="display: flex; margin-left: '+ (element.depth * 30)+'px;">';
					s+= '<img src="/image/icon-reply.png" width="25px" height="25px">';
				}
				else{
					s += '<div style="display: flex;">';
				}
				s += '<div class="name_area" style="text-align: center; width : 150px;  flex-shrink: 0; padding-top: 10px;">';
				s += '<img src="/image/icon-user.png">';
				s += '<h4>'+element.userID+'</h4>';
				s += '<h5>'+str+'</h5>';	
				s += '</div>';
				s += '<div class="text_area" style="flex-grow: 1; padding: 3px 3px;">';
					
				if (element.num == num) {
					s+= '<form id="editform" name="editform" action="updatecom" method="post">';
					s+= '<input type="hidden" name="NUM" value="'+ element.num +'">';
					s+= '<input type="hidden" name="RECIPE_IDX" value="${dto.RECIPE_IDX}">';
					s+= "<textarea class='form-control' rows='3' name='content'>"+element.content+"</textarea>";
					s+= "<button type='button' id='editbtn' class='btn' style='float:right;'>등록</button>";
					s+= "<button type='button' id='canclebtn' class='btn' style='float:right;'>취소</button>";
					s+= '</form></div>';
				} else{
					s += '<div class="btn-group" style="float:right;">';
					s += '<button type="button" class="noborderbtn" onclick="showEditInput('+element.num+",'"+element.userID+"')" + ';">수정</button>&nbsp&nbsp';
					s += '<button type="button" class="noborderbtn" onclick="deleteComment('+ element.num +",'"+element.userID+"')" + ';">삭제</button>&nbsp&nbsp';
					s += '<button type="button" class="noborderbtn" onclick="showReplyInput('+element.num+');">답글</button>';
					s += '</div>';
					s += '<div class="comment_content" style="margin-top: 20px;"> <p>'+element.content+'</p></div>';
				}
				s += '</div></div><hr style="height: 2px; background-color: black;">';
			});
			$("#cmboard").html(s);
		}
	});
}

function submitComment(){
	var formdata = $("#commentform").serialize();
	$.ajax({
		type: "POST",
		url: "addcom",
		data: formdata,
		success: function(data) {
			showComment();
			$("#comment_content").val("");
		}
	});
}


function submitRecomment(){
	var formdata = $(".replyform").serialize();
	$.ajax({
		type: "POST",
		url: "addreply",
		data: formdata,
		success: function(data) {
			showComment();
		}
	});
}
function deleteComment(num, userID){
	if ("${sessionScope.loginok}" == null || "${sessionScope.loginok}" !='yes'){
		$("#loginModal").modal('show');
		return;
	}
	var ans = confirm("댓글을 삭제하시겠습니까?");
	if (ans){
		if ("${sessionScope.loginid}" != userID){
			alert("본인이 작성한 댓글만 삭제할 수 있습니다");
			return;
		}
		$.ajax({
			type: "POST",
			url: "delcom",
			data: {"num":num},
			success: function(data) {
				showComment();
			}
		});
	}
}

function updateComment(){
	var formdata = $("#editform").serialize();
	$.ajax({
		type: "POST",
		url: "updatecom",
		data: formdata,
		success: function(data) {
			showComment();
		}
	});
}


function scrapRecipe(){
	var id = '${sessionScope.login}';
	$.ajax({
		type: "GET",
		dataType: "JSON",
		url: "scrap" ,
		data: {"idx":${dto.RECIPE_IDX}, "id":id},
		success: function() {
			$("#scrap_button").html("찜!");
			$("#scarp_button").css("color", "red");
			$("#scarp_button").addClass("disabled");
		}
	});
}

function editRecipe(userID){
	if ("${sessionScope.loginok}" == null || "${sessionScope.loginok}" !='yes'){
		$("#loginModal").modal('show');
		return;
	}
	if ("${sessionScope.loginid}" != userID){
		alert("작성자가 아니면 수정할 수 없습니다");
		return;
	}
	
	var ans = confirm("레시피를 수정하시겠습니까?");
	if (ans){ 
		location.href = "/update/updateform?RECIPE_IDX=${dto.RECIPE_IDX}"
	}
}

function deleteRecipe(userID){
	if ("${sessionScope.loginok}" == null || "${sessionScope.loginok}" !='yes'){
		$("#loginModal").modal('show');
		return;
	}
	if ("${sessionScope.loginid}" != userID){
		alert("작성자가 아니면 삭제할 수 없습니다");
		return;
	}
	
	var ans = confirm("레시피를 삭제하시겠습니까?");
	if (ans){ 
		location.href = "/recipe/delete?idx=${dto.RECIPE_IDX}";
	}
}


</script>
</head>

<body>
<!-- 모달 부분 -->
	<!-- Modal -->
	<div class="modal" id="loginModal"  role="dialog" aria-labelledby="myModalLabel">
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
        		<button type="button" class="btn btn-success" onclick="location.href='../login'">로그인</button>
        		<button type="button" class="btn btn-primary" onclick="location.href='../member/signup'">회원가입</button>
      			</div>
    		</div>
  		</div>
	</div>
<div class="container">
	<!-- 레시피 부분 -->
	<div id="content">
		<!-- 레시피 소개 부분 -->
		
		<div id ="main_area">
			<div id="subject_area">
				<div id="name_section"><h1>${dto.name}</h1></div>
				<div><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			</div>
			<hr style="background-color: black; height: 1px;">
			<div id="name_area">
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
					&nbsp;&nbsp;&nbsp;
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
						<button type="button" id="rate_button" class="btn">평점 주기</button>
					</div>
				</div>
				<div>
					<button id="scrap_button" type="button" class="btn"><span class="glyphicon glyphicon-heart"></span>찜하기</button>
				</div>
			</div>
			<hr style="background-color: black; height: 1px;">
			<div id="tag_area">
				<ul>
					<c:forEach var="tag" items="${fn:split(dto.tags, ',')}">
						<li><a href='/search?research=${tag}'>#${tag}</a></li>
					</c:forEach>
				</ul>
			</div>
	
			<div id="image_area">
				<img src="../upload/${dto.main_photo}" id="main_photo">
			</div>
			
			<div class="well" id="intro_area">
				<h3>${dto.intro }</h3>
			</div>
			
			<div id="explain_area">
				<div id="ingredient_area">
					<div>
						<h3>재료</h3>
					</div>
					<div style="margin-left: auto; padding-right: 50px; padding-top: 20px;">
						<c:forEach var="ing" items="${ingredients}">
							<span style="display: flex; border-bottom: 1px dotted #eee;"><p>${ing.name}</p>&emsp;<p style="margin-left: auto;">${ing.quantity}</p></span><br>
						</c:forEach>
					</div>
				</div>
				<div id="level_area">
					<div id="level_section">
						<h3>분량</h3>
						<h1>${dto.portion }인분</h1>
					</div>
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
				<h1>조리순서</h1>
				<c:forEach var="step" items="${steps}" varStatus="i">
					<p class="step_section"><br><b>Step ${step.step}</b></p>
					<p class="explain_section">${step.text}<br><br></p>
					<p class="image_section"><img src="../upload/${step.photo}"></p>
				</c:forEach>		
			</div>
			<br>
			<br>
			<c:if test="${dto.complete_photo != Null}">
				<h3>완성 사진</h3>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				  	<c:forEach var="photo" items="${fn:split(dto.complete_photo, ',')}" varStatus="i">
				  		<c:if test="${i.count ==1 }">
				  			<li data-target="#myCarousel" data-slide-to="${i.index}" class="active"></li>
				  		</c:if>
				  		<c:if test="${i.count !=1 }">
				  			<li data-target="#myCarousel" data-slide-to="${i.index}"></li>
				  		</c:if>
				  	</c:forEach>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner">
				  	<c:forEach var="photo" items="${fn:split(dto.complete_photo, ',')}" varStatus="i">
				  		<c:if test="${i.count ==1 }">
				  			<div class="item active">
				  				<c:if test="${photo!='no image'}">
				  					<img src="../upload/${photo}" alt="${i.count }번째 이미지">
				  				</c:if>
				  				<c:if test="${photo=='no image'}">
				  					<img src="/image/gray.jpg">
				  				</c:if>
				    		</div>
				  		</c:if>
				  		<c:if test="${i.count !=1 }">
				  			<div class="item">
				      			<c:if test="${photo!='no image'}">
				  					<img src="../upload/${photo}" alt="${i.count }번째 이미지">
				  				</c:if>
				  				<c:if test="${photo=='no image'}">
				  					<img src="/image/gray.jpg">
				  				</c:if>
				    		</div>
				  		</c:if>
				  	</c:forEach>
				
				  <!-- Left and right controls -->
				  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#myCarousel" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				</div>
			</c:if>
		</div>

		<div id="recommned_section" style="text-align: center; margin-bottom: 30px;">
			<button type="button" class="btn btn-lg" id="recom_button">
				<img src="/image/icon-like.png" width="60" height="60"> <br>
				<span id="total_recommendation" style="font-weight: bold; font-size: 2.5rem;">${dto.total_recom}</span><br>
				<span>추천</span>
			</button>
		</div>
		<div class="btn-group btn-group-justified">
    			<a href="/collection/category" class="btn btn-danger recipebtn"><span>목록</span></a>
    			<a href="#" class="btn btn-danger recipebtn" id="editrecbtn"><span>수정</span></a>
    			<a href="#" class="btn btn-danger recipebtn" id="delrecbtn"><span>삭제</span></a>
  		</div>
	</div>		
		<div id="comment_area">
			<h3><span class="glyphicon glyphicon-comment"></span> <span id="comment_count">댓글 (${fn:length(comments)})</span></h3>
			<hr style="height: 2px; background-color: black;">
			<div class="comment_board">
				<div id="cmboard">
				
				</div>
				<form id="commentform" action="addcom" method="post">
					<input type="hidden" name="RECIPE_IDX" value="${dto.RECIPE_IDX}">
					<input type="hidden" name="userID" value="${sessionScope.loginid}">
					<input type="hidden" name="seq" value="0">
					<input type="hidden" name="depth" value="0">
					<textarea class="form-control" rows="3" id="comment_content" name="content" placeholder="후기를 남겨주세요!"></textarea>
				</form>
				<button type="button" id="commentbtn" class="btn" style="float: right;">등록</button>
			</div>
		</div>
</div>
</body>
</html>