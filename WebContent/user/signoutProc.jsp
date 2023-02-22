<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>


<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect("/main.jsp");
	}
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (UserDAO.login(id, password) == 1) {
		UserDAO.delete(id);
		session.invalidate();
		response.getWriter().write("success");
	} else {
		response.getWriter().write("fail");
	}
%>