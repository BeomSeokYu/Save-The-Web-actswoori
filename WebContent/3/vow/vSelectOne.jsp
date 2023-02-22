<!-- 복음과교리 추가 - 현식 -->

<%@page import="vow.VowDAO"%>
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
			<h3 id="vtitle"></h3>
		</div>
		<div>
			작성자 : <span id="email"></span>
			<br>
			작성일 : <span id="vdate"></span>
		</div>
		<div>
			<p id="vcontent"></p>
		</div>
		<div>
<%
	if (sid != null && sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) { // 세션 처리
%>
			<a class="btn btn-primary" href="vUpdate.jsp?vno=<%=request.getParameter("vno")%>" role="button">수정</a>
			<a class="btn btn-primary" href="vDeleteCheck.jsp?vno=<%=request.getParameter("vno")%>" role="button">삭제</a>
<%
	}
%>
			<a class="btn btn-primary" href="vSelectAll.jsp" role="button">목록</a>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	var vno = <%=request.getParameter("vno")%>

	function viewFunction(no) {
		$.ajax({
			type : 'post',
			url : 'vSelectOneCheck.jsp',
			data : {vno : no},
			dataType : "text",
			success : function (data) {
				var vow = JSON.parse(data.trim());
				
				var email = vow.email;
				var vtitle = vow.vtitle;
				var vcontent = vow.vcontent;
				var vdate = vow.vdate;
				
				$("#email").html(email);
				$("#vtitle").html(vtitle);
				$("#vcontent").html(vcontent);
				$("#vdate").html(vdate);
			}
		});
	}
	
	window.onload = function() {
		viewFunction(vno);
	}
</script>
</body>
</html>