<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
int cno = Integer.parseInt(request.getParameter("cno"));
coopDAO cdao = new coopDAO();
int result = coopDAO.delete(cno);

if(result == 1){ %>

<script>
		$(function() {
			popModal2("협력 교회와 기관 소식 삭제", "삭제를 성공하셨습니다.", "coopList.jsp")}); 

</script>

<%}else{%>
<script>
	$(function() {
		popModal2("협력 교회와 기관 소식 삭제", "삭제를 실패하셨습니다.", "coopList.jsp")}); 
</script>
<% } %>

<%@include file="/include/footer.jsp" %>

