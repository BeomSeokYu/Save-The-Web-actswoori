<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h1>말씀서원</h1>
<%
	if (sid != null) { // 세션 처리
%>
		<a class="btn btn-primary" href="vInsert.jsp" role="button">등록</a>
<%
	}
%>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" class="col-6">제목</th>
		      <th scope="col" class="col-3">작성자</th>
		      <th scope="col" class="col-3">작성일</th>
		    </tr>
		  </thead>
		  <tbody id="ajaxTable">
		  </tbody>
		</table>
	</div>
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	function searchFunction() {
		$.ajax({
			type : 'post',
			url : 'vSelectAllCheck.jsp',
			success : function (data) {
				var vows = JSON.parse(data.trim());
				
				var str = "";
				for(var i = 0; i < vows.length; i++){
					str += "<tr><td><a href='vSelectOne.jsp?vno=" + vows[i].vno + "'>" + vows[i].vtitle + "</a></td>";
					str += "<td>" + vows[i].email + "</td>";
					str += "<td>" + vows[i].vdate + "</td></tr>";
				}
				$("#ajaxTable").html(str);
			}
		});
	}
	
	window.onload = function() {
		searchFunction();
	}
</script>
</body>
</html>