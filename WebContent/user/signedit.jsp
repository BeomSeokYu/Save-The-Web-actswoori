<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<%	
	String email1 = "";
	String email2 = "";
	if (sid != null) {
		
		String check = request.getParameter("check");
		if(check == null || check.equals("")) {
			response.sendRedirect("/user/signeditPw.jsp");
		}
		
		
		email1 = sid.substring(0, sid.indexOf("@"));
		email2 = sid.substring(sid.indexOf("@")+1);
	} else {
		response.sendRedirect("/user/login.jsp");
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
    <div class="py-5">
      <h1 class="h3">내 정보 변경</h1>
    </div>
    <div class="row g-5 justify-content-center">
      <div class="col-md-7 col-lg-8">
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="email1" class="form-label">이메일</label>
              <div class="input-group">
                <input type="text" class="form-control email-form" id="email1" name="email1" value="<%= email1 %>" readonly>
                <span class="input-group-text">@</span>
                <input type="text" class="form-control email-form" id="email2" name="email2" value="<%= email2 %>" readonly>
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
              <input type="text" class="form-control input" id="name" name="name" value="" required>
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
		  <div class="row">
			  <div class="col-6">
	          	  <a class="btn btn-sm btn-outline-danger" href="/user/signout.jsp">회원 탈퇴</a>
			  </div>
			  <div class="col-6 text-end">
			  	  <a class="btn btn-outline-secondary" href="/main.jsp">메인으로</a>
		          <button class="btn btn-secondary btn-md" id="signeditBtn" type="button">정보 수정</button>
	          </div>
		  </div>
        </form>
      </div>
    </div>
  </main>
</div>
<%@ include file="/include/footer.jsp" %>
<script>
var passRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/i; // 영문, 숫자 조합으로 8-20자리
var nameRegExp = /^[a-zA-Z가-힣]{2,20}$/i;
var jobRegExp = /^[a-zA-Z가-힣]{1,10}$/i;

onload = function() {
	getUserInfo();
}

function getUserInfo() {
	fetch('/user/userInfoProc.jsp', {
		method: "post",
		body: new URLSearchParams({
				email: '<%= sid %>'
			})
	    })
		.then(resp => resp.json())
		.then(data => {
			console.log(data);
			$('#name').val(data.name)
				.addClass('is-valid');
			$('#job').val(data.job)
				.addClass('is-valid');
		})
}


$('#signeditBtn').on('click', function(){
	if(validation()) {
		fetch('/user/signeditProc.jsp', {
			method: "post",
			body: new URLSearchParams({
					email: $('#email1').val() + '@' + $('#email2').val(),
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
					$('#password').val('')
					$('#passwordCheck').val('')
					getUserInfo();
					popModalRedirect('정보 변경 성공', '회원 정보 변경이 완료되었습니다.', '/main.jsp');
				} else {
					popModal('정보 변경 실패', '회원 정보 변경이 실패하였습니다.<br>잠시 후 다시 시도해 주세요.');
				}
				
			})
	}
});

$('#signoutBtn').on('click', function(){
	if(validation()) {
		fetch('/user/signeditProc.jsp', {
			method: "post",
			body: new URLSearchParams({
					email: $('#email1').val() + '@' + $('#email2').val(),
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
					$('#password').val('')
					$('#passwordCheck').val('')
					getUserInfo();
					popModalRedirect('정보 변경 성공', '회원 정보 변경이 완료되었습니다.', '/main.jsp');
				} else {
					popModal('정보 변경 실패', '회원 정보 변경이 실패하였습니다.<br>잠시 후 다시 시도해 주세요.');
				}
				
			})
	}
});









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



/* 유효성 검사 */
function validation() {
	if ($("#password").hasClass("is-valid") !== true) {
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