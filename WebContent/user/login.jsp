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
		    <h1 class="h3 mb-3 fw-normal">로그인</h1>
		
		    <div class="form-floating">
		      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
		      <label for="floatingInput">이메일</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="loginBtn">로그인</button>
		    <a href="/user/signup.jsp" class="">아직도 회원이 아니신가? 가입 허실?</a>
		    <a href="/user/signup.jsp" class="">비밀번호 까먹으심?</a>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#loginBtn').on('click', function(){
	fetch('/user/loginProc.jsp', {
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
				location.href = '/main.jsp';
			} else if (data == 'bothFail') {
				popModalRedirect('존재하지 않는 회원입니다', '회원가입을 하시겠습니까?', '/user/signup.jsp');
			} else if (data == 'fail') {
				popModal('로그인 실패', '비밀번호를 확인해 주세요');
			} else if (data == 'noapp') {
				popModal('가입 미승인', '아직 승인되지 않은 회원입니다.');
			}
		})
		.catch(err => console.log('Error : ', err));
});
</script>
</body>
</html>