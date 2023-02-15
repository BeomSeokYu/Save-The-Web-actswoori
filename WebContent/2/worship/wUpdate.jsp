<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
	<form action="wUpdateCheck.jsp" method="post">
		<input type="hidden" name="wno" value="3">
		<div class="container">
			<div>
			  <label for="wtitle" class="form-label">제목</label>
			  <input type="text" class="form-control" id="wtitle" name="wtitle">
			</div>
			<div>
			  <label for="wname" class="form-label">설교자</label>
			  <input type="text" class="form-control" id="wname" name="wname">
			</div>
			<div>
			  <label for="wcontent" class="form-label">내용</label>
			  <textarea class="form-control" id="wcontent" name="wcontent" rows="3"></textarea>
			</div>
			<div>
				<button class="btn btn-primary" type="submit">수정</button>
				<a class="btn btn-primary" href="#" role="button">목록</a>
			</div>
		</div>
	</form>
<%@ include file="/include/footer.jsp" %>
</body>
</html>