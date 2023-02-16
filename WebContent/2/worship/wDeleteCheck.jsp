<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int wno = Integer.parseInt(request.getParameter("wno"));
	
	int result = WorshipDAO.delete(wno);

	if(result == 1) {
		response.sendRedirect("wSelectAll.jsp");
	}
%>