<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("eutf-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	if (UserDAO.existPw(email, name)) {
		out.print("success");
	} else {
		out.print("fail");
	}
%>