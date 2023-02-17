<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

	out.print(WorshipDAO.selectAllPaging(pageNum));
%>