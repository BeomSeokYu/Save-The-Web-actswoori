<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>


<%@page import="jdbc.docDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	String dtitle = request.getParameter("dtitle");
	String dcontent = request.getParameter("dcontent");
	String email = (String)session.getAttribute("sid");
	
	
	if (email == null || dtitle == null) { // 보안 처리;
		response.sendRedirect("doctrin.jsp");
		return;
	}
	

	
	out.print(docDAO.insertDoc(dtitle, dcontent, email));
%>
<script>history.forward();</script>

