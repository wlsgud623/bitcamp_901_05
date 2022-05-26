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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>

		
</style>
<script type="text/javascript">

$(function() {
	//사진
	$("#inputPhoto").change(function() {
		img_preview("#inputPhoto", 800, 450);
	});
});
</script>
<body>
<script type="text/javascript">
var own= ${ownrecipeList};
var photo = 

</script>

	<div style="position: relative; margin-bottom: 300px; top: 30px; left: 100px;">
		<form action="insert" method="get" class="form-inline"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<label for="inputPhoto" style="text-align: center; background-color: lightgray;
							width: 800px; height: 450px; cursor: pointer;">
								<br><br>
								<img src="../image/Upload-Icon.png" style="width: 70px;">
							</label>
						    <input type="image" id="inputPhoto" name="upload_main" accept=".jpg, .jpeg, .png"
						    style="opacity: 0; font-size: 0px;" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-warning racipego">레시피작성go</button>
						<button type="button" class="btn btn-warning revise" id="revise"
							onclick="location.href='/mypage/updateform?UserID=${userid}'">정보수정하기</button>
					</td>
				</tr>
		</table>
	</form>
</div>
			  




</body>
</html>