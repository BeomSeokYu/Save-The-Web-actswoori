<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
</head>
<body>
	<h3>파일 업로드 해보자잉~</h3>
	
	<form action="/4/gallery/photoUpload.jsp" method="post" enctype="multipart/form-data">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"> <br>
		<input type="file" name="image" multiple> <br>
		<button type="submit">전송</button>
	</form>
</body>
</html>