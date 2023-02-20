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
		    <h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		
		    <div class="form-floating">
		    	<input type="hidden" name="email" id="email" value="<%=request.getParameter("email")%>">
    		    <input type="hidden" name="job" id="email" value="">
    		    <input type="hidden" name="name" id="email" value="">
		      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		      <label for="floatingInput">새 비밀번호</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="Password">
		      <label for="floatingPassword">새 비밀번호(확인)</label>
		    </div>
	
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="editBtn">변경</button>
		    <p class="mt-5 mb-3 text-muted">&copy; SaveTheWeb</p>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
$('#editBtn').on('click', function(){
	fetch('/user/pweditProc.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: $('#email').val(),
				pw: $('#password').val(),
				job: $('#job').val(),
				name: $('#name').val()
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
				popModalRedirect('비밀번호 변경 성공', '비밀번호 변경이 완료되었습니다.', '/main.jsp');
			} else {
				popModal('비밀번호 변경 실패', '비밀번호 변경이 실패하였습니다.<br>잠시 후 다시 시도해 주세요.');
			}
			
		})
		.catch(err => console.log('Error : ', err));
});



</script>
</body>
</html>