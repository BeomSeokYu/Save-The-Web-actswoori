<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String email = request.getParameter("email");

out.print(UserDAO.acceptUser(email));

%>