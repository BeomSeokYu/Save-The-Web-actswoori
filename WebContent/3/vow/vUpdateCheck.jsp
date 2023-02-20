<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid"); // 보안 처리
	if (sid == null || !sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) {
		response.sendRedirect("vSelectAll.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	
	int vno = Integer.parseInt(request.getParameter("vno"));
	String vtitle = request.getParameter("vtitle");
	String vcontent = request.getParameter("vcontent");
	
	int result = VowDAO.update(vno, vtitle, vcontent);

	if(result == 1) {
		response.sendRedirect("vSelectAll.jsp");
	}
%>