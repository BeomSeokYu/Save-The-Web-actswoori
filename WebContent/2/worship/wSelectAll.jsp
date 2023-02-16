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
		<h1>예배설교</h1>
		<a class="btn btn-primary" href="wInsert.jsp" role="button">등록</a>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" class="col-6">제목</th>
		      <th scope="col" class="col-2">설교자</th>
		      <th scope="col" class="col-2">작성자</th>
		      <th scope="col" class="col-2">작성일</th>
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
			url : 'wSelectAllCheck.jsp',
			success : function (data) {
				var worships = JSON.parse(data.trim());
				
				var str = "";
				for(var i = 0; i < worships.length; i++){
					str += "<tr><td><a href='wSelectOne.jsp?wno=" + worships[i].wno + "'>" + worships[i].wtitle + "</a></td>";
					str += "<td>" + worships[i].wname + "</td>";
					str += "<td>" + worships[i].email + "</td>";
					str += "<td>" + worships[i].wdate + "</td></tr>";
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