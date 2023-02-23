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
		<div>
			<h3 id="wtitle"></h3>
		</div>
<<<<<<< Updated upstream
		<div>
			설교자 : <span id="wname"></span>
			<br>
			작성자 : <span id="email"></span>
			<br>
			작성일 : <span id="wdate"></span>
		</div>
		<div>
			<p id="wcontent"></p>
		</div>
		<div>
=======
	</div>

	
		<!-- if 4페이지였으면 목록 클릭했을 때 4페이지로 가게 하기 위해서 -->
		<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">목록</a>  -->

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="location.href='wSelectAll.jsp'"
				class="btn btn-outline-success">

>>>>>>> Stashed changes
<%
	if (sid != null && sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno"))))) { // 세션 처리
%>
			<a class="btn btn-primary" href="wUpdate.jsp?wno=<%=request.getParameter("wno")%>" role="button">수정</a>
			<a class="btn btn-primary" href="wDeleteCheck.jsp?wno=<%=request.getParameter("wno")%>" role="button">삭제</a>
<%
	}
%>
			<a class="btn btn-primary" href="wSelectAll.jsp" role="button">목록</a>
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
</script>
</body>
</html>