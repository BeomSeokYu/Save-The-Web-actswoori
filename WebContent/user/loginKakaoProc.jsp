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

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	System.out.println(id);
	System.out.println(password);
	
	if (UserDAO.exist(id)) {
		session.setAttribute("sid", id);
		out.println("success");
	} else {
		out.println("fail");
	}
%>