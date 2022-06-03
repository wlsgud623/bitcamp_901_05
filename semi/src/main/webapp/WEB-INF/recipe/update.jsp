<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gowun+Batang&family=Gowun+Dodum&family=Hahmlet:wght@100&family=Jua&family=Nanum+Myeongjo&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="/css/update.css">
<link rel="stylesheet" href="/css/button.css">
<script type="text/javascript">
	var ingClass=${ingClass+1}; //다음에 추가될 재료묶음(idx)
	var writeOrder=${ingClass+1}; //다음에 추가될 재료묶음(writeorder)
	var stepCount=${stepCount+1}; //다음에 추가될 요리단계
	
	$(function() {
		//로그인 체크
		if (${sessionScope.loginok != 'yes'}) {
			alert("로그인 후 이용해주세요");
			location.href="/login";
		}
		
		//아이디 체크
		if (${sessionScope.loginid != recipe.userID}) {
			alert("레시피 수정은 작성자만 가능합니다");
			location.href="/";
		}
		
		//태그 불러오기
		showTag("${recipe.tags}");
	});
</script>
<script src="/js/update.js"></script>
</head>
<body>
<div class="container inputMain" id="input">
	<h1 class="inputTitle">레시피 수정</h1>
	<form action="update" method="post" class="form-inline" enctype="multipart/form-data">
		<input type="hidden" name="RECIPE_IDX" class="forms" value="${recipe.RECIPE_IDX}">
		<label for="inputPhoto" class="inputMainLabel">
			<img src="../upload/${recipe.main_photo}"
			style="width: 800px; height: 450px; object-fit: cover;">
		</label>
	    <input type="file" id="inputPhoto" name="upload_main" accept=".jpg, .jpeg, .png"
	    style="opacity: 0; font-size: 0px;" class="forms">
	    
	    <table class="mainFt" style="width: 800px;">
	    	<tr>
	    		<th>레시피 제목</th>
	    		<td colspan="3">
	    			<input type="text" name="name" class="forms" style="width: 640px;"
	    			value="${recipe.name}" required="required" autocomplete="off">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>레시피 소개</th>
	    		<td colspan="3">
	    			<textarea name="intro" style="resize: none; width: 640px; height: 150px;"
	    			class="forms" required="required">${recipe.intro}</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>카테고리</th>
	    		<td width="240">
	    			<div class="selectBox2 ">
						<input type="text" name="category" class="selector" value="${recipe.category}"
						placeholder="종류별" readonly="readonly">
						<ul class="optionList">
							<li class="optionItem">밥/죽</li>
							<li class="optionItem">반찬</li>
							<li class="optionItem">국물</li>
							<li class="optionItem">면</li>
							<li class="optionItem">디저트</li>
							<li class="optionItem">양식</li>
							<li class="optionItem">일식</li>
							<li class="optionItem">중식</li>
							<li class="optionItem">퓨전</li>
							<li class="optionItem">떡/만두</li>
							<li class="optionItem">빵/과자</li>
							<li class="optionItem">양념/소스</li>
							<li class="optionItem">샐러드</li>
							<li class="optionItem">음료</li>
							<li class="optionItem">기타</li>
						</ul>
					</div>
	    		</td>
	    		<td width="240">
	    			<div class="selectBox2 ">
						<input type="text" name="main_ing" class="selector" value="${recipe.main_ing}"
						placeholder="재료별" readonly="readonly">
						<ul class="optionList">
							<li class="optionItem">소고기</li>
							<li class="optionItem">돼지고기</li>
							<li class="optionItem">닭고기</li>
							<li class="optionItem">육류</li>
							<li class="optionItem">해물</li>
							<li class="optionItem">채소류/버섯</li>
							<li class="optionItem">계란/유제품</li>
							<li class="optionItem">쌀</li>
							<li class="optionItem">밀가루</li>
							<li class="optionItem">콩/견과류</li>
							<li class="optionItem">기타</li>
						</ul>
					</div>
	    		</td>
	    		<td>
	    			<div class="selectBox2 ">
						<input type="text" name="cooking" class="selector" value="${recipe.cooking}"
						placeholder="방법별" readonly="readonly">
						<ul class="optionList">
							<li class="optionItem">구이</li>
							<li class="optionItem">찜</li>
							<li class="optionItem">끓임</li>
							<li class="optionItem">볶음</li>
							<li class="optionItem">튀김</li>
							<li class="optionItem">조림</li>
							<li class="optionItem">부침</li>
							<li class="optionItem">무침</li>
							<li class="optionItem">비빔</li>
							<li class="optionItem">삶음</li>
							<li class="optionItem">회</li>
							<li class="optionItem">절임</li>
							<li class="optionItem">데치기</li>
							<li class="optionItem">기타</li>
						</ul>
					</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>요리 정보</th>
	    		<td>
	    			<div class="selectBox2 ">
	    				<c:set var="portion" value="${recipe.portion}"/>
	    				<c:if test="${recipe.portion == 4}">
	    					<c:set var="portion" value="${recipe.portion}인분 이상"/>
	    				</c:if>
	    				<c:if test="${recipe.portion < 4 && recipe.portion > 0}">
	    					<c:set var="portion" value="${recipe.portion}인분"/>
	    				</c:if>
						<input type="text" name="portions" class="selector" value="${portion}"
						placeholder="양" readonly="readonly">
						<ul class="optionList">
							<li class="optionItem">1인분</li>
							<li class="optionItem">2인분</li>
							<li class="optionItem">3인분</li>
							<li class="optionItem">4인분 이상</li>
						</ul>
					</div>
	    		</td>
	    		<td>
	    			<div class="selectBox2 ">
						<input type="text" name="level" class="selector" value="${recipe.level}"
						placeholder="난이도" readonly="readonly">
						<ul class="optionList">
							<li class="optionItem">입문</li>
							<li class="optionItem">초급</li>
							<li class="optionItem">중급</li>
							<li class="optionItem">숙련자</li>
							<li class="optionItem">어려움</li>
							<li class="optionItem">전문가</li>
						</ul>
					</div>
	    		</td>
	    		<td></td>
	    	</tr>
	    </table>
	    <br><br>
	    
	    <h3 class="ingTitle">재료</h3>
	    <c:set var="begin" value="0"/>
	    <c:set var="end" value="${bundleCount[0]-1}"/>
	    <div id="ingredient" style="text-align: center; width: 850px;">
	    	<c:forEach var="writeNo" begin="1" end="${ingClass}" varStatus="i">
			    <table class="ingFt" id="write_ing${writeNo}" style="width: 800px;">
			    	<c:forEach var="ing" items="${ingredient}" varStatus="j"
			    	begin="${begin}" end="${end}">
				    	<c:if test="${j.count-1 == 0}">
					    	<tr>
					    		<th id="choose_class${writeNo}" rowspan="${bundleCount[i.count-1]}">
					    			<input type="text" class="ing_class" idx="${writeNo}"
					    			required="required" value="${ing.bundle}"
					    			autocomplete="off"><br>
					    			<button type="button" class="custom-btn btn-3 tab_delete">
					    				<span>삭제</span>
					    			</button>
					    			<button type="button" class="custom-btn btn-3 tab_up">
					    				<span>올리기</span>
					    			</button>
					    			<button type="button" class="custom-btn btn-3 tab_down">
					    				<span>내리기</span>
					    			</button>
					    		</th>
					    		<td>
					    			<input type="hidden" name="bundle" value="${ing.bundle}"
					    			class="forms ing_hidden${writeNo}">
					    			<input type="hidden" name="ingOrder" value="${ing.writeorder}">
					    			<input type="text" name="ingName" value="${ing.name}"
					    			class="forms ing_name" required="required"
					    			autocomplete="off">
					    		</td>
					    		<td>
					    			<input type="hidden" name="ingNum" value="${ing.num}"
					    			class="forms">
					    			<input type="text" name="quantity" value="${ing.quantity}"
					    			class="forms ing_quantity" required="required"
					    			autocomplete="off">
					    		</td>
					    		<td style="width: 40px;">
					    			<input type="hidden" name="ingDel" class="forms"
					    			value="u">
					    		</td>
					    	</tr>
				    	</c:if>
				    	<c:if test="${j.count-1 != 0}">
					    	<tr>
						    	<td>
						    		<input type="hidden" name="bundle" value="${ing.bundle}"
						    		class="forms ing_hidden${writeNo}">
						    		<input type="hidden" name="ingOrder" value="${ing.writeorder}">
						    		<input type="text" name="ingName" value="${ing.name}"
						    		class="forms ing_name" required="required"
						    		autocomplete="off">
						    	</td>
						    	<td>
						    		<input type="hidden" name="ingNum" value="${ing.num}"
					    			class="forms">
						    		<input type="text" name="quantity" value="${ing.quantity}"
						    		class="forms ing_quantity" required="required"
						    		autocomplete="off">
						    	</td>
						    	<td>
						    		<input type="hidden" name="ingDel" class="forms"
						    		value="u">
						    		<button type="button" class="col_delete custom-btn btn-8">
						    			<span>&ensp;X&ensp;</span>
						    		</button>
						    	</td>
						    </tr>
					    </c:if>
				    </c:forEach>
			    </table>
		    	<button type="button" class="custom-btn btn-5 ingPlus"
		    	onclick="col_append(${writeNo})">재료 추가</button>
		    	<c:set var="begin" value="${begin+bundleCount[i.count-1]}"/>
	    		<c:set var="end" value="${end+bundleCount[i.count]}"/>
	    	</c:forEach>
	    </div>
	    <button type="button" class="custom-btn btn-7" onclick="tab_append()">
	    	<span>&ensp;묶음 추가&ensp;</span>
	    </button>
	    <br><br><br>
	    
	    <h3 class="stepTitle">요리 순서</h3>
	    <table id="steps" style="width: 800px;">
	    	<c:forEach var="step" items="${steps}" varStatus="i" begin="0" end="${stepCount-1}">
	    	<tr>
	    		<th>
	    			<input type="hidden" name="stepNum" class="forms" value="${step.num}">
	    			<input type="hidden" name="stepDel" class="forms" value="u">
	    			<span class="glyphicon glyphicon-menu-up step_up"></span>
	    			<br>Step&ensp;
	    			<input type="text" name="stepSec" class="stepSec"
	    			value="${step.step}" readonly="readonly"><br>
	    			<span class="glyphicon glyphicon-menu-down step_down"></span>
	    		</th>
	    		<td>
	    			<textarea name="text" class="forms" required="required"
	    			style="resize: none; width: 400px; height: 150px;">${step.text}</textarea>
	    			<input type="hidden" name="text" value="split">
	    		</td>
	    		<td class="stepPhoto">
	    			<input type="hidden" name="stepPhotoDel" value="u">
	    			<label for="${i.count}" class="inputStepLabel">
	    				<c:if test="${step.photo!='no image'}">
							<img src="../upload/${step.photo}"
							style="width: 200px; height: 150px; object-fit: cover;">
						</c:if>
						<c:if test="${step.photo=='no image'}">
							<img src="../img/stepex${i.count%5}.jpg" class="inputStepLabel">
							<span class="stepImgHere">사진을 등록해주세요</span>
						</c:if>
					</label>
	    			<input type="file" name="upload_step" id="${i.count}" accept=".jpg, .jpeg, .png"
	    			style="opacity: 0; font-size: 0px;" class="forms smallPhoto">
	    		</td>
	    		<td style="width: 40px;">
					<button type="button" class="step_del custom-btn btn-8">
	    				<span>&ensp;X&ensp;</span>
	    			</button>
	    		</td>
	    	</tr>
	    	</c:forEach>
	    </table>
	    <div style="text-align: center; width: 850px;">
	    	<button type="button" class="custom-btn btn-5" onclick="step_append()">step 추가</button>
	    </div>
	    <br><br>

	    <h3 class="compTitle">완성된 요리 사진</h3>
	    <h5 class="compDet">(선택)다양한 구도에서 찍은 완성된 음식 사진을 올릴 수 있습니다</h5>
	    <table class="compFt" style="width: 800px; height: 200px;">
	    	<tr>
	    		<c:forTokens var="photo" items="${recipe.complete_photo}" delims="," varStatus="i">
	    			<td class="compPhoto" style="width: 200px; vertical-align: top;">
		    			<label for="com_photo${i.count}" class="inputCompLabel">
		    				<c:if test="${photo=='no image'}">
		    					<img src="../img/compex${i.count}.jpg" class="compStepLabel">
		    					<span class="stepImgHere">사진을 등록해주세요</span>
		    				</c:if>
		    				<c:if test="${photo!='no image'}">
			    				<img src="../upload/${photo}"
								style="width: 192px; height: 144px; object-fit: cover;">
		    				</c:if>
						</label>
		    			<input type="file" name="upload_complete" accept=".jpg, .jpeg, .png"
		    			id="com_photo${i.count}" style="opacity: 0; font-size: 0px;"
		    			class="forms miniPhoto">
		    			<input type="hidden" name="compDel" class="forms" value="u">
	    			</td>
	    		</c:forTokens>
	    	</tr>
	    </table>
	    <br><br>
	    
		<div class="content">
      		<div style="display: flex;">
    			<h3 class="tagTitle">태그 입력</h3>
     			<input type="text" id="tag" autocomplete="off"
     			placeholder="태그를 입력 후 [스페이스바]를 눌러서 저장해주세요">
        	</div>
        	<input type="hidden" id="tag-hidden" name="tags" class="forms" value="${recipe.tags}">
        	<ul id="tag-list">
        	</ul>
		</div>
	    <br><br><br><br>
	    
	    <div style="text-align: center; width: 850px;">
	    	<button type="submit" class="custom-btn btn-15">수정 완료</button>&emsp;
	    	<button type="button" class="custom-btn btn-14" onclick="location.href='/'">취소</button>
	    </div>
	</form>
</div>
</body>
</html>