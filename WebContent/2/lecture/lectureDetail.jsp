<%@page import="jdbc.LectureDTO"%>
<%@page import="jdbc.LectureDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String lno = request.getParameter("lno");
	int lnoo = Integer.parseInt(lno);
	LectureDTO lecture = LectureDAO.getDetail(lnoo); 
%>
	
	<%=lecture.getLtitle() %><br>
	<%=lecture.getLcontent() %><br>
	<%=lecture.getLname() %><br>
	<%=lecture.getLdate() %><br>
<button onclick="location.href='/2/lecture/lectureModify.jsp?lno=<%=lecture.getLno()%>'" class="btn btn-primary">수정</button> 
</body>
</html>