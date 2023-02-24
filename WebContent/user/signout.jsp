<%-- 

작성자 : 유범석
작성일 : 2023.02.17
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
<%
if (sid == null) {
	response.sendRedirect("/user/login.jsp");
}
%>
<style>
html,
body {
  height: 100%;
}

body {
  align-items: center;
  padding-bottom: 40px;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
</style>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div class="container">
		<div class="form-signin w-50 m-auto text-center">
		    <h1 class="h3 py-5 fw-normal">회원 탈퇴</h1>
		    <input type="hidden" id="email" name="email" value="<%= sid %>">
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-secondary my-2" type="button" id="submitBtn">확인</button>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#submitBtn').on('click', function(){
	if(confirm('정말로 탈퇴하시겠습니까?')) {
		fetch('/user/signoutProc.jsp', {
			method: "post",
			body: new URLSearchParams({
					id: $('#email').val(),
					password: $('#password').val()
				})
	        })
			.then(resp => resp.text())
			.then(data => {
				console.log(data);
				data = data.trim()
				if (data == 'success') {
					popModalRedirect('회원 탈퇴 완료', '그동안 이용해 주셔서 감사합니다.', '/user/login.jsp');
				} else if (data == 'fail') {
					popModal('비밀번호 오류', '비밀번호를 확인해 주세요');
				}
			})
	}
});
</script>
</body>
</html>