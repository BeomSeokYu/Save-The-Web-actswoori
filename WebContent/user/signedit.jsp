<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<div class="container">
		<div class="form-signin w-100 m-auto text-center">
		  <form action="needs-validation" method="post">
		    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="72" height="72">
		    <h1 class="h3 mb-3 fw-normal">Sign Edit</h1>
		
		    <div class="form-floating">
		      <input type="text" class="form-control" id="id" name="id" value="<%= "sid" %>">
		      <label for="id">ID</label>
		      <div class="invalid-feedback">이미 존재하는 아이디입니다</div>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="password">New Password</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="Password (Check)">
		      <label for="passwordCheck">New Password (Check)</label>
		      <div class="valid-feedback">비밀번호가 일치합니다</div>
		    </div>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="name" name="name" placeholder="Name">
		      <label for="name">New Name</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-primary" type="button" id="signupBtn">Edit</button>
		    <p class="mt-5 mb-3 text-muted">&copy; MyMemo</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
function popModal(head, body) {
	$('#modalHeader').text(head);
	$('#modalBody').html(body);
	$('#exampleModal').modal('show');
}

$('#signupBtn').on('click', function(){
	fetch('/user/signeditCheck.jsp', {
		method: "post",
		body: new URLSearchParams({
				id: $('#id').val(),
				password: $('#password').val(),
				passwordCheck: $('#passwordCheck').val(),
				name: $('#name').val()
			})
        })
		.then(resp => resp.text())
		.then(data => {
			data = data.trim();
			console.log(data);
			if(data == 'success') {
				$('#id').val('');
				$('#password').val('');
				$('#passwordCheck').val('');
				$('#name').val('');
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