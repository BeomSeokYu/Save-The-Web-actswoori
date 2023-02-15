<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<!-- form -->
	<div class="container">
		<div class="form-signin w-50 m-auto text-center">
		  <form action="signoutCheck.jsp" method="post">
		    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="72" height="72">
		    <h1 class="h3 mb-3 fw-normal">회원 탈퇴</h1>
		
		    <div class="form-floating">
		      <input type="text" class="form-control" id="id" name="id" value="<%= "sid" %>" readonly>
		      <label for="floatingInput">ID</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingPassword">Password</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="signoutBtn">Sign Out</button>
		    <p class="mt-5 mb-3 text-muted">&copy; MyMemo</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#signoutBtn').on('click', function(){
	fetch('/user/signoutCheck.jsp', {
		method: "post",
		body: new URLSearchParams({
				id: $('#id').val(),
				password: $('#password').val()
			})
        })
		.then(resp => resp.text())
		.then(data => {
			data = data.trim();
			console.log(data);
			if(data == 'success') {
				$('#id').val('');
				$('#password').val('');
				popModalRedirect('회원 탈퇴 성공', '회원 탈퇴가 완료되었습니다.<br>그동안 이용해 주셔서 감사합니다.', '/user/login.jsp');
			} else {
				popModal('회원 탈퇴 실패', '회원 탈퇴에 실패하였습니다.<br>비밀번호를 확인해 주세요.');
			}
			
		})
		.catch(err => console.log('Error : ', err));
});
</script>
</body>
</html>