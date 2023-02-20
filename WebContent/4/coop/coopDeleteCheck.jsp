<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
int cno = Integer.parseInt(request.getParameter("cno"));
coopDAO cdao = new coopDAO();
int result = coopDAO.delete(cno);

if(result==1){

%>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">게시물 삭제</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        게시물 삭제 완료
	      </div>
	      <div class="modal-footer">
		        <button onclick="location.href='coopList.jsp'" class="btn btn-primary">목록으로</button>

	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(function() {
			$("#exampleModal1").modal("show");
		});
	</script>	
	
<% 		
	}

%>
</body>
 <%@include file="/include/footer.jsp" %>
</html>