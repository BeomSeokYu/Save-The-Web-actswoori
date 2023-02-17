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
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div class="container">
		<div class="form-signin w-50 m-auto text-center">
		  <form action="" method="post">
		    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="72" height="72">
		    <h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingInput">새 비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="Password">
		      <label for="floatingPassword">새 비밀번호(확인)</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="loginBtn">변경</button>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
</script>
</body>
</html>