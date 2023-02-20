<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div class="container">
		<div>
			<h3 id="wtitle"></h3>
		</div>
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
			<a class="btn btn-primary" href="wUpdate.jsp?wno=<%=request.getParameter("wno")%>" role="button">수정</a>
			<a class="btn btn-primary" href="wDeleteCheck.jsp?wno=<%=request.getParameter("wno")%>" role="button">삭제</a>
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