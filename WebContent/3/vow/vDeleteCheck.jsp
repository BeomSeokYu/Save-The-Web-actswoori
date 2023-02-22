<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid"); // 보안 처리
	if (sid == null) {
		response.sendRedirect("vSelectAll.jsp");
		return;
	}

	int vno = Integer.parseInt(request.getParameter("vno"));
	
	int result = VowDAO.delete(vno);

	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>