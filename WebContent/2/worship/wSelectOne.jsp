<%@page import="worship.WorshipDAO"%>
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

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<div class="col-3 d-none d-lg-block pt-5">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
				
				<div class="pt-5"></div>
				<h2>예배 설교</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5" id = "wtitle"></th>
							<th class="col-1 text-center table-light">설교자</th>
							<th class="col-2" id = "wname"></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2" id = "wdate"></th>
						</tr>
					</table>
					<div class="py-3 px-5">
						<div class="text-lg">
							<p id = "wcontent"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
		<!-- if 4페이지였으면 목록 클릭했을 때 4페이지로 가게 하기 위해서 -->
		<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">목록</a>  -->

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="location.href='wSelectAll.jsp'"
				class="btn btn-outline-success">

<%
	if (admin || (sid != null && sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno")))))) { // 세션 처리
%>
			<button
				onclick="location.href='/2/worship/wUpdate.jsp?wno=<%=request.getParameter("wno")%>'"
				class="btn btn-outline-primary">수정</button>
			<button
				onclick="delCheck('/2/worship/wDeleteCheck.jsp?wno=<%=request.getParameter("wno")%>')"
				class="btn btn-outline-danger">삭제</button>

<%
	}
%>
		</div>
	</div>
	
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	var wno = <%=request.getParameter("wno")%>

	function viewFunction(no) {
		$.ajax({
			type : 'post',
			url : 'wSelectOneCheck.jsp',
			data : {wno : no},
			dataType : "text",
			success : function (data) {
				var worship = JSON.parse(data.trim());
				
				var email = worship.email;
				var wname = worship.wname;
				var wtitle = worship.wtitle;
				var wcontent = worship.wcontent;
				var wdate = worship.wdate;
				
				//날짜만출력 (형식변경)
				wdate = wdate.substring(0,11);
				
				
				$("#email").html(email);
				$("#wname").html(wname);
				$("#wtitle").html(wtitle);
				$("#wcontent").html(wcontent);
				$("#wdate").html(wdate);
			}
		});
	}
	
	window.onload = function() {
		viewFunction(wno);
	}
	
	function delCheck(nextPage) {
		var flag = confirm("정말로 삭제하시겠습니까?");
		if(flag) location.href=nextPage;
	}


</script>
</body>
</html>