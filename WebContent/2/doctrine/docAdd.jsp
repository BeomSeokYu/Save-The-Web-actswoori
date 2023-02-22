<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-16
버전 정보 : 1.0--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/include/header.jsp" %>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("doctrine.jsp");
		return;
	}
%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<div class="container">
<div class="pt-5"></div>
		<h2>복음과 교리 등록</h2>
		<hr>

<div class="input-group mb-2 input-group-lg">
				<span class="input-group-text col-1 mx-auto" id="dtitle">제목</span> 
				<input type="text" class="form-control col-11" placeholder="제목을 입력하세요" name="dtitle">
			</div>
<div>
				<textarea name="lcontent" id="summernote" class="mtop-10"></textarea>
			</div>
	
	
	<div class="d-flex justify-content-end my-4">
		<button class="btn btn-outline-primary mx-2" onclick="addItem()">등록</button>
		<input type="button" value="취소" onclick="history.back()"
			class="btn btn-outline-secondary mx-2">
	</div>
</div>
<script>
var sid = "<%=sid%>";
  $('#summernote').summernote({
	  tabsize: 2,
        height: 500,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
  
  function addItem() {
		$.ajax({
			type:"post",
			url: "docAddProc.jsp",
			data : {dtitle:document.getElementById('dtitle').value,
				    dcontent:$("#summernote").summernote("code"),
				    email:sid
				},
        
			dataType:"text",
			
			success:function(data) {
				var summernote = document.getElementById('summernote');
				summernote.value="";
				$("#summernote").summernote("reset");
				
				popModalRedirect("등록", "등록에 성공하셨습니다", "doctrine.jsp")
			}
		});
	}
    </script>

<%@ include file="/include/footer.jsp" %>
</body>
</html>