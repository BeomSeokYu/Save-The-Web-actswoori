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
		   		<th>작성일</th>
</tr>

<button onclick="location.href='lectureAdd.jsp'" class="btn btn-primary">글 올리기</button>


<%
	ArrayList<LectureDTO> lectures = LectureDAO.getallList();

	for (LectureDTO lecture : lectures) {
%>

	<tr><td colspan=2><hr></td></tr>
	<td><a href = "lectureDetail.jsp?lno=<%=lecture.getLno()%>"> <%=lecture.getLtitle() %></td>
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