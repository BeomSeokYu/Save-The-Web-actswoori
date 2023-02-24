<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="/include/header.jsp"%>   
<%
	if (sid == null || !sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) {
		response.sendRedirect("vSelectAll.jsp");
		return;
	}

	int vno = Integer.parseInt(request.getParameter("vno"));
	
	int result = VowDAO.delete(vno);

	if (result == 1){
%>
	<script>
	window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "vSelectAll.jsp")}
	</script>
<%	} else {	%>
	<script>
		window.onload = function(){ popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "vSelectAll.jsp")}
	</script>
<%	}	%>
<%@ include file="/include/footer.jsp" %>     
<script>history.forward();</script>