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
	  <form action="/user/pwedit.jsp" method="post" id="findFrm">
	    <h1 class="h3 py-5 fw-normal">회원 이메일 확인</h1>
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
			    <input type="text" class="form-control" id="approveNum" name="approveNum" placeholder="인증 번호" aria-describedby="appSendBtn">
				<button class="btn btn-secondary" type="button" id="appSendBtn">인증 번호 발송</button>
		  	</div>
	  	</div>
	  	<input type="hidden" id="check" name="check" value="">
	  	<hr class="my-4">
        <button class="w-100 btn btn-secondary btn-md" id="checkBtn" type="button">인증 확인</button>
	  </form>
	</div>
</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#appSendBtn').on('click', function(){
	var email = $('#email').val().trim();
	var name = $('#name').val().trim();
	if (email == '') {
		popModal('입력 오류', '이메일을 입력해 주세요');
	} else if (name == '') {
		popModal('입력 오류', '이름을 입력해 주세요');
	} else {
		fetch('/sendMail.do', {
			method: "post",
			body: new URLSearchParams({
					email: $('#email').val(),
					name: $('#name').val(),
					type: 'send'
				})
	        })
			.then(resp => resp.text())
			.then(data => {
				console.log(data);
				data = data.trim()
				if (data == 'success') {
					popModal('인증 번호 발송 성공', '이메일로 발송된 이메일 확인 후 입력해주세요.');
				} else if (data == 'fail') {
					popModal('인증 실패', '등록 되지 않은 정보입니다.');
				}
			})
	}
});

$('#checkBtn').on('click', function(){
	if ($('#approveNum').val().trim() == '') {
		popModal('인증 실패', '인증번호를 입력하세요.');
	} else {
		fetch('/sendMail.do', {
			method: "post",
			body: new URLSearchParams({
					checkNum: $('#approveNum').val(),
					type: 'check'
				})
	        })
			.then(resp => resp.text())
			.then(data => {
				console.log(data);
				data = data.trim()
				if (data == 'true') {
					$('#check').val('true');
					$('#findFrm').submit();
				} else if (data == 'false') {
					popModal('인증 실패', '인증번호가 일치하지 않습니다.');
				}
			})
	}
});

</script>
</body>
</html>