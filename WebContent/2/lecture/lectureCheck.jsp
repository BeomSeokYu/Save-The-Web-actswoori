<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String ltitle = request.getParameter("ltitle");
	String lname = request.getParameter("lname");
	String lcontent = request.getParameter("lcontent");
	
	LectureDAO.insert(ltitle,lname,lcontent);
	
	response.sendRedirect("/2/lecture/lectureMain.jsp");
%>

