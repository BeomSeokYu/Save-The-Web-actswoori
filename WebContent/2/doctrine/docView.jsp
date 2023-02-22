<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>

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
<input type="hidden" id="email">
<%@ include file="/include/navbar.jsp" %>
<script>
window.onload = function() {
 	var dno = <%=request.getParameter("dno")%>;
 	var sid = "<%=sid%>"
 	var admin = "<%=admin%>"

 	function searchFunction(dno) {
 		
 		$.ajax({
 			type:'post',
 			url:'docViewProc.jsp',
 			data : {dno:dno},
			dataType:"text",
 			success:function(data){
 				var doc = JSON.parse(data.trim());
 				var title = "<h1>" + doc.dtitle + "</h1>";
				$("#title").html(title);
				$("#content").html(doc.dcontent);
				$('#email').val(doc.email)
				console.log($("#email").val())
				if (sid==admin||sid==$("#email").val()) {
			$('.ad').show()
		} else {
		$('.ad').hide()
 		}
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
				popModalRedirect("삭제", "삭제에 성공하셨습니다", "doctrine.jsp")

 			}
 		});
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
				<h2>특강</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5" id = "title"></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2" id = "email"></th>
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

	
		<!-- if 4페이지였으면 목록 클릭했을 때 4페이지로 가게 하기 위해서 -->
		<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">목록</a>  -->

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="history.back()"
				class="btn btn-outline-success">
<%	
	// 임의 관리자 id
	/* String adminID = "admin@gmail.com";

	String sid = session.getAttribute("sid");
	boolean memberCheck = (sid != null) && sid.equals(LectureDAO.selectEmail(Integer.parseInt(request.getParameter("lno"))));
	// 회원이거나, 관리자이면 if문 수행
	if (memberCheck || sid.equals(adminID)) {  */
%>
			<%-- <button
				onclick="location.href='/2/lecture/lectureModify.jsp?lno=<%=lecture.getLno()%>'"
				class="btn btn-outline-primary">수정</button>
			<button
				onclick="location.href='/2/lecture/lectureDel.jsp?lno=<%=lecture.getLno()%>'"
				class="btn btn-outline-danger">삭제</button> --%>
<%	/* } */	%>
		</div>
	</div>
	
<div style="height: 100px;">
</div>


<!-- 원래코드 -->
<div id="title"></div>
<hr>
<div name="content" id="content" class="mtop-10"></div>
<input type="button" value="이전으로" onclick="history.back()">
<%
	if (admin || sid != null && sid.equals(docDAO.selectEmail(Integer.parseInt(request.getParameter("dno"))))) { // 세션 처리
%>
<input type="button" value="수정" onclick="location.href='docMod.jsp?dno=<%=request.getParameter("dno") %>'" class="ad">
<input type="button" value="삭제" class="ad" onclick="delItem('<%=request.getParameter("dno") %>')">
<%
	}
%>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>