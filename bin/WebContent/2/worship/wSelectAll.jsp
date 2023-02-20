<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
	<style>
	       .btn {
	           border: 0; 
	           border-radius: 0; /*윤곽 0*/
	           padding: 5px 10px; 
	           margin: 20px 0px;
	       }
	</style>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div class="container">
		<h1>예배설교</h1>
		<a class="btn btn-primary" href="wInsert.jsp" role="button">등록</a>
		<table class="table table-bordered">
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
		  <tfoot>
				<tr>
					<td colspan="5" align="center">
               			<ul class="pagination pagination-sm" id="ajaxPaging">
               				<c:if test="${pageVO.prev }">
                       			<li><a href="list.board?pageNum=${pageVO.startPage - 1 }">이전</a></li>
							</c:if>
                       		<c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                        		<li  class="${pageVO.pageNum eq num ? 'active' : '' }">
                        		<a href="list.board?pageNum=${num }">${num }</a></li>
                       		</c:forEach>
                       		<c:if test="${pageVO.next }">
                       			<li><a href="list.board?pageNum=${pageVO.endPage + 1 }">다음</a></li>
                       		</c:if>
               			</ul>
						<input type="button" value="글 작성" class="btn btn-default pull-right" onclick="location.href='write.board'">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
<%@ include file="/include/footer.jsp" %>
<script>
	var total = <%=WorshipDAO.getTotal()%> /* 전체게시글 수 */
	var realEnd = Math.ceil(total * 0.1);
	
	var pageNum; /* 현재 조회하는 페이지번호 */
	var endPage; /* 게시글 화면에 보여질 마지막 번호 */
	var startPage; /* 게시글 화면에 보여질 첫번째 번호 */
	var prev; /* 이전버튼 활성화여부 */
	var next; /* 다음버튼 활성화여부 */
	
	function paging(num) {
		pageNum = num; /* 현재 조회하는 페이지번호 */
		endPage = Math.ceil(pageNum * 0.1) * 10; /* 게시글 화면에 보여질 마지막 번호 */
		startPage = endPage - 10 + 1; /* 게시글 화면에 보여질 첫번째 번호 */
		prev = startPage > 1; /* 이전버튼 활성화여부 */
		next = endPage < realEnd; /* 다음버튼 활성화여부 */
		
		if (endPage > realEnd) {
			endPage = realEnd;
		}
	}
	
	function searchFunction(pageNum) {
		$.ajax({
			type : 'post',
			url : 'wSelectAllCheck.jsp',
			data : {pageNum : pageNum},
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
				
				str = "";
				if (prev) {
					str += '<li><a href="list.board?pageNum=${pageVO.startPage - 1 }">이전</a></li>'
				}
				
				$("#ajaxPaging").html(str);
			}
		});
	}
	
	window.onload = function() {
		searchFunction(pageNum);
		paging(1);
	}
</script>
</body>
</html>