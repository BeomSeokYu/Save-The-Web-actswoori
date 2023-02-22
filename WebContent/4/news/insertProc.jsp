<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String ntitle = request.getParameter("title");
String ncontent = request.getParameter("content");
String nemail = (String) session.getAttribute("sid"); // 세션에서 받아올 예정

if (nemail == null || ntitle == null) { // 보안 처리
	response.sendRedirect("newsAll.jsp");
	return;
}

boolean result = NewsDAO.insertNews(ntitle, ncontent, nemail);

/* for(int i=0; i<30; i++) {
	result = NewsDAO.insertNews(ntitle+i, ncontent+i , nemail);
} */

if (result) {
	response.sendRedirect("newsAll.jsp?msg=insertSuccess");
} else {
response.sendRedirect("insertForm.jsp?msg=fail");
} 
%>