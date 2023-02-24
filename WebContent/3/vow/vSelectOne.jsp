<!-- 복음과교리 추가 - 현식 -->

<%@page import="vow.VowDAO"%>
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
				<h2>말씀 서원</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5" id = "vtitle"></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2" id = "vname"></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2" id = "vdate"></th>
						</tr>
					</table>
					<div class="py-3 px-5">
						<div class="text-lg">
							<p id = "vcontent"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="location.href='vSelectAll.jsp'"
				class="btn btn-outline-success">

<%
	if (admin || sid != null && sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) { // 세션 처리
%>
			<button
				onclick="location.href='/3/vow/vUpdate.jsp?vno=<%=request.getParameter("vno")%>'"
				class="btn btn-outline-primary ad">수정</button>
				
			<button
				onclick="delCheck('/3/vow/vDeleteCheck.jsp?vno=<%=request.getParameter("vno")%>')"
				class="btn btn-outline-danger ad">삭제</button>
<%
	}
%>
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
				
				
				var vtitle = vow.vtitle;
				var vcontent = vow.vcontent;
				var vdate = vow.vdate;
				vdate = vdate.substring(0,11);
				
				$("#vtitle").html(vtitle);
				$("#vcontent").html(vcontent);
				$("#vname").html(name);
				$("#vdate").html(vdate);
			}
		});
	}
	
	window.onload = function() {
		viewFunction(vno);
	}
	
	function delCheck(nextPage) {
		var flag = confirm("정말로 삭제하시겠습니까?");
		if(flag) location.href=nextPage;
	}
</script>

</body>
</html>