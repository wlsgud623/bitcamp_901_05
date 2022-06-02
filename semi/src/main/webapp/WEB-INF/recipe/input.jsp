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
<link rel="stylesheet" href="/css/input.css">
<link rel="stylesheet" href="/css/button.css">
<script type="text/javascript">
/***************************전역 변수***************************/
	var ingClass=2; //다음에 추가될 재료묶음(idx)
	var writeOrder=2; //다음에 추가될 재료묶음(writeorder)
	var stepCount=2; //다음에 추가될 요리단계
	var tag = {}; //태그
	var tagCounter = 0; //태그 idx

/***************************각종 이벤트***************************/
	$(function() {
		//로그인 체크
		if (${sessionScope.loginok != 'yes'}) {
			alert("로그인 후 이용해주세요");
			location.href="/login";
		}
		
		//메인 사진
		$("#inputPhoto").change(function() {
			img_preview("#inputPhoto", 800, 450);
		});
		
		//요리 단계별 사진
		$(document).on("change", ".smallPhoto", function() {
			img_preview("#"+$(this).attr("id"), 200, 150);
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
			var tbody=tr.parent();
			var th=tbody.children().children().eq(0);
			
			var rs=$(th).attr("rowspan");
			$(th).attr("rowspan",rs-1);
			
			tr.remove();
		})
		
		//재료 묶음 지우기
		$(document).on("click", ".tab_delete", function() {
			var table=$(this).parent().parent().parent().parent();
			var nextTable="";
			
			if (table.prev().length==0 && table.next().next().length==0) {
				alert("최소 1개의 재료를 작성해주십시오");
			} else {
				nextTable=table.next().next();
				table.next().remove();
				table.remove();
				writeOrder--;
			}
			
			while (nextTable.length!=0) {
				ingOrder(nextTable, -1);
				nextTable=nextTable.next().next();
			}
		})
		
		//재료 묶음 up
		$(document).on("click", ".tab_up", function() {
			var table=$(this).parent().parent().parent().parent();
			var button=table.next();
			
			if (table.prev().length==0) {
				alert("첫번째 묶음입니다");
			} else {
				var prevTable=table.prev().prev();
				var prevButton=button.prev().prev();
				
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
			
			if (table.next().next().length==0) {
				alert("마지막 묶음입니다");
			} else {
				var nextTable=table.next().next();
				var nextButton=button.next().next();
				
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
			
			if (tr.next().length==0 && tr.prev().length==0) {
				alert("최소 1개의 요리 단계를 작성해주십시오");
			} else {
				nextTr=tr.next();
				tr.remove();
				stepCount--;
			}

			while (nextTr.length!=0) {
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
			$(this).prev().val("");
			$(this).prev().prev()
				.html('<img src="../img/gray.jpg" class="inputStepLabel">'
						+'<span class="stepImgHere">사진을 등록해주세요</span>');
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
			$(this).prev().val("");
			$(this).prev().prev()
				.html('<img src="../img/gray.jpg" class="compStepLabel">'
						+'<span class="stepImgHere">사진을 등록해주세요</span>');
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
		
		//엔터키 막기
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
		});
		
		//드롭다운 메뉴바
		const label = document.querySelectorAll('.label');
		label.forEach(function(lb){
		    lb.addEventListener('click', e => {
		        let optionList = lb.nextElementSibling;
		        let optionItems = optionList.querySelectorAll('.optionItem');
		        clickLabel(lb, optionItems);
		    })
		});
		const clickLabel = (lb, optionItems) => {
		    if(lb.parentNode.classList.contains('active')) {
		        lb.parentNode.classList.remove('active');
		        optionItems.forEach((opt) => {
		            opt.removeEventListener('click', () => {
		                handleSelect(lb, opt)
		            })
		        })
		    } else {
		        lb.parentNode.classList.add('active');
		        optionItems.forEach((opt) => {
		            opt.addEventListener('click', () => {
		                handleSelect(lb, opt)
		            })
		        })
		    }
		}
		const handleSelect = (label, item) => {
		    label.value = item.textContent;
		    label.parentNode.classList.remove('active');
		}
		$(".selectBox2").mouseleave(function() {
			$(".selectBox2").removeClass("active");
		})
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
			var str="<img src='"+e.target.result+"'style='width: "+w+"px; height: "+h+"px;"
					+"z-index: 5; object-fit: cover;'>";
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
				+'<button type="button" class="custom-btn btn-5 ingPlus"'
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
	
	//요리 단계 추가
	function step_append() {
		$("#steps").append(stepTr(stepCount));
		stepCount++;
	}
	
	//요리 단계 순서 조정 : 올릴땐 sign=-1, 내릴땐 sign=1
	function stepOrder(tr, sign) {
		var th=tr.children().eq(0);
		var td2=tr.children().eq(2);
		var idx=th.children().eq(2).val();
		
		th.children().eq(2).val(parseInt(idx)+sign);
		td2.children().eq(0).attr("for",parseInt(idx)+sign);
		td2.children().eq(1).attr("id",parseInt(idx)+sign);
	}
	
	//요리 단계 idx값 추출
	function stepIdx(tr) {
		var idx=tr.children().eq(0).children().eq(2).val();
		return parseInt(idx);
	}
	
	//태그 추가
	function addTag(value) {
		tag[tagCounter] = value;
		tagCounter++;
	}
	
	//재료 추가 html : 첫행 ingorder=0, 그 외 ingorder=writeorder값
	function ingTr(idx, val, ingorder) {
		if (ingorder==0) {
			return '<tr>'
				+'<th id="choose_class'+idx+'" rowspan="2">'
				+'<input type="text" class="ing_class" idx="'+idx+'" required="required"'
				+'placeholder="재료묶음"><br>'
				+'<button type="button" class="custom-btn btn-3 tab_delete">'
				+'<span>삭제</span>'
				+'</button>&nbsp;'
	    		+'<button type="button" class="custom-btn btn-3 tab_up">'
	    		+'<span>위로</span>'
	    		+'</button>&nbsp;'
	    		+'<button type="button" class="custom-btn btn-3 tab_down">'
	    		+'<span>삭제</span>'
	    		+'</button>'
				+'</th>'
				+'<td>'
				+'<input type="hidden" name="bundle"'
				+'class="forms ing_hidden'+idx+'" value="">'
				+'<input type="hidden" name="ingOrder" value="'+writeOrder+'">'
				+'<input type="text" name="ingName" class="forms ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td style="width: 40px;"></td>'
				+'</tr>';
		} else {
			return '<tr>'
				+'<td>'
				+'<input type="hidden" name="bundle"'
				+'class="forms ing_hidden'+idx+'" value="'+val+'">'
				+'<input type="hidden" name="ingOrder" value="'+ingorder+'">'
				+'<input type="text" name="ingName" class="forms ing_name"'
				+'required="required" placeholder="예)돼지고기">'
				+'</td>'
				+'<td>'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" placeholder="예)300g">'
				+'</td>'
				+'<td>'
				+'<button type="button" class="col_delete custom-btn btn-8">'
    			+'<span>&ensp;X&ensp;</span>'
	    		+'</button>'
	    		+'</td>'
				+'</tr>';
		}
	}
	
	//단계 추가 html
	function stepTr(idx) {
		return '<tr>'
			+'<th>'
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
			+'<label for="'+idx+'" class="inputStepLabel">'
			+'<img src="../img/stepex'+(idx%5)+'.jpg" class="inputStepLabel">'
			+'<span class="stepImgHere">사진을 등록해주세요</span>'
			+'</label>'
			+'<input type="file" name="upload_step" id="'+idx+'" class="forms smallPhoto"'
			+'style="opacity: 0; font-size: 0px;" accept=".jpg, .jpeg, .png">'
			+'</td>'
			+'<td>'
			+'<button type="button" class="step_del custom-btn btn-8">'
			+'<span>&ensp;X&ensp;</span>'
			+'</button>'
			+'</td>'
			+'</tr>';
	}
</script>
</head>
<body>
<div class="container inputMain">
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
	    			placeholder="레시피의 이름을 적어주세요" required="required">
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>레시피 소개</th>
	    		<td colspan="3">
	    			<textarea name="intro" style="resize: none; width: 640px; height: 95px;"
	    			class="forms" placeholder="레시피에 대한 소개를 적어주세요"
	    			required="required"></textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>카테고리</th>
	    		<td width="240">
	    			<div class="selectBox2 ">
						<input type="text" name="category" class="label" value=""
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
						<input type="text" name="main_ing" class="label" value=""
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
						<input type="text" name="cooking" class="label" value=""
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
						<input type="text" name="portion" class="label" value=""
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
						<input type="text" name="level" class="label" value=""
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
		    			placeholder="재료묶음"><br>
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
		    			placeholder="예)돼지고기" required="required">
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
			    		placeholder="예)돼지고기" required="required">
			    	</td>
			    	<td>
			    		<input type="text" name="quantity" class="forms ing_quantity"
			    		placeholder="예)300g" required="required">
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
     			<input type="text" id="tag"
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
<script type="text/javascript">

</script>
</body>
</html>