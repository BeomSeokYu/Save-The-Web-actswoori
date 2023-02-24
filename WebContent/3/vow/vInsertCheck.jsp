<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>   

<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String) session.getAttribute("sid"); // 세션에서 받아올 예정
	String vtitle = request.getParameter("vtitle");
	String vcontent = request.getParameter("vcontent");
	
	if (email == null || vtitle == null) { // 보안 처리
		response.sendRedirect("vSelectAll.jsp");
		return;
	}
	
	int result = VowDAO.insert(email, vtitle, vcontent);
	
	if (result == 1){%>
	<script>
	window.onload = function(){ popModal2("말씀 서원 등록", "등록에 성공하셨습니다", "/3/vow/vSelectAll.jsp")}
	</script>
<%} else {%>
	<script>
	window.onload =  function(){popModal2("말씀 서원 등록", "등록에 실패하셨습니다", "/3/vow/vSelectAll.jsp")}
	</script>
<%}%>

<%@ include file="/include/footer.jsp"%>   
<script>history.forward();</script>