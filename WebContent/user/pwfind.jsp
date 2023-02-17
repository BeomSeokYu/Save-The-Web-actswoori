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
		    <h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>
		
		    <div class="form-floating">
		      <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
		      <label for="floatingInput">이메일</label>
		    </div>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="name" name="name" placeholder="이름">
		      <label for="floatingPassword">이름</label>
		    </div>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="approve" name="approve" placeholder="인증 번호">
		      <label for="floatingPassword">인증 번호</label>
		      <button class="w-100 btn btn-lg btn-warning" type="button" id="appSendBtn">인증 번호 발송</button>
		    </div>
		
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="loginBtn">인증 확인</button>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
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