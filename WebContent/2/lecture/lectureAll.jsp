<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<table align=center>
<tr>
				<th>제목</th>
		   		<th>설교자</th>
		   		<th>날짜</th>
</tr>

<%
	ArrayList<LectureDTO> lectures = LectureDAO.getList();
	
	for (LectureDTO lecture : lectures) {
%>

	<tr><td colspan=2><hr></td></tr>
	<td><%=lecture.getLtitle() %></td>
	<td colspan=2><%=lecture.getLname() %></td>
	<td><small><%=lecture.getLdate() %></small></td>
	</tr>
<%
	}
%>
</table>
<%@ include file="/include/footer.jsp" %>
</body>
</html>