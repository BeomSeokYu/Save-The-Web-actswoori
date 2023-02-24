<!-- 소식추가 - 경외 글제목 사진(썸머노트) 글 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>
  <title>행전우리교회</title>
 <%@include file="/include/header.jsp" %>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("coopList.jsp");
		return;
	}
%>
  </head>
  <body>
<%@include file="/include/navbar.jsp" %>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>협력 교회와 기관 소식 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>
<form action = "coopAddCheck.jsp" method="post" id="form">

	<div class="input-group mb-2 input-group-lg">
		<span class="input-group-text col-2 justify-content-center" >제목</span> 
		<input type="text" class="form-control col-10" placeholder="제목을 입력하세요" id="ctitle" name="ctitle">
	</div>
	<div>
		<textarea name="ccontent" id="summernote" class="mtop-10"></textarea>
	</div>
	
	<input type="hidden" name="email" value="<%=sid%>">
	<div class="d-flex justify-content-end my-4">
		<button class="btn btn-outline-primary mx-2" type="button" onclick="gogo()">등록</button>
		<input type="button" value="취소" class="btn btn-outline-secondary mx-2" onclick="location.href='coopList.jsp'">
	</div>
	
</form>
</div></div></div></div>

    <script>
      $('#summernote').summernote({
			tabsize : 2,
			height : 500,
			toolbar : [ [ 'style', [ 'style' ] ],
					[ 'font', [ 'bold', 'underline', 'clear' ] ],
					[ 'color', [ 'color' ] ],
					[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
					[ 'table', [ 'table' ] ],
					[ 'insert', [ 'link', 'picture', 'video' ] ],
					[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
					placeholder:"내용을 입력해주세요"
		});
      
      function gogo(){
			var title = $('#ctitle').val().trim()
			
			if(title=='' ||  $('#summernote').summernote('isEmpty')) {
				alert('제목 또는 내용을 입력해주세요')
			} else {
				$('#form').submit()
			}
		}
      
    </script>
 <%@include file="/include/footer.jsp" %>
  </body>
</html>