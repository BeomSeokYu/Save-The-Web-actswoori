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
<%
String check = request.getParameter("check");
if (sid != null || check == null) {
	response.sendRedirect("/main.jsp");
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

.form-signin input[data-type="top"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[data-type="bottom"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
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
		<div class="form-signin text-center">
		  <form action="" method="post">
		    <h1 class="h3 py-5 fw-normal">비밀번호 변경</h1>
		
		    <div class="form-floating">
		      <input type="hidden" name="email" id="email" value="<%=request.getParameter("email")%>">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password" data-type="top">
		      <label for="floatingInput">새 비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="Password" data-type="bottom">
		      <label for="floatingPassword">새 비밀번호(확인)</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-secondary" type="button" id="editBtn">변경</button>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#editBtn').on('click', function(){
	fetch('/user/pweditProc.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: $('#email').val(),
				pw: $('#password').val(),
			})
        })
		.then(resp => resp.text())
		.then(data => {
			data = data.trim();
			console.log(data);
			if(data == 'success') {
				$('#email').val('');
				$('#password').val('');
				$('#passwordCheck').val('');
				popModalRedirect('비밀번호 변경 성공', '비밀번호 변경이 완료되었습니다.', '/main.jsp');
			} else {
				popModal('비밀번호 변경 실패', '비밀번호 변경이 실패하였습니다.<br>잠시 후 다시 시도해 주세요.');
			}
			
		})
		.catch(err => console.log('Error : ', err));
});


</script>
</body>
</html>