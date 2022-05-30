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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="/css/update.css">
<style type="text/css">
	button.ingPlus{
		margin-bottom: 30px;
	}
	#stepPopup{
		position: relative;
		float: right;
		margin-top: -165px;
		margin-right: 15px;
		z-index: 10;
		color: crimson;
		font-size: 25px;
		cursor: pointer;
	}
	#delPopup{
		position: relative;
		float: right;
		margin-top: -160px;
		margin-right: 10px;
		z-index: 10;
		color: crimson;
		font-size: 25px;
		cursor: pointer;
	}
	.inputCompLabel{
		z-index: 1;
	}
	#steps th{
		text-align: center;
	}
	.step_up, .step_down{
		color: orange;
		font-size: 30px;
		cursor: pointer;
		padding-right: 15px;
		padding-top: 15px;
	}
</style>
<script type="text/javascript">
/***************************전역 변수***************************/
	var ingClass=${ingClass+1}; //다음에 추가될 재료묶음(idx)
	var writeOrder=${ingClass+1}; //다음에 추가될 재료묶음(writeorder)
	var stepCount=${stepCount+1}; //다음에 추가될 요리단계
	var tag = {}; //태그
	var tagCounter = 0; //태그 idx

/***************************각종 이벤트***************************/
	$(function() {
		//태그 불러오기
		showTag("${recipe.tags}");
		
		//메인 사진
		$("#inputPhoto").change(function() {
			img_preview("#inputPhoto", 800, 450);
		});
		
		//요리 단계별 사진
		$(document).on("change", ".smallPhoto", function() {
			img_preview("#"+$(this).attr("id"), 200, 150);
			
			if ($(this).prev().prev().val() == "d") {
				$(this).prev().prev().val("u");
			}
			
			$("#stepPopup").remove();
		});
		
		//완성 사진
		$(document).on("change", ".miniPhoto", function() {
			img_preview("#"+$(this).attr("id"), 192, 144);
			$("#delPopup").remove();
		});
		
		//각 재료를 재료묶음과 연결하기
		$(document).on("keyup", ".ing_class", function() {
			var value=$(this).val();
			var className=".ing_hidden"+$(this).attr("idx");
			$(className).val(value);
		})
		
		//재료 지우기
		$(document).on("click", ".col_delete", function() {
			var tr=$(this).parent().parent();
			if ($(this).prev().val() == "u") {
				$(this).prev().val("d");
				$(tr).css("display", "none");
			} else {
				var tbody=tr.parent();
				var th=tbody.children().children().eq(0);
				
				var rs=$(th).attr("rowspan");
				$(th).attr("rowspan",rs-1);
				
				tr.remove();
			}
		})
		
		//재료 묶음 지우기
		$(document).on("click", ".tab_delete", function() {
			var tr=$(this).parent().parent();
			var table=tr.parent().parent();
			var td=table.children().children().children();
			var nextTable="";
			
			var b=0;
			for (i = 1; i < ingClass; i++) {
				if (ingIfDel($("#write_ing"+i))=="u" || ingIfDel($("#write_ing"+i))=="n") {
					b++;
				}
			}
			if (b<2) {
				alert("최소 1개의 재료가 필요합니다");
				return;
			}
			
			if (table.prev().length==0 && table.next().next().length==0) {
				alert("최소 1개의 재료가 필요합니다");
			} else {
				nextTable=table.next().next();
				
				if (td.eq(3).children().eq(0).val() == "u") {
					for (i = 3; i < td.length; i+=3) {
						if (td.eq(i).length!=0 && td.eq(i).children().eq(0).val()!="n") {
							td.eq(i).children().eq(0).val("d");
						} else {
							td.eq(i).parent().remove();
						}
					}
					$(table).next().css("display", "none");
					$(table).css("display", "none");
				} else {
					table.next().remove();
					table.remove();
				}
				writeOrder--;
				
				while (nextTable.length!=0) {
					ingOrder(nextTable, -1);
					nextTable=nextTable.next().next();
				}
			}
		})
		
		//재료 묶음 up
		$(document).on("click", ".tab_up", function() {
			var table=$(this).parent().parent().parent().parent();
			var button=table.next();
			var prevTable=table.prev().prev();
			var prevButton="";
			
			var b=true;
			while (prevTable.length!=0) {
				if (ingIfDel(prevTable)!="d") {
					b=false;
				}
				prevTable=prevTable.prev().prev();
			}
			
			if (b) {
				alert("첫번째 묶음입니다");
				return;
			}
			
			if (table.prev().length==0) {
				alert("첫번째 묶음입니다");
			} else {
				prevTable=table.prev().prev();
				prevButton=button.prev().prev();
				while (ingIfDel(prevTable)=="d") {
					prevTable=prevTable.prev().prev();
					prevButton=prevButton.prev().prev();
				}
				
				ingOrder(table, -1);
				ingOrder(prevTable, +1);
				
				$(prevTable).insertAfter(button);
				$(prevButton).insertAfter(prevTable);
			}
		})
		
		//재료 묶음 down
		$(document).on("click", ".tab_down", function() {
			var table=$(this).parent().parent().parent().parent();
			var button=table.next();
			var nextTable=table.next().next();
			var nextButton="";
			
			var b=true;
			while (nextTable.length!=0) {
				if (ingIfDel(nextTable)!="d") {
					b=false;
				}
				nextTable=nextTable.next().next();
			}
			
			if (b) {
				alert("마지막 묶음입니다");
				return;
			}
			
			if (table.next().next().length==0) {
				alert("마지막 묶음입니다");
			} else {
				nextTable=table.next().next();
				nextButton=button.next().next();
				while (ingIfDel(nextTable)=="d") {
					nextTable=nextTable.next().next();
					nextButton=nextButton.next().next();
				}
				
				ingOrder(table, +1);
				ingOrder(nextTable, -1);
				
				$(table).insertAfter(nextButton);
				$(button).insertAfter(table);
			}
		})
		
		//요리 단계 지우기
		$(document).on("click", ".step_del", function() {
			var tr=$(this).parent().parent();
			var nextTr="";
			
			var i=0;
			var b=true;
			while (tr.siblings().eq(i).length != 0) {
				if (stepIfDel(tr.siblings().eq(i)) != "d") {
					b=false;
				}
				i++;
			}
			if (b) {
				alert("최소 1개의 요리 단계가 필요합니다");
				return;
			}
			
			if (tr.next().length==0 && tr.prev().length==0) {
				alert("최소 1개의 요리 단계가 필요합니다");
			} else {
				nextTr=tr.next();
				if (stepIfDel(tr) == "u") {
					stepOrder(tr, 999, 1);
					$(tr).css("display", "none");
				} else {
					tr.remove();
				}
				stepCount--;
				
				while(nextTr.length!=0) {
					stepOrder(nextTr, -1, 0);
					nextTr=nextTr.next();
				}
			}
		})
		
		//요리 단계 up
		$(document).on("click", ".step_up", function() {
			var tr=$(this).parent().parent();
			var prevTr=tr.prev();
			
			var b=true;
			while (prevTr.length != 0) {
				if (stepIfDel(prevTr) != "d") {
					b=false;
				}
				prevTr=prevTr.prev();
			}
			
			if (b) {
				alert("첫번째 단계입니다");
				return;
			}
			
			if (tr.prev().length == 0) {
				alert("첫번째 단계입니다");
			} else {
				prevTr=tr.prev();
				
				stepOrder(tr, -1, 0);
				stepOrder(prevTr, +1, 0);
				
				$(prevTr).insertAfter(tr);
			}
		})
		
		//요리 단계 down
		$(document).on("click", ".step_down", function() {
			var tr=$(this).parent().parent();
			var nextTr=tr.next();
			
			var b=true;
			while (nextTr.length != 0) {
				if (stepIfDel(nextTr) != "d") {
					b=false;
				}
				nextTr=nextTr.next();
			}
			
			if (b) {
				alert("마지막 단계입니다");
				return;
			}
			
			if (tr.next().length == 0) {
				alert("마지막 단계입니다");
			} else {
				nextTr=tr.next();
				
				stepOrder(tr, +1, 0);
				stepOrder(nextTr, -1, 0);
				
				$(tr).insertAfter(nextTr);
			}
		})
		
		//요리 단계 중간 추가
		$(document).on("click", ".step_insert", function() {
			var tr=$(this).parent().parent();
			var idx=stepIdx(tr)+1;
			var nextTr=tr.next();
			
			while(nextTr.length!=0) {
				stepOrder(nextTr, +1, 0);
				nextTr=nextTr.next();
			}

			$(tr).after(stepTr(idx));
			stepCount++;
		});
		
		//단계사진 삭제 버튼생성
		$(document).on("mouseenter", ".stepPhoto", function() {
			$(this).append("<span class='glyphicon glyphicon-remove'"
					+"id='stepPopup' title='사진삭제'></span>");
		});
		$(document).on("mouseleave", ".stepPhoto", function() {
			$("#stepPopup").remove();
		});
		
		//단계사진 삭제
		$(document).on("click", "#stepPopup", function() {
			if ($(this).parent().children().eq(0).val() == "u") {
				$(this).parent().children().eq(0).val("d");
			}
			
			$(this).prev().val("");
			$(this).prev().prev()
				.html('<br><img src="../image/Upload-Icon.png" style="width: 70px;">'
					+'<br><br><span style="font-size: 20px;">사진을 등록해주세요</span>');
		});
		
		//완성사진 삭제 버튼생성
		$(".compPhoto").hover(function() {
			$(this).append("<span class='glyphicon glyphicon-remove'"
					+"id='delPopup' title='사진삭제'></span>");
		}, function() {
			$("#delPopup").remove();
		});
		
		//완성사진 삭제
		$(document).on("click", "#delPopup", function() {
			$(this).prev().val("d");
			$(this).prev().prev().val("");
			$(this).prev().prev().prev()
				.html('<br><img src="../image/Upload-Icon.png" style="width: 70px;">'
					+'<br><br><span style="font-size: 19px;">사진을 등록해주세요</span>');
		});
		
		//태그
		$("#tag").on("keyup", function (e) {
			var self = $(this);
			
			if (e.keyCode == 32) {
				var tagValue = self.val();
				tagValue=tagValue.substring(0, tagValue.length-1);
				
				if (tagValue !== "") {
					var result = Object.values(tag).filter(function (word) {
		   				return word === tagValue;
					})
					
					if (result.length == 0) {
		  				$("#tag-list").append("<li class='tag-item'>" + "#" + tagValue
		  					+ "&ensp;<span class='del-btn glyphicon glyphicon-remove'"
		  					+ "style='color: crimson; cursor: pointer; font-size: 18px;'"
		  					+ "idx='" + tagCounter + "'></span></li>");
		       			addTag(tagValue);
		       			//submit 목록에 추가
						var tags=$("#tag-hidden").val();
						if (tags!="")
							tags+=",";
						tags+=tagValue;
						$("#tag-hidden").val(tags);
		 			} else {
		 				alert("태그값이 중복됩니다.");
		 			}
				}
				
				e.preventDefault();
     			self.val("");
			}
		});
		
		//태그 삭제
		$(document).on("click", ".del-btn", function (e) {
			var index = $(this).attr("idx");
			var delTag=tag[index];
			tag[index] = "";
		 	$(this).parent().remove();
		 	//submit 목록에서 제거
		 	var tags=$("#tag-hidden").val();
		 	var ifLast=tags.length-delTag.length;

		 	if (","+delTag==tags.substr(ifLast-1)) {
		 		tags=tags.substring(0, ifLast-1);
		 	} else if (delTag+","==tags.substring(0, delTag.length+1)) {
				tags=tags.substr(delTag.length+1);
			} else if (ifLast==0) {
				tags="";
			} else {
				tags=tags.replace(","+delTag+",",",");
			}
		 	$("#tag-hidden").val(tags);
		});
		
		//재료 칸 (,) 입력 방지
		$(document).on("keydown", ".ing_class, .ing_name, .ing_quantity", function(e) {
	    	if ( e.keyCode == 188 ) {
	    		var value=$(this).val();
	    		$(this).val(value.replace(",",""));
	    	}
		});
		$(document).on("keyup", ".ing_class, .ing_name, .ing_quantity", function(e) {
	    	if ( e.keyCode == 188 ) {
	    		var value=$(this).val();
	    		$(this).val(value.replace(",",""));
	    	}
		});
		
		//태그 칸 (#) 입력 방지
		$(document).on("keydown", "#tag", function(e) {
	    	if ( e.keyCode == 51 ) {
	    		var value=$(this).val();
	    		$(this).val(value.replace("#",""));
	    	}
		});
		$(document).on("keyup", "#tag", function(e) {
	    	if ( e.keyCode == 51 ) {
	    		var value=$(this).val();
	    		$(this).val(value.replace("#",""));
	    	}
		});
	});

/***************************전역 함수***************************/
	//사진 미리보기
	function img_preview(id, w, h) {
		var reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
		var file=$(id)[0].files[0];
		if (!file.type.match(reg)){
			alert("이미지 파일이 아닙니다.");
			return;
		}
		
		var reader=new FileReader();
		reader.onload=function(e) {
			var str="<img src='"+e.target.result
					+"' style='width: "+w+"px; height: "+h+"px; object-fit: cover;'>";
			$(id).prev().html(str);
		}
		reader.readAsDataURL($(id)[0].files[0]);
	}
	
	//재료 추가
	function col_append(i) {
    	var value=$(".ing_hidden"+i).val();
    	var td1=$("#write_ing"+i).children().children().eq(0).children().eq(1);
    	var order=td1.children().eq(1).val();
    	
		$("#write_ing"+i).append(ingTr(i, value, order));
		
		var rs=$("#choose_class"+i).attr("rowspan");
		$("#choose_class"+i).attr("rowspan",parseInt(rs)+1);
	}
	
	//재료 묶음 추가
	function tab_append() {
		var str='<table class="ingFt" id="write_ing'+ingClass+'"'
				+'style="width: 800px;">'
				+ingTr(ingClass, "", 0)
				+ingTr(ingClass, "", writeOrder)
				+'</table>'
				+'<button type="button" class="btn btn-default ingPlus"'
				+'onclick="col_append('+ingClass+')">재료 추가</button>';
		$("#ingredient").append(str);
		ingClass++;
		writeOrder++;
	}
	
	//재료 묶음 순서 조정 : 올릴땐 sign=-1, 내릴땐 sign=1
	function ingOrder(table, sign) {
		var tr=table.children().children();
		var firstTd1=tr.eq(0).children().eq(1);
		var value=firstTd1.children().eq(1).val();
		firstTd1.children().eq(1).val(parseInt(value)+sign);

		for (i=1; tr.eq(i).length!=0; i++) {
			var td1=tr.eq(i).children().eq(0);
			var value=td1.children().eq(1).val();
			td1.children().eq(1).val(parseInt(value)+sign);
		}
	}
	
	//재료 묶음 ingDel값 추출
	function ingIfDel(table) {
		var ingDel=table.children().children().eq(0).children().eq(3).children().eq(0).val();
		return ingDel;
	}
	
	//요리 단계 추가
	function step_append() {
		$("#steps").append(stepTr(stepCount));
		stepCount++;
	}
	
	//요리 단계 순서 조정 : 올릴땐 sign=-1, 내릴땐 sign=1
	function stepOrder(tr, sign, ifDel) {
		var th=tr.children().eq(0);
		var td2=tr.children().eq(2);
		var idx=th.children().eq(4).val();
		
		if (ifDel==1) {
			th.children().eq(1).val("d");
		}
		
		th.children().eq(4).val(parseInt(idx)+sign);
		td2.children().eq(0).attr("for",parseInt(idx)+sign);
		td2.children().eq(1).attr("id",parseInt(idx)+sign);
	}
	
	//요리 단계 idx값 추출
	function stepIdx(tr) {
		var idx=tr.children().eq(0).children().eq(4).val();
		return parseInt(idx);
	}
	
	//요리 단계 stepDel값 추출
	function stepIfDel(tr) {
		var stepDel=tr.children().eq(0).children().eq(1).val();
		return stepDel;
	}
	
	//태그 추가
	function addTag(value) {
		tag[tagCounter] = value;
		tagCounter++;
	}
	
	//태그 불러오기
	function showTag(value) {
		if (value=="no tag") {
			return;
		}
		
		var str=[];
		str=value.split(",");
		for (i = 0; i < str.length; i++) {
			$("#tag-list").append("<li class='tag-item'>" + "#" + str[i]
  					+ "&ensp;<span class='del-btn glyphicon glyphicon-remove'"
  					+ "style='color: crimson; cursor: pointer; font-size: 18px;'"
  					+ "idx='" + tagCounter + "'></span></li>");
			
			tag[tagCounter]=str[i];
			tagCounter++;
		}
	}
	
	//재료 추가 html : 첫행 first=0, 그 외 first=아무 값
	function ingTr(idx, val, ingorder) {
		if (ingorder==0) {
			return '<tr>'
				+'<th id="choose_class'+idx+'" rowspan="2">'
				+'<input type="text" class="ing_class" idx="'+idx+'" required="required"'
				+'placeholder="재료묶음"><br>'
				+'<button type="button" class="btn btn-default tab_delete"'
    			+'style="font-size: 0.8rem; height: 25px;">삭제</button>'
    			+'<button type="button" class="btn btn-default tab_up"'
    			+'style="font-size: 0.8rem; height: 25px;">위로</button>'
    			+'<button type="button" class="btn btn-default tab_down"'
    			+'style="font-size: 0.8rem; height: 25px;">아래로</button>'
				+'</th>'
				+'<td>'
				+'<input type="hidden" name="bundle"'
				+'class="forms ing_hidden'+idx+'" value="">'
				+'<input type="text" name="ingOrder" value="'+writeOrder+'">'
				+'<input type="text" name="ingName" class="forms ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingNum" value="new" class="forms">'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td style="width: 40px;">'
				+'<input type="hidden" name="ingDel" class="forms" value="n">'
				+'</td>'
				+'</tr>';
		} else {
			return '<tr>'
				+'<td>'
				+'<input type="hidden" name="bundle"'
				+'class="forms ing_hidden'+idx+'" value="'+val+'">'
				+'<input type="text" name="ingOrder" value="'+ingorder+'">'
				+'<input type="text" name="ingName" class="forms ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingNum" value="new" class="forms">'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingDel" class="forms" value="n">'
				+'<button type="button" class="col_delete btn btn-danger">'
				+'<span class="glyphicon glyphicon-remove"></span>'
				+'</button>'
	    		+'</td>'
				+'</tr>';
		}
		
	}
	
	//단계 추가 html
	function stepTr(idx) {
		return '<tr>'
			+'<th>'
			+'<input type="hidden" name="stepNum" class="forms" value="new">'
			+'<input type="hidden" name="stepDel" class="forms" value="n">'
			+'<span class="glyphicon glyphicon-menu-up step_up"></span>'
			+'<br>Step&ensp;'
			+'<input type="text" name="stepSec" class="stepSec"'
    		+'value="'+idx+'" readonly="readonly"><br>'
    		+'<span class="glyphicon glyphicon-menu-down step_down"></span>'
			+'</th>'
			+'<td>'
			+'<textarea name="text" style="resize: none; width: 400px; height: 150px;"'
			+'class="forms" required="required"'
			+'placeholder="조리법을 단계별로 자세히 적어주세요"></textarea>'
			+'<input type="hidden" name="text" value="split">'
			+'</td>'
			+'<td class="stepPhoto">'
			+'<input type="hidden" name="stepPhotoDel" value="n">'
			+'<label for="'+idx+'" class="inputStepLabel">'
			+'<img src="../img/stepex'+(idx%5)+'.jpg" class="inputStepLabel">'
			+'<span class="stepImgHere">사진을 등록해주세요</span>'
			+'</label>'
			+'<input type="file" name="upload_step" id="'+idx+'" class="forms smallPhoto"'
			+'style="opacity: 0; font-size: 0px;" accept=".jpg, .jpeg, .png">'
			+'</td>'
			+'<td>'
			+'<button type="button" class="step_up btn btn-info">'
			+'<span class="glyphicon glyphicon-triangle-top"></span>'
			+'</button>'
			+'<button type="button" class="step_down btn btn-success">'
			+'<span class="glyphicon glyphicon-triangle-bottom"></span>'
			+'</button>'
			+'<button type="button" class="step_del btn btn-danger">'
			+'<span class="glyphicon glyphicon-remove"></span>'
			+'</button>'
			+'<button type="button" class="step_insert btn btn-warning">'
			+'<span class="glyphicon glyphicon-plus"></span>'
			+'</button>'
			+'</td>'
			+'</tr>';
	}
</script>
</head>
<body>
<div class="inputMain">
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
	    			value="${recipe.name}" required="required">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>레시피 소개</th>
	    		<td colspan="3">
	    			<textarea name="intro" style="resize: none; width: 640px; height: 95px;"
	    			class="forms" required="required">${recipe.intro}</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>카테고리</th>
	    		<td>
	    			<select name="category" class="forms" required="required">
	    				<option value="${recipe.category}" selected="selected"
	    				style="display: none;">${recipe.category}</option>
	    				<option value="밥/죽">밥/죽</option>
	    				<option value="반찬">반찬</option>
	    				<option value="국물">국물</option>
	    				<option value="면">면</option>
	    				<option value="디저트">디저트</option>
	    				<option value="양식">양식</option>
	    				<option value="일식">일식</option>
	    				<option value="중식">중식</option>
	    				<option value="퓨전">퓨전</option>
	    				<option value="떡/만두">떡/만두</option>
	    				<option value="빵/과자">빵/과자</option>
	    				<option value="양념/소스">양념/소스</option>
	    				<option value="샐러드">샐러드</option>
	    				<option value="음료">음료</option>
	    				<option value="기타">기타</option>
	    			</select>
	    		</td>
	    		<td>
	    			<select name="main_ing" class="forms" required="required">
	    				<option value="${recipe.main_ing}" selected="selected"
	    				style="display: none;">${recipe.main_ing}</option>
	    				<option value="소고기">소고기</option>
	    				<option value="돼지고기">돼지고기</option>
	    				<option value="닭고기">닭고기</option>
	    				<option value="육류">육류</option>
	    				<option value="해물">해물</option>
	    				<option value="채소류/버섯">채소류/버섯</option>
	    				<option value="계란/유제품">계란/유제품</option>
	    				<option value="쌀">쌀</option>
	    				<option value="밀가루">밀가루</option>
	    				<option value="콩/견과류">콩/견과류</option>
	    				<option value="기타">기타</option>
	    			</select>
	    		</td>
	    		<td>
	    			<select name="cooking" class="forms" required="required">
	    				<option value="${recipe.cooking}" selected="selected"
	    				style="display: none;">${recipe.cooking}</option>
	    				<option value="구이">구이</option>
	    				<option value="찜">찜</option>
	    				<option value="끓임">끓임</option>
	    				<option value="볶음">볶음</option>
	    				<option value="튀김">튀김</option>
	    				<option value="조림">조림</option>
	    				<option value="부침">부침</option>
	    				<option value="무침">무침</option>
	    				<option value="비빔">비빔</option>
	    				<option value="삶음">삶음</option>
	    				<option value="회">회</option>
	    				<option value="절임">절임</option>
	    				<option value="데치기">데치기</option>
	    				<option value="기타">기타</option>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>요리 정보</th>
	    		<td>
	    			<select name="portion" class="forms" required="required">
	    				<option value="${recipe.portion}" selected="selected"
	    				style="display: none;">${recipe.portion}인분</option>
	    				<option value=1>1인분</option>
	    				<option value=2>2인분</option>
	    				<option value=3>3인분</option>
	    				<option value=4>4인분 이상</option>
	    			</select>
	    		</td>
	    		<td>
	    			<select name="level" class="forms" required="required">
	    				<option value="${recipe.level}" selected="selected"
	    				style="display: none;">${recipe.level}</option>
	    				<option value="입문">입문</option>
	    				<option value="초급">초급</option>
	    				<option value="중급">중급</option>
	    				<option value="숙련자">숙련자</option>
	    				<option value="어려움">어려움</option>
	    				<option value="전문가">전문가</option>
	    			</select>
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
					    			required="required" value="${ing.bundle}">
					    			<button type="button" class="btn btn-default tab_delete"
				    				style="font-size: 0.8rem; height: 25px;">삭제</button>
				    				<button type="button" class="btn btn-default tab_up"
				    				style="font-size: 0.8rem; height: 25px;">위로</button>
				    				<button type="button" class="btn btn-default tab_down"
				    				style="font-size: 0.8rem; height: 25px;">아래로</button>
					    		</th>
					    		<td>
					    			<input type="hidden" name="bundle" value="${ing.bundle}"
					    			class="forms ing_hidden${writeNo}">
					    			<input type="text" name="ingOrder" value="${ing.writeorder}">
					    			<input type="text" name="ingName" value="${ing.name}"
					    			class="forms ing_name" required="required">
					    		</td>
					    		<td>
					    			<input type="hidden" name="ingNum" value="${ing.num}"
					    			class="forms">
					    			<input type="text" name="quantity" value="${ing.quantity}"
					    			class="forms ing_quantity" required="required">
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
						    		<input type="text" name="ingOrder" value="${ing.writeorder}">
						    		<input type="text" name="ingName" value="${ing.name}"
						    		class="forms ing_name" required="required">
						    	</td>
						    	<td>
						    		<input type="hidden" name="ingNum" value="${ing.num}"
					    			class="forms">
						    		<input type="text" name="quantity" value="${ing.quantity}"
						    		class="forms ing_quantity" required="required">
						    	</td>
						    	<td>
						    		<input type="hidden" name="ingDel" class="forms"
						    		value="u">
						    		<button type="button" class="col_delete btn btn-danger">
						    			<span class="glyphicon glyphicon-remove"></span>
						    		</button>
						    	</td>
						    </tr>
					    </c:if>
				    </c:forEach>
			    </table>
		    	<button type="button" class="btn btn-default ingPlus"
		    	onclick="col_append(${writeNo})">재료 추가</button>
		    	<c:set var="begin" value="${begin+bundleCount[i.count-1]}"/>
	    		<c:set var="end" value="${end+bundleCount[i.count]}"/>
	    	</c:forEach>
	    </div>
	    <button type="button" class="btn btn-default" onclick="tab_append()">재료 묶음 추가</button>
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
							<span style="font-size: 20px;">사진을 등록해주세요</span>
						</c:if>
					</label>
	    			<input type="file" name="upload_step" id="${i.count}" accept=".jpg, .jpeg, .png"
	    			style="opacity: 0; font-size: 0px;" class="forms smallPhoto">
	    		</td>
	    		<td style="width: 40px;">
					<button type="button" class="step_del btn btn-danger">
	    				<span class="glyphicon glyphicon-remove"></span>
	    			</button>
	    			<button type="button" class="step_insert btn btn-warning">
	    				<span class="glyphicon glyphicon-plus"></span>
	    			</button>
	    		</td>
	    	</tr>
	    	</c:forEach>
	    </table>
	    <div style="text-align: center; width: 850px;">
	    	<button type="button" class="btn btn-default" onclick="step_append()">step 추가</button>
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
     			<input type="text" id="tag" placeholder="입력한 태그 저장하기 : spacebar">
        	</div>
        	<input type="hidden" id="tag-hidden" name="tags" class="forms" value="${recipe.tags}">
        	<ul id="tag-list">
        	</ul>
		</div>
	    <br><br><br><br>
	    
	    <div style="text-align: center; width: 850px;">
	    	<button type="submit" class="btn btn-default">수정</button>&emsp;
	    	<button type="button" class="btn btn-default" onclick="location.href='/'">취소</button>
	    </div>
	</form>
</div>
</body>
</html>