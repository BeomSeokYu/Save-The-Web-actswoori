<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String ntitle = request.getParameter("title");
String ncontent = request.getParameter("content");
int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.updateNews(nno, ntitle, ncontent);

if (result) {
	response.sendRedirect("newsDetail.jsp?msg=modSuccess&nno=" + nno);
} else {
response.sendRedirect("modForm.jsp?msg=fail");
}
%>