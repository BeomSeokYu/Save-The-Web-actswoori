<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
<%
	if(sid == null || !sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno"))))) { // 보안 처리
		response.sendRedirect("wSelectAll.jsp");
		return;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<div class="container">
		<div class="pt-5"></div>
		<h2>예배 수정</h2>
		<hr>
	<form action="wUpdateCheck.jsp" method="post">
		<input type="hidden" name="wno" id="wno">
		
		<div class="input-group mb-2 input-group-lg">
			<span class="input-group-text col-1 mx-auto">제목</span> 
			<input type="text" class="form-control col-11" name="wtitle" id="wtitle" required>
		</div>
		<div class="input-group mb-3 input-group-lg">
			<span class="input-group-text col-1" >설교자</span> <input
				type="text" class="form-control col-11" name="wname" id="wname" required>
		</div>
		
		<div>
			<textarea name="wcontent" id="wcontent" class="mtop-10"></textarea>
		</div>
		
		<div class="d-flex justify-content-end my-4">
			<button class="btn btn-outline-primary mx-2" type="submit">수정</button>
			<input type="button" value="취소" onclick="history.back()"
				class="btn btn-outline-secondary mx-2">
		</div>
	</form>
</div>
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
				}
			});
		}
		
		window.onload = function() {
			viewFunction(wno);
		}
	</script>
</body>
</html>