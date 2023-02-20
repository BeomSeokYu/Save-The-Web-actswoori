<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
--> 
<%@page import="jdbc.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.PostDTO, java.util.ArrayList, jdbc.PostDAO"  %>
<!DOCTYPE html>
<html>
<head>
<style>
iframe {
	display: block;
	border: none;
	margin: auto;
	height: 80vh;
	width: 80%;
	overflow:hidden;
	frameborder:0;
	scrolling: no;
}
</style>
</head>

<body>

<%
	int pno = Integer.parseInt(request.getParameter("pno"));

	PostDTO pdto = PostDAO.selectPost(pno);
	String filePath = pdto.getPupfolder() + "/" + pdto.getPuuid() + "_" + pdto.getPfilename(); %>
 
<div class="container">
	<div><h3><%=pdto.getPtitle() %> written by <%=pdto.getEmail() %> </h3></div>
	<iframe src="<%=filePath %>" ></iframe>
	
	<div>
		<a href="postEdit.jsp?pno=<%=pdto.getPno() %>">수정</a>
		<a href="postRemove.jsp?pno=<%=pdto.getPno() %>">삭제</a>
	</div>
</div>


</body>
</html>