<%@page import="jdbc.docDAO"%>
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
<script>
 	<%int dno = Integer.parseInt(request.getParameter("dno")); %>
  	function searchFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'/2/doctrine/docViewProc.jsp',
 			data : {dno:dno,
				},
			dataType:"text",
 			success:function(data){
 				var feeds = JSON.parse(data.trim());
 				
 				} 
				
 			}
 		});
 	}
 


 	window.onload = function() {
 		searchFunction();
 	}

 
 </script>



<%@ include file="/include/footer.jsp" %>
	
</body>
</html>