<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%
	if (sid != null) { // 세션 처리
%>
		<a class="btn btn-primary" href="wInsert.jsp" role="button">등록</a>
<%
	}
%>
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
		<ul class="pagination pagination-sm" id="ajaxPaging">
		</ul>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
	var total = <%=WorshipDAO.getTotal()%>; /* 전체게시글 수 */
	var realEnd = Math.ceil(total * 0.1);
	
	function searchFunction(num) {
		var pageNum = num; /* 현재 조회하는 페이지번호 */
		var endPage = Math.ceil(pageNum * 0.1) * 10; /* 게시글 화면에 보여질 마지막 번호 */
		var startPage = endPage - 10 + 1; /* 게시글 화면에 보여질 첫번째 번호 */
		var prev = startPage > 1; /* 이전버튼 활성화여부 */
		var next = endPage < realEnd; /* 다음버튼 활성화여부 */
		
		if (endPage > realEnd) {
			endPage = realEnd;
		}
		
		$.ajax({
			type : 'post',
			url : 'wSelectAllCheck.jsp',
			data : {pn : pageNum},
			dataType : "text",
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
				
				var str2 = "";
				if (prev) {
					str2 += '<li><a href="javascript:searchFunction(' + (startPage - 1) + ');">이전</a></li>';
				}
				for (var i = startPage; i <= endPage; i++) {
					if (i == pageNum) {
						str2 += '<li><a href="javascript:searchFunction(' + i + ');" class="active">' + i + '</a></li>';
					} else {
						str2 += '<li><a href="javascript:searchFunction(' + i + ');">' + i + '</a></li>';
					}
				}
				if (next) {
					str2 += '<li><a href="javascript:searchFunction(' + (endPage + 1) + ');">다음</a></li>';
				}
				
				$("#ajaxPaging").html(str2);
			}
		});
	}
	
	window.onload = function() {
		searchFunction(1);
	}
</script>
</body>
</html>