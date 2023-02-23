<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@include file="/include/header.jsp" %>  

<%
request.setCharacterEncoding("utf-8");

String ctitle = request.getParameter("ctitle");
String ccontent = request.getParameter("ccontent");
int cno = Integer.parseInt(request.getParameter("cno"));

int result = coopDAO.update(cno,ctitle, ccontent);

if(result == 1){ %>

	<script>
		$(function() {
			popModal2("게시물 수정", "수정을 성공하셨습니다.", "/4/coop/coopInfo.jsp?cno="+<%=cno%>)}); 
	</script>
	
<%}else{%>
	<script>
	$(function() {
		popModal2("게시물 수정", "수정을 실패하셨습니다.", "/4/coop/coopInfo.jsp?cno="+<%=cno%>)}); 
	</script>
<% } %>

<%@include file="/include/footer.jsp" %>