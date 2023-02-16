<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<div class="container shadow mx-auto p-5 w-75">
 
 <script>
 	
  	function searchFunction() {
 		
 		$.ajax({
 			type:'post',
 			url:'/2/doctrine/docList.jsp',

 			success:function(data){
 				var feeds = JSON.parse(data.trim());
 				
 				var str = "";
 				for(var i = 0; i < feeds.length; i++){
 					
					
 					str += "<tr><td>" + feeds[i].dno + "</td>";
 					str += "<td><a href='docView.jsp?dno="+ feeds[i].dno +"'>" + feeds[i].dtitle + "</a></td>";		
 					str += "<td>" + feeds[i].ddate + "</td></tr>";
 				} $("#ajaxTable").html(str);
 			}
 		});
 	}
 


 	window.onload = function() {
 		searchFunction();
 	}

 
 </script>
 
<div style="height: 100px;">
		</div>
<h1>복음과 교리</h1>
<hr>
<div class = "input-group justify-content-center">

</div>
<table align=center>
<thead>
	
</thead>
<tbody id="ajaxTable">

</tbody>
</table>
</div>
</div>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>