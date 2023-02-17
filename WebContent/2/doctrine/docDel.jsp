<%@page import="jdbc.docDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	int dno = Integer.parseInt(request.getParameter("dno"));
	
	out.print(docDAO.deleteDoc(dno));  
%>



