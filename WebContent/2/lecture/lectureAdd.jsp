<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("lectureMain.jsp");
		return;
	}
%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>

	<!-- 썸머노트 -->
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


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
		<form action=lectureCheck.jsp method="post" id="form">

			<input type="hidden" name="email" value="<%=sid %>" >

			<div class="input-group mb-2 input-group-lg">
				<span class="input-group-text col-2 justify-content-center" >제목</span> 
				<input type="text" class="form-control col-11" placeholder="제목을 입력하세요" name="ltitle" required id="ltitle">
			</div>

			<div class="input-group mb-3 input-group-lg">
				<span class="input-group-text col-2 justify-content-center" >설교자</span> 
				<input type="text" class="form-control col-10" name="lname" placeholder="설교자를 입력하세요" required id="lname">
			</div>


			<div>
				<textarea name="lcontent" id="summernote" class="mtop-10"></textarea>
			</div>
			
			

			<div class="d-flex justify-content-end my-4">
				<button class="btn btn-outline-primary mx-2" type="button" onclick="gogo()">등록</button>
				<input type="button" value="취소" onclick="location.href='lectureMain.jsp'"
					class="btn btn-outline-secondary mx-2">
			</div>
		</form>
	</div>
	
	<!--<button onclick="location.href='/2/lecture/lectureMain.jsp'" class="btn btn-warning">취소</button>  -->
	</div></div></div>


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
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
							placeholder : '내용을 입력해주세요'
				});
		
	function gogo(){
		var title = $('#ltitle').val().trim()
		var name = $('#lname').val().trim()
		
		if(title=='' || name==''||  $('#summernote').summernote('isEmpty')) {
			alert('제목 또는 내용을 입력해주세요')
		} else {
			$('#form').submit()
		}
	}
		
	</script>

	<%@ include file="/include/footer.jsp"%>
</body>
</html>