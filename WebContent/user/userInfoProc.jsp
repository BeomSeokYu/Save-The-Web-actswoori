<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	if(request.getMethod().equals("GET")) {
		response.sendRedirect("/main.jsp");
	}

	String email = request.getParameter("email");
	System.out.println(email);

	if (UserDAO.exist(email)) {
		out.write(UserDAO.selectUser(email));
	}
	
%>