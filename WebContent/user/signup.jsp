<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String email = request.getParameter("email"); %>
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
.container {
  max-width: 960px;
}
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
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
  <main>
    <div class="py-5 text-center">
      <h1 class="h3">회원 가입</h1>
    </div>
    <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="email1" class="form-label">이메일</label>
              <div class="input-group">
                <input type="text" class="form-control email-form input rounded" id="email1" name="email1" placeholder=""
                		value="<%= email != null ? email.substring(0, email.indexOf('@')):"" %>"
                		<%= email != null ? "readonly":"" %>
                		required>
                <span class="input-group-text rounded mx-1">@</span>
                <input type="text" class="form-control email-form input rounded" id="email2" name="email2" placeholder=""
                		value="<%= email != null ? email.substring(email.indexOf('@') + 1):"" %>"
                		<%= email != null ? "readonly":"" %>
                		required>
                <select class="form-select rounded" id="emailSelect">
				  <option value="default" selected>직접 입력</option>
				  <option value="naver.com">naver.com</option>
				  <option value="gmail.com">gmail.com</option>
				  <option value="daum.net">daum.net</option>
				  <option value="kakao.com">kakao.com</option>
			    </select>
              	<div class="invalid-feedback">
                                       이미 가입되었거나 승인 대기중인 회원입니다.
                </div>
              </div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">비밀번호 <span class="text-muted">(숫자,영문자 포함 8자리 이상)</span></label>
              <input type="password" class="form-control pass-form input" id="password" name="password" placeholder="" required>
            </div>

            <div class="col-12">
              <label for="passwordCheck" class="form-label">비밀번호 확인</label>
              <input type="password" class="form-control pass-form input" id="passwordCheck" name="passwordCheck" placeholder="" required>
              <div class="valid-feedback">
              	비밀번호가 일치합니다.
              </div>
            </div>

            <div class="col-12">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control input" id="name" name="name" placeholder="" required>
            </div>

            <div class="col-12">
	          <label for="job" class="form-label">직분</label>
              <div class="input-group">
	              <input type="text" class="form-control input rounded" id="job" name="job" placeholder="" required>
	              <span class="rounded mx-1"></span>
	              <select class="form-select rounded" id="jobSelect" placeholder="직분">
					<option value="default" selected>직접 입력</option>
					<option value="성도">성도</option>
					<option value="집사">집사</option>
					<option value="안수집사">안수집사</option>
					<option value="권사">권사</option>
					<option value="장로">장로</option>
					<option value="목사">목사</option>
				  </select>
              </div>
            </div>
          </div>
          <hr class="my-4">

          <button class="w-100 btn btn-secondary btn-md" id="signupBtn" type="button">가입 신청</button>
        </form>
      </div>
    </div>
  </main>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
<script>

var emailRegExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i;
var passRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/i; // 영문, 숫자 조합으로 8-20자리
var nameRegExp = /^[a-zA-Z가-힣]{2,20}$/i;
var jobRegExp = /^[a-zA-Z가-힣]{1,10}$/i;
	
// ---------------- 이메일 관련 처리 --------------------
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
	emailExistAndVaildCheck()
});

/* 이메일 키업 이벤트  */
$('.email-form').on('keyup', emailExistAndVaildCheck)
<%= email != null ? "emailExistAndVaildCheck()":"" %>
/* 이메일 유효성 및 중복 체크 함수 */
function emailExistAndVaildCheck() {
	var email = $('#email1').val() + '@' + $('#email2').val()
	
	if (email.match(emailRegExp) != null) {
		$('#email1').addClass('is-valid');
		$('#email2').addClass('is-valid');
	} else {
		$('#email1').removeClass('is-valid');
		$('#email2').removeClass('is-valid');
	}
	
	fetch('/user/emailExistProc.jsp', {
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

// ---------------- 패스워드 관련 처리 --------------------


/* 패스워드 일치 여부 확인 이벤트 */
$('.pass-form').on('keyup', function(){
	
	if ($('#password').val().match(passRegExp) != null) {
		$('#password').addClass('is-valid');
	} else {
		$('#password').removeClass('is-valid');
	}
	
	if ($("#password").hasClass("is-valid")) {
		if ($('#password').val() == $('#passwordCheck').val()) {
			$('#passwordCheck').addClass('is-valid');
		} else {
			$('#passwordCheck').removeClass('is-valid');
		}
	} else {
		$('#passwordCheck').removeClass('is-valid');
	}
});

//---------------- 이름 관련 처리 --------------------

/* 이름 유효성 체크 이벤트 */
$('#name').on('keyup', function(){
	if ($('#name').val().match(nameRegExp) != null) {
		$('#name').addClass('is-valid');
	} else {
		$('#name').removeClass('is-valid');
	}
});

//---------------- 직분 관련 처리 --------------------

/* 직분 셀렉트 폼 변경 이벤트 처리  */
$('#jobSelect').on('change', function(){
	var changeVal = $(this).val();
	console.log(changeVal)
	switch (changeVal) {
	case 'default':
		$('#job').val('')
			.focus()
			.prop('readonly', false)
		break;
	default:
		$('#job').val(changeVal)
			.prop('readonly', true)
	}
	jobVaildCheck()
});

/* 직분 입력 유효성 검사 이벤트 */
$('#job').on('keyup', jobVaildCheck);

function jobVaildCheck() {
	if ($('#job').val().match(jobRegExp) != null) {
		$('#job').addClass('is-valid');
	} else {
		$('#job').removeClass('is-valid');
	}
}

// -------------------- 화원 가입 버튼 클릭 처리 ----------------------

/* 가입 신청 버튼 클릭 이벤트 처리   */
$('#signupBtn').on('click', function(){
	var email = $('#email1').val() + '@' + $('#email2').val()
	console.log(email);
	
	if(validation()) {
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
					$('#email1').val('');
					$('#email2').val('');
					$('#password').val('');
					$('#passwordCheck').val('');
					$('#name').val('');
					$('#job').val('');
					$('.input').removeClass('is-valid');
					popModalRedirect('가입 신청 성공', '회원 가입 신청이 완료되었습니다.<br>관리자 승인 후 이용 가능합니다.', '/user/login.jsp');
				} else if(data == 'fail') {
					popModal('회원 가입 실패', '회원 가입에 실패하였습니다.<br>잠시 후 이용해주세요.');
				} else if(data == 'existUser') {
					popModal('가입 오류','이미 존재하는 회원입니다.');
				}
			})
	}
	
});

/* 유효성 검사 */
function validation() {
	if($("#email1").hasClass("is-valid") !== true) {
		popModal('입력 오류','이메일을 확인해 주세요.');
		return false
	} else if ($("#password").hasClass("is-valid") !== true) {
		popModal('입력 오류','비밀번호를 확인해 주세요.');
		return false
	} else if ($("#passwordCheck").hasClass("is-valid") !== true) {
		popModal('입력 오류','비밀번호가 일치하지 않습니다.');
		return false
	} else if ($("#name").hasClass("is-valid") !== true) {
		popModal('입력 오류','이름 입력을 확인해 주세요.');
		return false
	} else if ($("#job").hasClass("is-valid") !== true) {
		popModal('입력 오류','직분 입력을 확인해 주세요.');
		return false
	}
	return true
}
</script>
</body>
</html>