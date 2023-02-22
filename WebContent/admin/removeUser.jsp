<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String email = request.getParameter("email");

if (UserDAO.delete(email)) {
	out.print(1);	
} else {
	out.print(0);	
}

%>