<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>

	<!-- 썸머노트 -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<%
//if(userDAO.login() != 1){
	String adminLoginCheck = "a";
	
	//관리자 로그인이 안되었을때
	if (adminLoginCheck == null){%>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">관리자 로그인 필요</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					관리자만 이용 할 수 있습니다.<br> 메인 화면으로 이동합니다.
				</div>
				<div class="modal-footer">
					<!-- <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button> -->
					<button onclick="location.href='/2/lecture/lectureMain.jsp'"
						class="btn btn-primary">메인으로 이동</button>
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



	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>주요 특강 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>
		<form action=lectureCheck.jsp method="post">
<<<<<<< Updated upstream

=======
			<input type="hidden" name="email" value="<%=sid %>" >
>>>>>>> Stashed changes
			<div class="input-group mb-2 input-group-lg">
				<span class="input-group-text col-2 mx-auto" id="ltitle">제목</span> 
				<input type="text" class="form-control col-11" placeholder="제목을 입력하세요" name="ltitle">
			</div>

			<div class="input-group mb-3 input-group-lg">
				<span class="input-group-text col-2 mx-auto" id="lname">설교자</span> 
				<input type="text" class="form-control col-11" name="lname" placeholder="설교자를 입력하세요">
			</div>


			<div>
				<textarea name="lcontent" id="summernote" class="mtop-10"></textarea>
			</div>

			<div class="d-flex justify-content-end my-4">
<<<<<<< Updated upstream
				<button class="btn btn-outline-primary mx-2" type="submit">등록</button>
=======
				<button class="btn btn-outline-primary mx-2" type="submit" onclick="insert">등록</button>
				
>>>>>>> Stashed changes
				<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">취소</a> -->
				<input type="button" value="취소" onclick="history.back()"
					class="btn btn-outline-secondary mx-2">
			</div>
		</form>
	</div>
<<<<<<< Updated upstream
	<!--<button onclick="location.href='/2/lecture/lectureMain.jsp'" class="btn btn-warning">취소</button>  -->
=======
	</div></div></div>
>>>>>>> Stashed changes


	<!-- 썸머노트 스크립트 -->
	<script>
		$('#summernote').summernote(
				{
					placeholder : '내용을 입력해주세요',
					tabsize : 2,
					height : 500,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
<<<<<<< Updated upstream
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
=======
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
>>>>>>> Stashed changes
				});
	</script>

	<%@ include file="/include/footer.jsp"%>
</body>
</html>