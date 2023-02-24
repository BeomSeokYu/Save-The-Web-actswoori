<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-16
버전 정보 : 1.0--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>행전우리교회</title>
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
<%@ include file="/include/navbar.jsp"%>
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>복음과 교리 수정</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>
		<div class="input-group mb-2 input-group-lg">
			<span class="input-group-text col-2 justify-content-center">제목</span> 
			<input type="text" class="form-control col-10" name="dtitle" id="dtitle" required placeholder="제목을 입력해주세요">
		</div>
		
		<div>
			<textarea name="content" id="summernote" class="mtop-10"></textarea>
		</div>
		
		<div class="d-flex justify-content-end my-4">
			<button class="btn btn-outline-primary mx-2" onclick="modItem()">수정</button>
			<input type="button" value="취소" onclick="location.href='doctView.jsp?dno=<%=request.getParameter("dno")%>'"
				class="btn btn-outline-secondary mx-2">
		</div>
</div></div></div></div>
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
				        ],
				          placeholder : '내용을 입력해주세요'
				      });
				
				} 
			})
		}
  
  function modItem() {
		var title = $('#dtitle').val().trim()
		if(title=='' || $('#summernote').summernote('isEmpty')){
			confirm('제목 또는 내용을 입력해주세요')
		} else {
		$.ajax({
			type:"post",
			url: "docModProc.jsp",
			data : {dtitle:document.getElementById('dtitle').value,
				    dcontent:$("#summernote").summernote("code"),
				    dno:dno
				},
        
			dataType:"text",
			
			success:function(data) {
				data = data.trim()
				if (data=='true'){
					popModal2("복음과 교리 수정", "수정에 성공하셨습니다", "docView.jsp?dno="+dno)
				} else {
					popModal2("복음과 교리 수정", "수정에 실패하셨습니다", "docView.jsp?dno="+dno)
				}
				var summernote = document.getElementById('summernote');
				summernote.value="";
				$("#summernote").summernote("reset");
				
			}
		});
	}
  window.onload = function() {
		searchFunction(dno);
	}
  }
    </script>

<%@ include file="/include/footer.jsp" %>
	
</body>
</html>