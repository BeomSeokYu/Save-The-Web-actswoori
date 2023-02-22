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
<div class="photo-gallery container mb-3">
	<div class="row justify-content-center">
		<div class="col-3 d-none d-lg-block">
			<%@ include file="/include/sidebar4.jsp" %>
		</div>
<div class="col-9">
     			
<h2 class="px-2"> <%= ndto.getNtitle()  %></h2>


<div class="shadow bg-body rounded">
<div class="p-3 d-flex justify-content-between" style="background-color: #548687; color: white">
<span class="item">작성자 : <%= ndto.getEmail()  %></span>
<span class="item">작성일시 : <%= ndto.getNdate()  %></span>
</div>

<div class="p-3">
<%= ndto.getNcontent()  %>
</div>
</div>

<hr>
<div class="row">
<div class="text-start col-6">
<a href="newsAll.jsp?" class="btn btn-sm btn-outline-success" >목록으로</a>
</div>


<div class="text-end col-6">
<%
	if (admin || sid != null && sid.equals(NewsDAO.selectNews(Integer.parseInt(request.getParameter("nno"))).getEmail())) { // 세션 처리
%>
<a href="modForm.jsp?nno=<%=ndto.getNno() %>" class="btn btn-sm btn-outline-warning"> 수정하기 </a>
<a href="deleteProc.jsp?nno=<%=ndto.getNno() %>" class="btn btn-sm btn-outline-danger"> 삭제하기 </a>
<%
	}
%>
</div>
</div>
</div>
</div>
</div>
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