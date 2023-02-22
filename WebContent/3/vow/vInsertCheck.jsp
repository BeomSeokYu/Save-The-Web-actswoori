<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>