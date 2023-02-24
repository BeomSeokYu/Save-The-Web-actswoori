<!-- 복음과교리 추가 - 현식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("vSelectAll.jsp");
		return;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="/include/navbar.jsp" %>
<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>말씀 서원 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar3.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>
	<form action="vInsertCheck.jsp" method="post" id="form">
	<div class="container">
		<div class="pt-5"></div>
		<h2>말씀 서원 등록</h2>
		<hr>
			<div class="input-group mb-2 input-group-lg">
				<span class="input-group-text col-2 justify-content-center">제목</span> 
				<input type="text" class="form-control col-10" placeholder="제목을 입력하세요" id="vtitle" name="vtitle" required>
			</div>
			
			<div>
			  <textarea class="mtop-10" id="vcontent" name="vcontent" ></textarea>
			</div>
			
			<div class="d-flex justify-content-end my-4">
				<button class="btn btn-outline-primary mx-2" type="button" onclick="gogo()">등록</button>
				<input type="button" value="취소" onclick="location.href='vSelectAll.jsp'"
					class="btn btn-outline-secondary mx-2">
			</div>
			
	</form>
		</div></div></div></div>
<%@ include file="/include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript">
		$('#vcontent').summernote({
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
		    ],
		    placeholder:"내용을 입력해주세요"
		  });
		
		function gogo(){
			var title = $('#vtitle').val().trim()
			
			if(title=='' ||  $('#vcontent').summernote('isEmpty')) {
				alert('제목 또는 내용을 입력해주세요')
			} else {
				$('#form').submit()
			}
		}
	</script>
	

</body>
</html>