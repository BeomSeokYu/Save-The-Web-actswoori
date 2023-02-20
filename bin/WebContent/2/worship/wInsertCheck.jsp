<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = "asd@asd.asd"; // 세션에서 받아올 예정
	String wname = request.getParameter("wname");
	String wtitle = request.getParameter("wtitle");
	String wcontent = request.getParameter("wcontent");
	
	int result = WorshipDAO.insert(email, wname, wtitle, wcontent);
	
	if(result == 1) {
		response.sendRedirect("wSelectAll.jsp");
	}
%>