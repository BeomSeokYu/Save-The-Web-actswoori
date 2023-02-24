<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>

<%@page import="jdbc.docDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String sid = (String) session.getAttribute("sid"); // 보안 처리
	if (sid == null) {
		response.sendRedirect("doctrine.jsp");
		return;
	}

	int dno = Integer.parseInt(request.getParameter("dno"));

	out.print(docDAO.deleteDoc(dno));
%>
<script>history.forward();</script>


