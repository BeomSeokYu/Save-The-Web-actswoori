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
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<div class="container">
		<div class="form-signin w-50 m-auto text-center">
		  <form action="needs-validation" method="post">
		    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="72" height="72">
		    <h1 class="h3 mb-3 fw-normal">내 정보 수정</h1>
		
		    <div class="form-floating">
		      <input type="text" class="form-control" id="email" name="email" value="<%= sid %>">
		      <label for="email">이메일</label>
		      <div class="invalid-feedback">이미 존재하는 아이디입니다</div>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="비밀번호" placeholder="Password">
		      <label for="password">비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="passwordCheck" name="비밀번호 (확인)" placeholder="Password (Check)">
		      <label for="passwordCheck">비밀번호 (확인)</label>
		      <div class="valid-feedback">비밀번호가 일치합니다</div>
		    </div>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="name" name="name" placeholder="이름">
		      <label for="name">이름</label>
		    </div>
			<div class="form-floating">
		      <input type="text" class="form-control" id="job" name="job" placeholder="직분">
		      <label for="name">직분</label>
		    </div>
		    <button class="w-100 btn btn-lg btn-primary" type="button" id="signupBtn">수정</button>
		    <p class="mt-5 mb-3 text-muted">&copy; MyMemo</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>

$('#signupBtn').on('click', function(){
	fetch('/user/signeditProc.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: $('#email').val(),
				password: $('#password').val(),
				name: $('#name').val(),
				job: $('#job').val()
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
				$('#name').val('');
				$('#job').val('');
				popModalRedirect('정보 변경 성공', '회원 정보 변경이 완료되었습니다.', '/main.jsp');
			} else {
				popModal('정보 변경 실패', '회원 정보 변경이 실패하였습니다.<br>잠시 후 다시 시도해 주세요.');
			}
			
		})
		.catch(err => console.log('Error : ', err));
});

$('#passwordCheck').on('keyup', function(){
	if ($('#password').val() != '') {
		if ($('#password').val() == $(this).val()) {
			$('#password').addClass('is-valid');
			$(this).addClass('is-valid');
		} else {
			$('#password').removeClass('is-valid');
			$(this).removeClass('is-valid');
		}
	}
});
</script>
</body>
</html>