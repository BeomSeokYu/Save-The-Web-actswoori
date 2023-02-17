<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = "asd@asd.asd"; // 세션에서 받아올 예정
	String vtitle = request.getParameter("vtitle");
	String vcontent = request.getParameter("vcontent");
	
	int result = VowDAO.insert(email, vtitle, vcontent);
	
	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>