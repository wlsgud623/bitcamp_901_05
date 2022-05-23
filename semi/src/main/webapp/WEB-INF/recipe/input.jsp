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
<style type="text/css">
	body *{
		border: 0px solid black;
	}
	#tag-list{
		list-style: none;
	}
	#tag-list li{
		font-size: 22.5px;
		float: left;
		margin-right: 20px;
		margin-top: 15px;
		border: 3px groove black;
		border-radius: 22.5px;
		padding-left: 15px;
		padding-right: 15px;
	}
	.ing_class{
		border: 1px solid gray;
	}
</style>
<script type="text/javascript">
/***************************전역 변수***************************/
	var ingClass=2; //다음에 추가될 재료묶음
	var stepCount=2; //다음에 추가될 요리단계
	var tag = {}; //태그
	var tagCounter = 0; //태그 idx

/***************************각종 이벤트***************************/
	$(function() {
		//메인 사진
		$("#inputPhoto").change(function() {
			img_preview("#inputPhoto", 800, 450);
		});
		
		//요리 단계별 사진
		$(document).on("change", ".smallPhoto", function() {
			img_preview("#"+$(this).attr("id"), 200, 150);
		});
		
		//완성 사진
		$(document).on("change", ".miniPhoto", function() {
			img_preview("#"+$(this).attr("id"), 192, 144);
			$("#del_btn_popup").remove();
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
			var tbody=tr.parent();
			var th=tbody.children().children().eq(0);
			
			var rs=$(th).attr("rowspan");
			$(th).attr("rowspan",rs-1);
			
			tr.remove();
		})
		
		//재료 묶음 지우기
		$(document).on("click", ".tab_delete", function() {
			var table=$(this).parent().parent().parent().parent();
			table.prev().remove();
			table.prev().remove();
			table.next().remove();
			table.remove();
		})
		
		//요리 단계 지우기
		$(document).on("click", ".step_del", function() {
			var tr=$(this).parent().parent();
			var nextTr="";
			
			if (tr.next().length==0 && tr.prev().length==0) {
				alert("최소 1개의 요리 단계를 작성해주십시오");
			} else {
				nextTr=tr.next();
				tr.remove();
				stepCount--;
			}

			while(nextTr.length!=0) {
				stepOrder(nextTr, -1);
				nextTr=nextTr.next();
			}
		})
		
		//요리 단계 up
		$(document).on("click", ".step_up", function() {
			var tr=$(this).parent().parent();
			
			if (tr.prev().length==0) {
				alert("첫번째 단계입니다");
			} else {
				var prevTr=tr.prev();
				
				stepOrder(tr, -1);
				stepOrder(prevTr, +1);
				
				$(prevTr).insertAfter(tr);
			}
		})
		
		//요리 단계 down
		$(document).on("click", ".step_down", function() {
			var tr=$(this).parent().parent();
			
			if (tr.next().length==0) {
				alert("마지막 단계입니다");
			} else {
				var nextTr=tr.next();
				
				stepOrder(tr, +1);
				stepOrder(nextTr, -1);
				
				$(tr).insertAfter(nextTr);
			}
		})
		
		//요리 단계 중간 추가
		$(document).on("click", ".step_insert", function() {
			var tr=$(this).parent().parent();
			var idx=stepIdx(tr)+1;
			var nextTr=tr.next();
			
			while(nextTr.length!=0) {
				stepOrder(nextTr, +1);
				nextTr=nextTr.next();
			}

			$(tr).after(stepTr(idx));
			stepCount++;
		});
		
		//완성사진 삭제 버튼생성
		$(".com_photo").hover(function() {
			$(this).append("<button type='button' style='float: right;'"
				+"class='btn btn-danger' id='del_btn_popup'>X</button>");
		}, function() {
			$("#del_btn_popup").remove();
		});
		
		//완성사진 삭제
		$(document).on("click", "#del_btn_popup", function() {
			$(this).prev().val("");
			$(this).prev().prev()
				.html('<br><br><img src="image/Upload-Icon.png" style="width: 70px;">');
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
						console.log($("#tag-hidden").val());
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
		
		//재료 칸 (,) 입력 방지
		$(document).on("keyup", ".ing_class, .ing_name, .ing_quantity", function(e) {
	    	if ( e.keyCode == 188 ) {
	    		var value=$(this).val();
	    		$(this).val(value.replace(",",""));
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
    	
		$("#write_ing"+i).append(ingTr(i, value, 0));
		
		var rs=$("#choose_class"+i).attr("rowspan");
		$("#choose_class"+i).attr("rowspan",parseInt(rs)+1);
	}
	
	//재료 묶음 추가
	function tab_append() {
		var str='<br><br>'
				+'<table class="table table-bordered" id="write_ing'+ingClass+'"'
				+'style="width: 800px;">'
    			+ingTr(ingClass, "", 1)
    			+ingTr(ingClass, "", 0)
    			+'</table>'
				+'<button type="button" class="btn btn-default"'
				+'onclick="col_append('+ingClass+')">재료 추가</button>';
		$("#ingredient").append(str);
		ingClass++;
	}
	
	//요리 단계 추가
	function step_append() {
		$("#steps").append(stepTr(stepCount));
		stepCount++;
	}
	
	//요리 단계 순서 조정 : 올릴땐 sign=-1, 내릴땐 sign=1
	function stepOrder(tr, sign) {
		var th=tr.children().eq(0);
		var td2=tr.children().eq(2);
		var idx=th.children().val();
		
		th.children().val(parseInt(idx)+sign);
		td2.children().eq(0).attr("for",parseInt(idx)+sign);
		td2.children().eq(1).attr("id",parseInt(idx)+sign);
	}
	
	//요리 단계 idx값 추출
	function stepIdx(tr) {
		var idx=tr.children().eq(0).children().val();
		return parseInt(idx);
	}
	
	//태그 추가
	function addTag(value) {
		tag[tagCounter] = value;
		tagCounter++;
	}
	
	//재료 추가 html : 첫행 first=0, 그 외 first=아무 값
	function ingTr(idx, val, first) {
		if (first==1) {
			return '<tr>'
				+'<th id="choose_class'+idx+'" rowspan="2" style="width: 240px;">'
				+'<input type="text" class="ing_class" idx="'+idx+'" required="required"'
				+'placeholder="재료묶음">'
				+'<br><br>'
				+'<button type="button" class="btn btn-default tab_delete"'
	    		+'style="font-size: 0.8rem; height: 25px;">삭제</button>'
				+'</th>'
				+'<td>'
				+'<input type="hidden" name="ing_class"'
				+'class="form-control ing_hidden'+idx+'" value="">'
				+'<input type="text" name="ing_name" class="form-control ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="text" name="ing_quantity" class="form-control ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td style="width: 40px;"></td>'
				+'</tr>';
		} else {
			return '<tr>'
				+'<td>'
				+'<input type="hidden" name="ing_class"'
				+'class="form-control ing_hidden'+idx+'" value="'+val+'">'
				+'<input type="text" name="ing_name" class="form-control ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="text" name="ing_quantity" class="form-control ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td>'
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
			+'<th>Step'
			+'<input type="text" name="step_sec" class="form-control"'
    		+'value="'+idx+'" readonly="readonly"'
	    	+'style="border: none; background-color: transparent; width: 40px;">'
			+'</th>'
			+'<td>'
			+'<textarea name="step_text" style="resize: none; width: 400px; height: 150px;"'
			+'class="form-control" required="required"'
			+'placeholder="조리법을 단계별로 자세히 적어주세요"></textarea>'
			+'<input type="hidden" name="step_text" value="split">'
			+'</td>'
			+'<td>'
			+'<label for="'+idx+'" style="text-align: center;'
			+'background-color: lightgray; width: 200px; height: 150px; cursor: pointer;">'
			+'<br><br><img src="../image/Upload-Icon.png" style="width: 70px;">'
			+'</label>'
			+'<input type="file" name="upload_step" id="'+idx+'" required="required"'
			+'class="form-control smallPhoto"'
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
<div style="position: absolute; top: 30px; left: 100px;">
	<h1>레시피 등록</h1>
	<form action="insert" method="post" class="form-inline" enctype="multipart/form-data">
		<label for="inputPhoto" style="text-align: center; background-color: lightgray;
		width: 800px; height: 450px; cursor: pointer;">
			<br><br><img src="../image/Upload-Icon.png" style="width: 200px;">
			<br><br><span style="font-size: 40px;">대표 사진을 등록해주세요</span>
		</label>
	    <input type="file" id="inputPhoto" name="upload_main" accept=".jpg, .jpeg, .png"
	    style="opacity: 0; font-size: 0px;" class="form-control" required="required">
	    
	    <table class="table table-default" style="width: 800px;">
	    	<tr>
	    		<th>레시피 제목</th>
	    		<td colspan="3">
	    			<input type="text" name="name" class="form-control" style="width: 690px;"
	    			placeholder="레시피의 이름을 적어주세요" required="required">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>레시피 소개</th>
	    		<td colspan="3">
	    			<textarea name="intro" style="resize: none; width: 690px; height: 75px;"
	    			class="form-control" placeholder="레시피에 대한 소개를 적어주세요"
	    			required="required"></textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>카테고리</th>
	    		<td>
	    			<select name="category" class="form-control" required="required"
	    			style="width: 150px;">
	    				<option value="" disabled="disabled" selected="selected"
	    				style="display: none;">종류별</option>
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
	    			<select name="main_ing" class="form-control" required="required"
	    			style="width: 150px;">
	    				<option value="" disabled="disabled" selected="selected"
	    				style="display: none;">재료별</option>
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
	    			<select name="cooking" class="form-control" required="required"
	    			style="width: 150px;">
	    				<option value="" disabled="disabled" selected="selected"
	    				style="display: none;">방법별</option>
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
	    			<select name="portion" class="form-control" required="required"
	    			style="width: 150px;">
	    				<option value="" disabled="disabled" selected="selected"
	    				style="display: none;">인분수</option>
	    				<option value=1>1인분</option>
	    				<option value=2>2인분</option>
	    				<option value=3>3인분</option>
	    				<option value=4>4인분 이상</option>
	    			</select>
	    		</td>
	    		<td>
	    			<select name="level" class="form-control" required="required"
	    			style="width: 150px;">
	    				<option value="" disabled="disabled" selected="selected"
	    				style="display: none;">난이도</option>
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
	    
	    <h3>재료</h3>
	    <div id="ingredient" style="text-align: center; width: 850px;">
		    <table class="table table-bordered" id="write_ing1" style="width: 800px;">
		    	<tr>
		    		<th id="choose_class1" rowspan="2" style="width: 240px;">
		    			<input type="text" class="ing_class" idx="1" required="required"
		    			placeholder="재료묶음">
		    		</th>
		    		<td>
		    			<input type="hidden" name="ing_class" class="form-control ing_hidden1"
		    			value="">
		    			<input type="text" name="ing_name" class="form-control ing_name"
		    			placeholder="예)돼지고기" required="required">
		    		</td>
		    		<td>
		    			<input type="text" name="ing_quantity" class="form-control ing_quantity"
		    			placeholder="예)300g" required="required">
		    		</td>
		    		<td style="width: 40px;"></td>
		    	</tr>
		    	<tr>
			    	<td>
			    		<input type="hidden" name="ing_class" class="form-control ing_hidden1"
			    		value="">
			    		<input type="text" name="ing_name" class="form-control ing_name"
			    		placeholder="예)돼지고기" required="required">
			    	</td>
			    	<td>
			    		<input type="text" name="ing_quantity" class="form-control ing_quantity"
			    		placeholder="예)300g" required="required">
			    	</td>
			    	<td>
			    		<button type="button" class="col_delete btn btn-danger">
			    			<span class="glyphicon glyphicon-remove"></span>
			    		</button>
			    	</td>
			    </tr>
		    </table>
	    	<button type="button" class="btn btn-default" onclick="col_append(1)">재료 추가</button>
	    </div>
	    <button type="button" class="btn btn-default" onclick="tab_append()">재료 묶음 추가</button>
	    <br><br><br>
	    
	    <h3>요리 순서</h3>
	    <table class="table table-default" id="steps" style="width: 800px;">
	    	<tr>
	    		<th style="width: 100px;">
	    			Step
	    			<input type="text" name="step_sec" class="form-control"
	    			value="1" readonly="readonly"
	    			style="border: none; background-color: transparent; width: 40px;">
	    		</th>
	    		<td>
	    			<textarea name="step_text" class="form-control" required="required"
	    			style="resize: none; width: 400px; height: 150px;"
	    			placeholder="조리법을 단계별로 자세히 적어주세요"></textarea>
	    			<input type="hidden" name="step_text" value="split">
	    		</td>
	    		<td>
	    			<label for="1" style="text-align: center; background-color: lightgray;
					width: 200px; height: 150px; cursor: pointer;">
						<br><br><img src="../image/Upload-Icon.png" style="width: 70px;">
					</label>
	    			<input type="file" name="upload_step" id="1" accept=".jpg, .jpeg, .png"
	    			style="opacity: 0; font-size: 0px;" class="form-control smallPhoto"
	    			required="required">
	    		</td>
	    		<td style="width: 40px;">
	    			<button type="button" class="step_up btn btn-info">
	    				<span class="glyphicon glyphicon-triangle-top"></span>
					</button>
					<button type="button" class="step_down btn btn-success">
	    				<span class="glyphicon glyphicon-triangle-bottom"></span>
					</button>
					<button type="button" class="step_del btn btn-danger">
	    				<span class="glyphicon glyphicon-remove"></span>
	    			</button>
	    			<button type="button" class="step_insert btn btn-warning">
	    				<span class="glyphicon glyphicon-plus"></span>
	    			</button>
	    		</td>
	    	</tr>
	    </table>
	    <div style="text-align: center; width: 850px;">
	    	<button type="button" class="btn btn-default" onclick="step_append()">step 추가</button>
	    </div>
	    <br><br>

	    <h3>완성된 요리 사진</h3>
	    <h5>(선택)다양한 구도에서 찍은 완성된 음식 사진을 올릴 수 있습니다</h5>
	    <table class="table table-default" style="width: 800px; height: 200px;">
	    	<tr>
	    		<c:forEach var="num" begin="1" end="4">
	    			<td class="com_photo" style="width: 200px; vertical-align: top;">
		    			<label for="com_photo${num}" style="text-align: center;
		    			background-color: lightgray; width: 192px; height: 144px;
		    			cursor: pointer;">
							<br><br><img src="../image/Upload-Icon.png" style="width: 70px;">
						</label>
		    			<input type="file" name="upload_complete" accept=".jpg, .jpeg, .png"
		    			id="com_photo${num}" style="opacity: 0; font-size: 0px;"
		    			class="form-control miniPhoto">
	    			</td>
	    		</c:forEach>
	    	</tr>
	    </table>
	    <br><br>
	    
		<div style="margin-top: 40px; margin-left: 40px;" class="content">
      		<div style="display: flex;">
    			<h3 style="width: 150px; margin-right:30px;">태그 입력</h3>
     			<input type="text" id="tag" style="width: 350px; border: 1px solid gray;"
     			placeholder="입력한 태그를 저장하려면 spacebar를 눌러주세요">
        	</div>
        	<input type="hidden" id="tag-hidden" name="tags" class="form-control" value="">
        	<ul id="tag-list" style="font-size: 15px;">
        	</ul>
		</div>
	    <br><br><br><br>
	    
	    <div style="text-align: center; width: 850px;">
	    	<button type="button" class="btn btn-default" disabled="disabled">중간저장(시간 남으면?)</button>&emsp;
	    	<button type="submit" class="btn btn-default">업로드</button>&emsp;
	    	<button type="button" class="btn btn-default" onclick="location.href='/'">취소</button>
	    </div>
	</form>
	<br><br><br>
</div>
</body>
</html>