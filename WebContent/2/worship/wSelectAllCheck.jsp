<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pn = Integer.parseInt(request.getParameter("pn"));

	out.print(WorshipDAO.selectAllPaging(pn));
%>