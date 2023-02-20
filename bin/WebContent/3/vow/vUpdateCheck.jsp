<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int vno = Integer.parseInt(request.getParameter("vno"));
	String vtitle = request.getParameter("vtitle");
	String vcontent = request.getParameter("vcontent");
	
	int result = VowDAO.update(vno, vtitle, vcontent);

	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>