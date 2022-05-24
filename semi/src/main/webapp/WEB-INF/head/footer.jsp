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
.footer {
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 15px 0;
	text-align: center;
	color: white;
	background: red;
}
</style>
</head>

<body>
	<div id="footer" class="footer">
		<div class="f_info content">
			<div class="f_info_left">
				<h3>(주)비트4조</h3>
				<span>서울 강남구</span>
				<span class="copy">Copyright ⓒ semi co.,Ltd All Rights Reserved.</span>
			</div>
			<div class="f_info_right">
				<select name="racipy" id="racipy" title="패밀리 사이트 바로가기" onchange="if(this.value) window.open(this.value);">
					<option value="/">레시피사이트</option>
				</select>
				<ul>
					<li><a href="https://blog.naver.com" target="_blank">
					<i class="insta"></i></a><img alt="없음" src="../img/insta.png" style="width: 50px;height: 50px;"></li>
					<li><a href="https://www.facebook.com" target="_blank">
					<i class="facebook"></i></a><img alt="없음" src="../img/Facebook.png" style="width: 50px;height: 50px;"></li>
					<li><a href="https://www.instagram.com" target="_blank">
					<i class="insta"></i></a><img alt="없음" src="../img/kakao.png" style="width: 50px;height: 50px;"></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>