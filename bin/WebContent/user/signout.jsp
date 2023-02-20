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
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div class="container">
		<div class="form-signin w-50 m-auto text-center">
		    <h1 class="h3 mb-3 fw-normal">회원 탈퇴</h1>
		    <input type="hidden" id="email" name="email" value="<%= sid %>">
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="submitBtn">확인</button>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
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
			.catch(err => console.log('Error : ', err));
	}
});
</script>
</body>
</html>