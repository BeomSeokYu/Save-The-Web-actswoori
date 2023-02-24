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

sid = (String) session.getAttribute("sid"); // 보안 처리
if (sid == null) {
	response.sendRedirect("coopList.jsp");
	return;
}

int cno = Integer.parseInt(request.getParameter("cno"));
coopDAO cdao = new coopDAO();
int result = coopDAO.delete(cno);

if(result == 1){
%>
	<script>
	window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "coopList.jsp")}
	</script>
<%	} else {	%>
	<script>
		window.onload = function(){ popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "coopList.jsp")}
	</script>
<%	}	%>
<%@ include file="/include/footer.jsp" %>   
<script>history.forward();</script>