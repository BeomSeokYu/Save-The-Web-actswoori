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
제목 <input type="text" id="dtitle" > <br>

내용 <br>
<textarea name="content" id="summernote" class="mtop-10"></textarea>
<hr>
<input type="button" value="이전으로" onclick="history.back()">
<button type="button" class="btn btn-primary" onclick="modItem()">완료</button>

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
				        height: 60,
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