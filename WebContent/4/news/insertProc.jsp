<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String email = (String) session.getAttribute("sid");
String ntitle = request.getParameter("title");
String ncontent = request.getParameter("content");
// String nemail = request.getParameter("email");


boolean result = NewsDAO.insertNews(ntitle, ncontent, email);

/* for(int i=0; i<30; i++) {
	result = NewsDAO.insertNews(ntitle+i, ncontent+i , nemail);
} */

if (result) {
	response.sendRedirect("newsAll.jsp?msg=insertSuccess");
} else {
response.sendRedirect("insertForm.jsp?msg=fail");
} 
%>