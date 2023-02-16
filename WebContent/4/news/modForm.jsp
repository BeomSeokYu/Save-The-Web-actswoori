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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<%
int nno = Integer.parseInt(request.getParameter("nno"));
NewsDTO ndto = NewsDAO.selectNews(nno);
%>


<form id="insertForm" action="modProc.jsp" method="post">
<input type="hidden" name="nno" id="nno" value="<%= ndto.getNno() %>">
<input type="hidden" name="content" id="content">

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" name="title" value="<%= ndto.getNtitle() %>" class="form-control" id="title" placeholder="제목을 입력해주세요">
</div>

<div class="bg-light rounded" >
<div id="summernote"></div>
</div>
<div class="p-3 text-end">
<button type="button" class="btn btn-primary" onclick="addItem()">수정하기</button>
</div>
</form>

<%@ include file="/include/footer.jsp" %>

<script>
$(function(){
const urlParams = new URL(location.href).searchParams;
const msg = urlParams.get('msg');
if (msg == "fail") {
	popModal("오류 발생", "오류가 발생하였습니다. 다시 시도해주세요.")
}
});

</script>

 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

  <script>
  
   $('#summernote').summernote({
     placeholder: 'Hello stand alone ui',
     tabsize: 2,
     height: 120,
     toolbar: [
       ['style', ['style']],
       ['font', ['bold', 'underline', 'clear']],
       ['color', ['color']],
       ['insert', ['link', 'picture']],
       ['view', ['fullscreen']]
     ]
   });
   
	$('#summernote').summernote('code', "<%= ndto.getNcontent() %>");
   
   function addItem() {
		 $("#content").val($("#summernote").summernote("code"));
		 $("#insertForm").submit();
   }
 </script>

</body>


</html>