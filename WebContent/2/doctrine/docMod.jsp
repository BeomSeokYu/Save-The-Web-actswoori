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
	if (sid == null) { // 보안 처리
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
		<h2>복음과 교리 수정</h2>
		<hr>
		<div class="input-group mb-2 input-group-lg">
			<span class="input-group-text col-2 justify-content-center">제목</span> 
			<input type="text" class="form-control col-10" name="dtitle" id="dtitle" required>
		</div>
		
		<div>
			<textarea name="content" id="summernote" class="mtop-10"></textarea>
		</div>
		
		<div class="d-flex justify-content-end my-4">
			<button class="btn btn-outline-primary mx-2" onclick="modItem()">수정</button>
			<input type="button" value="취소" onclick="history.back()"
				class="btn btn-outline-secondary mx-2">
		</div>
</div>
		

<script>
	var dno = <%=request.getParameter("dno")%>;

  
  
  function searchFunction(dno) {
		
		$.ajax({
			type:'post',
			url:'docViewProc.jsp',
			data : {dno:dno},
			dataType:"text",
			success:function(data){
				var doc = JSON.parse(data.trim());
				var title = doc.dtitle;
				var content = doc.dcontent;
				$("#dtitle").val(title);
				$("#summernote").val(content); 
				
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
				
				} 
			})
		}
  
  function modItem() {
		$.ajax({
			type:"post",
			url: "docModProc.jsp",
			data : {dtitle:document.getElementById('dtitle').value,
				    dcontent:$("#summernote").summernote("code"),
				    dno:dno
				},
        
			dataType:"text",
			
			success:function(data) {
				var summernote = document.getElementById('summernote');
				summernote.value="";
				$("#summernote").summernote("reset");
				
				popModalRedirect("수정", "수정에 성공하셨습니다", "doctrine.jsp")

			}
		});
	}
  window.onload = function() {
		searchFunction(dno);
	}

    </script>

<%@ include file="/include/footer.jsp" %>
	
</body>
</html>