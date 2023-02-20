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

<!-- 썸머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%
//if(userDAO.login() != 1){
	String adminLoginCheck = "a";
	
	//관리자 로그인이 안되었을때
	if (adminLoginCheck == null){%>
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">관리자 로그인 필요</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        관리자만 이용 할 수 있습니다.<br>
		        메인 화면으로 이동합니다.
		      </div>
		      <div class="modal-footer">
		        <!-- <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button> -->
				<button onclick="location.href='/2/lecture/lectureMain.jsp'" class="btn btn-primary">메인으로 이동</button>
		      </div>
		    </div>
		  </div>
		</div>

		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>		
	<% } %>



<div></div>
<form action = lectureCheck.jsp method = "post">
<div class = "container">
<div class="pt-5"></div>
<h2>특강등록</h2>
<div class="form-floating">
      <input type="text" name = "ltitle" class="form-control" id="ltitle" placeholder="제목을 입력하세요" required>
      <label for="floatingInput">제목</label>
</div>
<div class="form-floating">
      <input type="text" name = "lname" class="form-control" id="lname" placeholder="설교자를 입력하세요" required>
      <label for="floatingPassword">설교자</label>
</div>
<textarea name = "lcontent" id = "summernote" class="mtop-10" ></textarea>
<button class="btn btn-primary" type="submit">등록</button>
<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">취소</a> -->
<input type="button" value="취소" onclick="history.back()" class="btn btn-warning">
</div>
</form>
<!--<button onclick="location.href='/2/lecture/lectureMain.jsp'" class="btn btn-warning">취소</button>  -->


<!-- 썸머노트 스크립트 -->
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 500,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
</script>

<%@ include file="/include/footer.jsp" %>
</body>
</html>