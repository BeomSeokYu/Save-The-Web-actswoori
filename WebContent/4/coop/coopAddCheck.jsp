<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@include file="/include/header.jsp" %>  

<%
request.setCharacterEncoding("utf-8");

String ctitle = request.getParameter("ctitle");
String ccontent = request.getParameter("ccontent");
String email = (String) session.getAttribute("sid");

int result = coopDAO.insert(ctitle, ccontent, email);
/*  for(int i=0; i<30; i++) {
result = coopDAO.insert(ctitle+i, ccontent+i );
}  */
if(result == 1){ %>
	
	<script>
 		$(function() {
 			popModalRedirect("게시물 등록", "등록 완료 하였습니다.", "coopList.jsp")}); 

	</script>
	
<%}else{%>
	<script>
		$(function() {
			popModalRedirect("게시물 등록", "등록을 실패 하였습니다.", "coopList.jsp")}); 
	</script>
<% } %>

<%@include file="/include/footer.jsp" %>
