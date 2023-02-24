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
if (sid != null) {
	response.sendRedirect("/main.jsp");
}
%>

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
	    <div>
	    	<a id="custom-login-btn" href="javascript:kakaoLogin()">
				<img src="/resources/img/kakao_login_medium_narrow.png">
			</a>
	    </div>
	  </form>
	</div>
</div>

<%@ include file="/include/footer.jsp" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	//발급 받은 키
	Kakao.init("1d944d4a9cb22483964d7e130a9b4c2a");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
			scope:'account_email',
			success: function (authObj) {
				window.Kakao.API.request({
					url:'/v2/user/me',
					success:res => {
						const kakaoAccount = res.kakao_account;
						fetch('/user/loginKakaoProc.jsp', {
							method: "post",
							body: new URLSearchParams({
									id: kakaoAccount.email,
								})
					        })
							.then(resp => resp.text())
							.then(data => {
								console.log(data);
								data = data.trim()
								if (data == 'success') {
									location.href = '/main.jsp';
								} else if (data == 'fail') {
									popModalRedirect('존재하지 않는 회원입니다', '회원가입을 하시겠습니까?', '/user/signup.jsp?email='+kakaoAccount.email);
								}
							})
					}
				});		
			}
		});
	}

</script>

<script>
$('#loginBtn').on('click', function(){
	loginExe()
});
$('#password').on("keypress", function(){
	if(event.keyCode == 13) {
		loginExe()
	}
})

function loginExe(){
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
	}
}

</script>
</body>
</html>