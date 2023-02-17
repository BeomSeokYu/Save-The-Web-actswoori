<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<form action="wUpdateCheck.jsp" method="post">
		<input type="hidden" name="wno" id="wno">
		<div class="container">
			<div>
			  <label for="wtitle" class="form-label">제목</label>
			  <input type="text" class="form-control" id="wtitle" name="wtitle" required>
			</div>
			<div>
			  <label for="wname" class="form-label">설교자</label>
			  <input type="text" class="form-control" id="wname" name="wname">
			</div>
			<div>
			  <label for="wcontent" class="form-label">내용</label>
			  <textarea class="form-control" id="wcontent" name="wcontent" rows="3"></textarea>
			</div>
			<div>
				<button class="btn btn-primary" type="submit">수정</button>
				<a class="btn btn-primary" href="wSelectAll.jsp" role="button">목록</a>
			</div>
		</div>
	</form>
<%@ include file="/include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript">
		var wno = <%=request.getParameter("wno")%>

		function viewFunction(no) {
			$.ajax({
				type : 'post',
				url : 'wSelectOneCheck.jsp',
				data : {wno : no},
				dataType : "text",
				success : function (data) {
					var worship = JSON.parse(data.trim());

					$("#wno").val(worship.wno);
					$("#wtitle").val(worship.wtitle);
					$("#wname").val(worship.wname);
					$('#wcontent').val(worship.wcontent);
					
					$('#wcontent').summernote({
					    tabsize: 2,
					    height: 120,
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
				}
			});
		}
		
		window.onload = function() {
			viewFunction(wno);
		}
	</script>
</body>
</html>