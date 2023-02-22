<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

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
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	System.out.println(email);
	System.out.println(password);
	System.out.println(name);
	System.out.println(job);
	
	if (UserDAO.edit(email, password, name, job)) {
		System.out.println("수정 성공");
		response.getWriter().write("success");
	} else {
		System.out.println("수정 실패");
		response.getWriter().write("fail");
	}
	
%>