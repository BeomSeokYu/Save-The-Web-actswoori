
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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