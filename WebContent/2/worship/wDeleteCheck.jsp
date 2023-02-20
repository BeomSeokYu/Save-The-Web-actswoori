<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid"); // 보안 처리
	if (sid == null || !sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno"))))) {
		response.sendRedirect("wSelectAll.jsp");
		return;
	}

	int wno = Integer.parseInt(request.getParameter("wno"));
	
	int result = WorshipDAO.delete(wno);

	if(result == 1) {
		response.sendRedirect("wSelectAll.jsp");
	}
%>