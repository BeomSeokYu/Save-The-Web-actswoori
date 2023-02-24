<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
 <%@ include file="/include/header.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String ltitle = request.getParameter("ltitle");
	String lname = request.getParameter("lname");
	String lcontent = request.getParameter("lcontent");
	String email = sid;
	

	if(LectureDAO.insert(ltitle, lname, lcontent, email)) {%>
		<script>
		window.onload = function(){ popModal2("주요 특강 등록", "등록에 성공하셨습니다", "/2/lecture/lectureMain.jsp")}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("주요 특강 등록", "등록에 실패하셨습니다", "/2/lecture/lectureMain.jsp")}
		</script>
	<%}%>
	
	<%@ include file="/include/footer.jsp"%>   
	
<script>history.forward();</script>