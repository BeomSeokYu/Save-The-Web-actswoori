<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<%
int nno = Integer.parseInt(request.getParameter("nno"));
NewsDTO ndto = NewsDAO.selectNews(nno);

%>
<div class="container">

<hr>
<h3> <%= ndto.getNtitle()  %></h3>
<hr>

<div class="d-flex justify-content-between">
<span class="item"><%= ndto.getEmail()  %></span>
<span class="item"><%= ndto.getNdate()  %></span>
</div>

<hr>

<div>
<%= ndto.getNcontent()  %>
</div>

<hr>

<div class="d-flex justify-content-between">
<a href="#" >이전으로</a>
<a href="newsAll.jsp?pageNum=<%= request.getParameter("pageNum") %>&amount=<%= request.getParameter("amount") %>" >목록으로</a>
<a href="#" >다음으로</a>
</div>

<hr>

<a href="modForm.jsp?nno=<%=ndto.getNno() %>" class="btn btn-warning"> 수정하기 </a>
<a href="deleteProc.jsp?nno=<%=ndto.getNno() %>" class="btn btn-danger"> 삭제하기 </a>

</div>
<%@ include file="/include/footer.jsp" %>

<script>

$(function(){
	const urlParams = new URL(location.href).searchParams;
	const msg = urlParams.get('msg');

	if (msg == "modSuccess") {
		popModal("수정 성공", "수정에 성공하였습니다.")
	} else if (msg == "fail") {
		popModal("오류 발생", "오류가 발생하였습니다. 다시 시도해주세요.")
	}
});



</script>

</body>
</html>