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
		  <form action="needs-validation" method="post">
		    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="72" height="72">
		    <h1 class="h3 mb-3 fw-normal">회원 가입</h1>
		    <div class="form-floating row">
			    <div class="col-auto">
					<input type="email" class="form-control" id="email1" name="email1" placeholder="이메일">
					<div class="invalid-feedback">이미 존재하는 이메일입니다</div>
				</div>
				<div class="col-auto">
					<div class="input-group">
						<div class="input-group-text">@</div>
						<input type="text" class="form-control" id="email2">
					</div>
				</div>
				<div class="col-auto">
					<select class="form-select" id="emailSelect">
						<option value="default" selected>직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="kakao.com">kakao.com</option>
					</select>
				</div>
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
		    <button class="w-100 btn btn-lg btn-warning" type="button" id="signupBtn">가입 신청</button>
		  </form>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
</body>
<script>
$(function(){
/* 이메일 셀렉트 폼 변경 이벤트 처리  */
$('#emailSelect').on('change', function(){
	var changeVal = $(this).val();
	console.log(changeVal)
	switch (changeVal) {
	case 'default':
		$('#email2').val('')
			.focus()
			.prop('readonly', false)
		break;
	default:
		$('#email2').val(changeVal)
			.prop('readonly', true)
	}
	existCheck()
});

/* 가입 신청 버튼 클릭 이벤트 처리   */
$('#signupBtn').on('click', function(){
	var email = $('#email1').val() + '@' + $('#email2').val()
	console.log(email);
	
	fetch('/user/signupProc.jsp', {	
		method: "post",
		body: new URLSearchParams({
				email: email,
				password: $('#password').val(),
				name: $('#name').val(),
				job: $('#job').val()
			})
        })
		.then(resp => resp.text())
		.then(data => {
			console.log(data);
			data = data.trim();
			if(data == 'success') {
				$('#id').val('');
				$('#password').val('');
				$('#name').val('');
				$('#job').val('');
				popModalRedirect('가입 신청 성공', '회원 가입 신청이 완료되었습니다.<br>관리자 승인 후 이용 가능합니다.', '/user/login.jsp');
			} else if(data == 'fail') {
				popModal('회원 가입 실패', '회원 가입에 실패하였습니다.<br>잠시 후 이용해주세요.');
			} else if(data == 'existUser') {
				popModal('가입 오류','이미 존재하는 회원입니다.');
			}
		})
		.catch(err => console.log('Error : ', err));
});

/* 이메일 중복 체크 용   */
$('#email1').on('keyup', function(){
	existCheck()
})
$('#email2').on('keyup', function(){
	existCheck()
})

/* 이메일 중복 체크 ajax */
function existCheck(){
	var email = $('#email1').val() + '@' + $('#email2').val()
	fetch('/user/existCheck.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: email
			}),
        })
		.then(resp => resp.text())
		.then(data => {
			console.log(data);
			if (data == 1) {
				$('#email1').addClass('is-invalid');
				$('#email2').addClass('is-invalid');
			} else {
				$('#email1').removeClass('is-invalid');
				$('#email2').removeClass('is-invalid');
			}
		})
		.catch(err => console.log('Error : ', err));
}
/* 패스워드 일치 여부 확인 이벤트 */
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
});
</script>
</body>
</html>