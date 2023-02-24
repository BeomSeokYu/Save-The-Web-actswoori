<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>

<%@page import="jdbc.docDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>행전우리교회</title>
<meta charset="UTF-8">
<%@ include file="/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<!-- <input type="hidden" id="email"> -->
<%@ include file="/include/navbar.jsp" %>
<script>
window.onload = function() {
 	var dno = <%=request.getParameter("dno")%>;
 	
 	<%-- var sid = "<%=sid%>"
 	var admin = "<%=admin%>" --%>

 	function searchFunction(dno) {
 		
 		$.ajax({
 			type:'post',
 			url:'docViewProc.jsp',
 			data : {dno:dno},
			dataType:"text",
 			success:function(data){
 				var doc = JSON.parse(data.trim());
 				var title = doc.dtitle;
 				var date = doc.ddate;
 				date = date.substring(0,11);
 			
				$("#title").html(title);
				$("#content").html(doc.dcontent);
				//val로 출력하는게 안되서 html 로 바꿔서 아이디로 출력하게 했습니다.
				//? name은 doctrine에서 파라미터로 넘어오는데, date는 넘어오지 않음. 왜?
				$("#name").html(name); 
				$("#date").html(date);
				
 				} 
 			
 			})
 		}

 		searchFunction(dno);
 		
 		
		
	}
  	function delItem(dno) {
 		$.ajax({
 			type:"post",
 			url: "docDel.jsp",
 			data : {dno:dno},
 			dataType:"text",
 			
 			success:function(data) {
 				data = data.trim()
				if (data=='true'){
					popModal2("삭제", "삭제되었습니다.", "doctrine.jsp")
				} else {
					popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "doctrine.jsp")
				}

 			}
 		});
 	}
  	
	function delCheck() {
		var flag = confirm("정말로 삭제하시겠습니까?");
		if(flag) {
			delItem('<%=request.getParameter("dno") %>');
		}
	}
	
 </script>
 
 	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<div class="col-3 d-none d-lg-block pt-5">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
				
				<div class="pt-5"></div>
				<h2>복음과 교리</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5" id = "title"></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2" id = "name"></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2" id = "date"></th>
						</tr>
					</table>
					<div class="py-3 px-5">
						<div class="text-lg">
							<p id = "content"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="location.href='doctrine.jsp'"
				class="btn btn-outline-success">

<%
		if (admin || (sid != null && sid.equals(docDAO.selectEmail(Integer.parseInt(request.getParameter("dno")))))) { // 세션 처리
%>
			<button
				onclick="location.href='/2/doctrine/docMod.jsp?dno=<%=request.getParameter("dno") %>'"
				class="btn btn-outline-primary ad">수정</button>
			<button
				onclick="delCheck()"
				class="btn btn-outline-danger ad">삭제</button>
<%
	}
%>
		</div>
	</div>
	
    <%@ include file="/include/footer.jsp" %>
    
    
    
</body>
</html>