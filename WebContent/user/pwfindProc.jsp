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

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	if (UserDAO.existPw(email, name)) {
		out.print("success");
	} else {
		out.print("fail");
	}
%>