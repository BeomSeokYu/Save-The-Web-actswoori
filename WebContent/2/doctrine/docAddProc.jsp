<%@page import="jdbc.docDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	String dtitle = request.getParameter("dtitle");
	String dcontent = request.getParameter("dcontent");
	
	out.print(docDAO.insertDoc(dtitle, dcontent));  
%>



