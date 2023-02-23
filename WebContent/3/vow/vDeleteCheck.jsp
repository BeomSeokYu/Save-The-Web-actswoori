<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="/include/header.jsp"%>   
<%
<<<<<<< Updated upstream
	String sid = (String) session.getAttribute("sid"); // 보안 처리
	if (sid == null || !sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) {
=======
	if (sid == null) {
>>>>>>> Stashed changes
		response.sendRedirect("vSelectAll.jsp");
		return;
	}

	int vno = Integer.parseInt(request.getParameter("vno"));
	
	int result = VowDAO.delete(vno);

	if (result == 1){%>
	<script>
	window.onload = function(){ popModal2("말씀 서원 삭제", "삭제에 성공하셨습니다", "vSelectAll.jsp")}
	</script>
<%} else {%>
	<script>
	window.onload =  function(){popModal2("말씀 서원 삭제", "삭제에 실패하셨습니다", "vSelectAll.jsp")}
	</script>
<%}%>
	<%@ include file="/include/footer.jsp"%>   
