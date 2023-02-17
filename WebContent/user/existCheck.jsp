<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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