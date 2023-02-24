<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="/include/header.jsp"%>   

<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String) session.getAttribute("sid"); // 세션에서 받아올 예정
	String wname = request.getParameter("wname");
	String wtitle = request.getParameter("wtitle");
	String wcontent = request.getParameter("wcontent");
	
	if (email == null || wtitle == null) { // 보안 처리
		response.sendRedirect("wSelectAll.jsp");
		return;
	}
	
	int result = WorshipDAO.insert(email, wname, wtitle, wcontent);
	
	if (result == 1){%>
		<script>
		window.onload = function(){ popModal2("예배 설교 등록", "등록에 성공하셨습니다", "/2/worship/wSelectAll.jsp")}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("예배 설교 등록", "등록에 실패하셨습니다", "/2/worship/wSelectAll.jsp")}
		</script>
	<%}%>

	<%@ include file="/include/footer.jsp"%>   
<script>history.forward();</script>