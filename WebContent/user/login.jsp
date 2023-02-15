<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		      <input type="email" class="form-control" id="id" name="id" placeholder="Email">
		      <label for="floatingInput">이메일</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="loginBtn">Login</button>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#loginBtn').on('click', function(){
	fetch('/user/loginCheck.jsp', {
		method: "post",
		body: new URLSearchParams({
				id: $('#id').val(),
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
			}
		})
		.catch(err => console.log('Error : ', err));
});
</script>
</body>
</html>