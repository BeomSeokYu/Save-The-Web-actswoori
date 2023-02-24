<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@include file="/include/header.jsp" %>  

<%
request.setCharacterEncoding("utf-8");

String ctitle = request.getParameter("ctitle");
String ccontent = request.getParameter("ccontent");
String email = (String) session.getAttribute("sid");

if (sid == null || ctitle == null) { // 보안 처리
	response.sendRedirect("coopList.jsp");
	return;
}

int result = coopDAO.insert(ctitle, ccontent,email);
/*  for(int i=0; i<30; i++) {
result = coopDAO.insert(ctitle+i, ccontent+i );
}  */
if(result == 1){ %>
	
	<script>
 		$(function() {
 			popModal2("협력 교회와 기관 소식 등록", "등록 완료 하였습니다.", "coopList.jsp")}); 

	</script>
	
<%}else{%>
	<script>
		$(function() {
			popModal2("협력 교회와 기관 소식 등록", "등록을 실패 하였습니다.", "coopList.jsp")}); 
	</script>
<% } %>

<%@include file="/include/footer.jsp" %>
<script>history.forward();</script>
