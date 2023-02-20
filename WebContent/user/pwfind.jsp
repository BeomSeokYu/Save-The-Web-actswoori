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
<style>
html,
body {
  height: 100%;
}

body {
  align-items: center;
  padding-top: 150px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
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

.form-signin input[data-type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[data-type="name"] {
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
	  <form action="/user/pwedit.jsp" method="post">
	    <h1 class="h3 mb-3 fw-normal">회원 이메일 확인</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="email" name="email" placeholder="이메일" data-type="email">
	      <label for="floatingInput">이메일</label>
	    </div>
	    <div class="form-floating">
	      <input type="text" class="form-control" id="name" name="name" placeholder="이름" data-type="name">
		  <label for="floatingPassword">이름</label>
	    </div>
	    <div class="form-floating">
		    <label for="form-label">인증 번호</label>
		    <div class="input-group">
			    <input type="text" class="form-control" id="approve" name="approve" placeholder="인증 번호" aria-describedby="appSendBtn">
				<button class="btn btn-secondary" type="button" id="appSendBtn">인증 번호 발송</button>
		  	</div>
	  	</div>
	  	<hr class="my-4">
        <button class="w-100 btn btn-secondary btn-md" id="signupBtn">인증 확인</button>
	  </form>
	</div>
</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#appSendBtn').on('click', function(){
	fetch('/user/pwfindProc.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: $('#email').val(),
				name: $('#name').val()
			})
        })
		.then(resp => resp.text())
		.then(data => {
			console.log(data);
			data = data.trim()
			if (data == 'success') {
				location.href = '/user/pwedit.jsp?email=' + $('#email').val();
			} else if (data == 'fail') {
				popModal('인증 실패', '등록 되지 않은 정보입니다.');
			}
		})
		.catch(err => console.log('Error : ', err));
});
</script>
</body>
</html>