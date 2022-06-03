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
<link rel="stylesheet" href="/css/input.css">
<link rel="stylesheet" href="/css/button.css">
<script src="/js/input.js"></script>
<script type="text/javascript">
	$(function() {
		//로그인 체크
		if (${sessionScope.loginok != 'yes'}) {
			alert("로그인 후 이용해주세요");
			location.href="/login";
		}
	});
</script>
</head>
<body>
<div class="container inputMain" id="input">
	<h1 class="inputTitle">레시피 작성하기</h1>
	<br>
	<form action="insert" method="post" id="iForm" class="form-inline" enctype="multipart/form-data">
		<label for="inputPhoto" class="inputMainLabel">
			<img src="../img/blog-6.jpg" class="inputMainLabel">
			<span id="inputMainLabel">대표 사진을 등록해주세요</span>
		</label>
	    <input type="file" id="inputPhoto" name="upload_main" accept=".jpg, .jpeg, .png"
	    style="opacity: 0; font-size: 0px;" class="forms" required="required">
	    <br><br>
	    
	    <table class="mainFt" style="width: 800px;">
	    	<tr>
	    		<th>레시피 제목</th>
	    		<td colspan="3">
	    			<input type="text" name="name" class="forms" style="width: 640px;"
	    			placeholder="레시피의 이름을 적어주세요" required="required"
	    			autocomplete="off">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>레시피 소개</th>
	    		<td colspan="3">
	    			<textarea name="intro" style="resize: none; width: 640px; height: 150px;"
	    			class="forms" placeholder="레시피에 대한 소개를 적어주세요"
	    			required="required"></textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>카테고리</th>
	    		<td width="240">
	    			<div class="selectBox2 ">
						<input type="text" name="category" class="selector" value=""
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
						<input type="text" name="main_ing" class="selector" value=""
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
						<input type="text" name="cooking" class="selector" value=""
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
						<input type="text" name="portions" class="selector" value=""
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
						<input type="text" name="level" class="selector" value=""
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
	    <div id="ingredient" style="text-align: center; width: 850px; margin-bottom: -25px;">
		    <table class="ingFt" id="write_ing1" style="width: 800px;">
		    	<tr>
		    		<th id="choose_class1" rowspan="2">
		    			<input type="text" class="ing_class" idx="1" required="required"
		    			placeholder="재료묶음" autocomplete="off"><br>
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
		    			<input type="hidden" name="bundle" class="forms ing_hidden1"
		    			value="">
		    			<input type="hidden" name="ingOrder" value="1">
		    			<input type="text" name="ingName" class="forms ing_name"
		    			placeholder="예)돼지고기" required="required" autocomplete="off">
		    		</td>
		    		<td>
		    			<input type="text" name="quantity" class="forms ing_quantity"
		    			placeholder="예)300g" required="required">
		    		</td>
		    		<td style="width: 40px;"></td>
		    	</tr>
		    	<tr>
			    	<td>
			    		<input type="hidden" name="bundle" class="forms ing_hidden1"
			    		value="">
			    		<input type="hidden" name="ingOrder" value="1">
			    		<input type="text" name="ingName" class="forms ing_name"
			    		autocomplete="off" required="required">
			    	</td>
			    	<td>
			    		<input type="text" name="quantity" class="forms ing_quantity"
			    		autocomplete="off" required="required">
			    	</td>
			    	<td>
			    		<button type="button" class="col_delete custom-btn btn-8">
			    			<span>&ensp;X&ensp;</span>
			    		</button>
			    	</td>
			    </tr>
		    </table>
	    	<button type="button" class="custom-btn btn-5 ingPlus" onclick="col_append(1)">재료 추가</button>
	    </div>
	    <button type="button" class="custom-btn btn-7" onclick="tab_append()">
	    	<span>&ensp;묶음 추가&ensp;</span>
	    </button>
	    <br><br><br>

	    <h3 class="stepTitle">요리 순서</h3>
	    <table id="steps" style="width: 800px;">
	    	<tr>
	    		<th>
	    			<span class="glyphicon glyphicon-menu-up step_up"></span>
	    			<br>Step&ensp;
	    			<input type="text" name="stepSec" class="stepSec"
	    			value="1" readonly="readonly"><br>
	    			<span class="glyphicon glyphicon-menu-down step_down"></span>
	    		</th>
	    		<td>
	    			<textarea name="text" class="forms" required="required"
	    			style="resize: none; width: 400px; height: 150px;"
	    			placeholder="조리법을 단계별로 자세히 적어주세요"></textarea>
	    			<input type="hidden" name="text" value="split">
	    		</td>
	    		<td class="stepPhoto">
	    			<label for="1" class="inputStepLabel">
						<img src="../img/stepex1.jpg" class="inputStepLabel">
						<span class="stepImgHere">사진을 등록해주세요</span>
					</label>
	    			<input type="file" name="upload_step" id="1" accept=".jpg, .jpeg, .png"
	    			style="opacity: 0; font-size: 0px;" class="forms smallPhoto">
	    		</td>
	    		<td style="width: 40px;">
					<button type="button" class="step_del custom-btn btn-8">
	    				<span>&ensp;X&ensp;</span>
	    			</button>
	    		</td>
	    	</tr>
	    </table>
	    <div style="text-align: center; width: 850px;">
	    	<button type="button" class="custom-btn btn-5" onclick="step_append()">STEP 추가</button>
	    </div>
	    <br><br>

	    <h3 class="compTitle">완성된 요리 사진</h3>
	    <h5 class="compDet">(선택)다양한 구도에서 찍은 완성된 음식 사진을 올릴 수 있습니다</h5>
	    <table class="compFt" style="width: 800px; height: 200px;">
	    	<tr>
	    		<c:forEach var="num" begin="1" end="4">
	    			<td class="compPhoto" style="width: 200px; vertical-align: top;">
		    			<label for="com_photo${num}" class="inputCompLabel">
							<img src="../img/compex${num}.jpg" class="compStepLabel">
							<span class="stepImgHere">사진을 등록해주세요</span>
						</label>
		    			<input type="file" name="upload_complete" accept=".jpg, .jpeg, .png"
		    			id="com_photo${num}" style="opacity: 0; font-size: 0px;"
		    			class="forms miniPhoto">
	    			</td>
	    		</c:forEach>
	    	</tr>
	    </table>
	    <br><br>
	    
		<div class="content">
      		<div style="display: flex;">
    			<h3 class="tagTitle">태그 입력</h3>
     			<input type="text" id="tag" autocomplete="off"
     			placeholder="태그를 입력 후 [스페이스바]를 눌러서 저장해주세요">
        	</div>
        	<input type="hidden" id="tag-hidden" name="tags" class="forms" value="">
        	<ul id="tag-list">
        	</ul>
		</div>
	    <br><br><br><br>
	    
	    <div style="text-align: center; width: 850px;">
	    	<button type="submit" class="custom-btn btn-15">&ensp;작성 완료&ensp;</button>&emsp;
	    	<button type="button" class="custom-btn btn-14" onclick="location.href='/'">취소</button>
	    </div>
	</form>
</div>
</body>
</html>