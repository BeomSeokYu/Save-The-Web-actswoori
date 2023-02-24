<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="/include/header.jsp"%>   

<%
	if (sid == null || !sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno"))))) {
		response.sendRedirect("wSelectAll.jsp");
		return;
	}

	int wno = Integer.parseInt(request.getParameter("wno"));
	
	int result = WorshipDAO.delete(wno);

	if (result == 1){
%>
	<script>
	window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "wSelectAll.jsp")}
	</script>
<%	} else {	%>
	<script>
		window.onload = function(){ popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "wSelectAll.jsp")}
	</script>
<%	}	%>
<%@ include file="/include/footer.jsp" %>   
<script>history.forward();</script>