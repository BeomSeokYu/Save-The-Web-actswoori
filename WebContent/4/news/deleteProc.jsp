<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.deleteNews(nno);

if (result) {
	response.sendRedirect("newsAll.jsp?msg=deleteSuccess");
} else {
response.sendRedirect("newsDetail.jsp?msg=fail");
}
%>