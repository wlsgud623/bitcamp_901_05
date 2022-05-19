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

/* css 기본설정 */

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { 
   margin: 0; 
   padding: 0; 
   border: 0; 
   font-size: 100%; 
   font: inherit; 
   vertical-align: baseline; 
} 

body { 
   line-height: 1; 
} 

ol, ul { 
   list-style: none; 
} 

table { 
   border-collapse: collapse; border-spacing: 0; 
}

/* css 시작 */
 
/* .body{
	text-align: center;
} */

header{
	padding-top: 50px;
	text-align: center;
}

.container{
	height: 800px;
	padding-top: 100px;
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
		margin-left: 80px;
   }

</style>

</head>
<body>
	<div class="body">
		<header class="header">
			<a href="../">
			<img src="../img/logo.png">
			</a>
		</header>
		<!-- container -->
		<div class="container" id="container">
			<div class="memberform">
			   <h3>회원가입</h3><br><br>
			   <form action="insert" method="post" class="form-inline"
			   		onsubmit="return check()" style="border-top: 1px solid black; height: 1000px;">
			   		<br>
			   		<table style="width: 600px;" class="mem">
			   			<tr>
			   				<th style="width: 130px;">이 름</th>
			   				<td>
			   					<input type="text" name="name" style="width: 300px;" class="form-control"
			   					required="required">
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">아이디</th>
			   				<td>
			   					<input type="text" name="id" id="id" style="width: 300px;" class="form-control"
			   					required="required">
			   					&nbsp;
			   					<button type="button" class="btn btn-sm btn-danger" id="idcheck"
			   					style="width: 100px;">아이디체크</button>
			   					&nbsp;
			   					<b class="idok"></b>
			   				</td>
			   			</tr>
			   			<tr rowspan="2">
			   				<th style="width: 130px;">비밀번호</th>
			   				<td>
			   					<input type="password" name="pass" id="pass1" style="width: 300px;" class="form-control"
			   					required="required" placeholder="비밀번호">
							<br><br>
			   					<input type="password" id="pass2" style="width: 300px;" class="form-control"
			   					required="required" placeholder="한번 더 입력">
			   					&nbsp;
			   					<b class="passok"></b>
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">핸드폰</th>
			   				<td>
			   					<input type="text" name="hp" style="width: 300px;" class="form-control"
			   					required="required">
			   				</td>
			   			</tr>
			   			<tr>
			   				<th style="width: 130px;">이메일</th>
			   				<td>
			   					<input type="text" name="email1" style="width: 140px;" class="form-control"
			   					required="required">
			   					<b>@</b>
			   					<input type="text" name="email2" id="email2" style="width: 140px;" class="form-control"
			   					required="required">&nbsp;
			   					<select id="email3" class="form-control">
			   						<option value="-">직접입력</option>
			   						<option value="naver.com">네이버</option>
			   						<option value="nate.com">네이트</option>
			   						<option value="google.com">구글</option>
			   					</select>
			   				</td>
			   			</tr>
			   		</table>
			   		<br>
					<button type="submit" class="btn btn-warning"
					style="width: 700px; height: 50px; margin-top: 20px;">회원가입</button>
			   </form>
			 </div>
		</div>
		<!-- //container -->
	</div>
</body>
</html>