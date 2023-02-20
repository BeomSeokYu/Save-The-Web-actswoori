<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
		String lno = request.getParameter("lno");
		int lnoo = Integer.parseInt(lno);
 	
		
		String ltitle = request.getParameter("ltitle");
		String lname = request.getParameter("lname");
		String lcontent = request.getParameter("lcontent");
		
		LectureDAO.update(lnoo, ltitle, lname, lcontent);
	
		response.sendRedirect("lectureDetail.jsp?lno=" + lno);
		
%>

