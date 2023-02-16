<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int wno = Integer.parseInt(request.getParameter("wno"));

	out.print(WorshipDAO.selectOne(wno));
%>