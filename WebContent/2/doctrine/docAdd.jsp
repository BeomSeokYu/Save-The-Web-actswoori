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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<div class="container">
<br>

<div class="col-5">
  <label for="dtitle" class="form-label">제목</label>
  <input type="text" class="form-control" id="dtitle" >
</div>
<br>
<div class="mb-3">
  <label for="dcontent" class="form-label">내용</label>
  <textarea class="form-control" id="summernote" rows="50" cols="50" name="content"></textarea>
</div>
	
	<input type="button" class="btn btn-outline-secondary" value="이전으로" onclick="history.back()">
	<button type="button" class="btn btn-outline-primary" onclick="addItem()">추가</button>
	</div>
<script>
var sid = "<%=sid%>";
  $('#summernote').summernote({
	  tabsize: 2,
        height: 300,
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