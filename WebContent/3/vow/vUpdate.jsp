<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
<%
	if (sid == null || !sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) { // 보안 처리
		response.sendRedirect("vSelectAll.jsp");
		return;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<form action="vUpdateCheck.jsp" method="post">
		<input type="hidden" name="vno" id="vno">
		<div class="container">
			<div>
			  <label for="vtitle" class="form-label">제목</label>
			  <input type="text" class="form-control" id="vtitle" name="vtitle" required>
			</div>
			<div>
			  <label for="vcontent" class="form-label">내용</label>
			  <textarea class="form-control" id="vcontent" name="vcontent" rows="3"></textarea>
			</div>
			<div>
				<button class="btn btn-primary" type="submit">수정</button>
				<a class="btn btn-primary" href="vSelectAll.jsp" role="button">목록</a>
			</div>
		</div>
	</form>
<%@ include file="/include/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript">
		var vno = <%=request.getParameter("vno")%>
	
		function viewFunction(no) {
			$.ajax({
				type : 'post',
				url : 'vSelectOneCheck.jsp',
				data : {vno : no},
				dataType : "text",
				success : function (data) {
					var vow = JSON.parse(data.trim());

					$("#vno").val(vow.vno);
					$("#vtitle").val(vow.vtitle);
					$('#vcontent').val(vow.vcontent);
					
					$('#vcontent').summernote({
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
			viewFunction(vno);
		}
	</script>
</body>
</html>