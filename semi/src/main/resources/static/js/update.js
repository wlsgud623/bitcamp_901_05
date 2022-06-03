/***************************전역 변수***************************/
	
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
			$(this).prev().val("d");
			$(this).prev().prev().val("");
			$(this).prev().prev().prev()
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
		const label = document.querySelectorAll('.selector');
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
				+'placeholder="재료묶음" autocomplete="off"><br>'
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
				+'required="required" autocomplete="off">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingNum" value="new" class="forms">'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" autocomplete="off">'
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
				+'<input type="hidden" name="ingOrder" value="'+ingorder+'">'
				+'<input type="text" name="ingName" class="forms ing_name"'
				+'required="required" autocomplete="off">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingNum" value="new" class="forms">'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" autocomplete="off">'
				+'</td>'
				+'<td>'
				+'<input type="hidden" name="ingDel" class="forms" value="n">'
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
			+'<button type="button" class="step_del custom-btn btn-8">'
			+'<span>&ensp;X&ensp;</span>'
			+'</button>'
			+'</td>'
			+'</tr>';
	}