<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");


	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//String passwordCheck = request.getParameter("passwordCheck");
	String name = request.getParameter("name");
	System.out.println(id);
	System.out.println(password);
	System.out.println(name);
	
	if (UserDAO.edit(id, password, name)) {
		System.out.println("수정 성공");
		response.getWriter().write("success");
	} else {
		System.out.println("수정 실패");
		response.getWriter().write("fail");
	}
	
%>