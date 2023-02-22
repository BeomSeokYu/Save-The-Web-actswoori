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

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
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
<body>
<%@ include file="/include/navbar.jsp" %>
<div class="container">
	<div class="form-signin text-center">
	  <form>
	    <h1 class="h3 py-5 fw-normal">로그인</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
	      <label for="floatingInput">이메일</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	      <label for="floatingPassword">비밀번호</label>
	    </div>

	    <button class="w-100 btn btn-lg btn-secondary mb-3" type="button" id="loginBtn">로그인</button>
	    <div>
	    	<p><a class="text-dark" href="/user/signup.jsp" class="">회원 가입</a></p>
	    </div>
	    <div>
	    	<p><a  class="text-dark" href="/user/pwfind.jsp" class="">비밀번호 찾기</a></p>
	    </div>
	  </form>
	</div>
</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#loginBtn').on('click', function(){
	if ($('#email').val() == '') {
		popModal('입력 확인', '이메일을 입력해 주세요.');
	} else if ($('#email').val() == '') {
		popModal('입력 확인', '비밀번호를 입력해 주세요.');
	} else {
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
	}
});
</script>
</body>
</html>