<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String) session.getAttribute("sid"); // 세션에서 받아올 예정
	String wname = request.getParameter("wname");
	String wtitle = request.getParameter("wtitle");
	String wcontent = request.getParameter("wcontent");
	
	if (email == null || wname == null || wtitle == null || wcontent == null) { // 보안 처리
		response.sendRedirect("wSelectAll.jsp");
		return;
	}
	
	int result = WorshipDAO.insert(email, wname, wtitle, wcontent);
	
	if (result == 1) {
		response.sendRedirect("wSelectAll.jsp");
	}
%>