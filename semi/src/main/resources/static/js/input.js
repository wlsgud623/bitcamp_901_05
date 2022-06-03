/***************************전역 변수***************************/
	var ingClass=2; //다음에 추가될 재료묶음(idx)
	var writeOrder=2; //다음에 추가될 재료묶음(writeorder)
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
				+'placeholder="재료묶음" autocomplete="off"><br>'
				+'<button type="button" class="custom-btn btn-3 tab_delete">'
				+'<span>삭제</span>'
				+'</button>&nbsp;'
	    		+'<button type="button" class="custom-btn btn-3 tab_up">'
	    		+'<span>올리기</span>'
	    		+'</button>&nbsp;'
	    		+'<button type="button" class="custom-btn btn-3 tab_down">'
	    		+'<span>내리기</span>'
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
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" autocomplete="off">'
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
				+'required="required" autocomplete="off">'
				+'</td>'
				+'<td>'
				+'<input type="text" name="quantity" class="forms ing_quantity"'
				+'required="required" autocomplete="off">'
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