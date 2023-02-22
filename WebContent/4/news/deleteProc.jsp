<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String sid = (String) session.getAttribute("sid"); // 보안 처리
if (sid == null) {
	response.sendRedirect("newsAll.jsp");
	return;
}

int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.deleteNews(nno);

if (result) {
	response.sendRedirect("newsAll.jsp?msg=deleteSuccess");
} else {
response.sendRedirect("newsDetail.jsp?msg=fail");
}
%>