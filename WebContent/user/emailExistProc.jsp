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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");


	String email = request.getParameter("email");
	System.out.println(email);

	if (UserDAO.exist(email)) {
		System.out.println("ok");
		response.getWriter().write('1');
	} else {
		System.out.println("no");
		response.getWriter().write('0');
	}
	
%>