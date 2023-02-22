<%@page import="jdbc.coopDTO"%>
<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@include file="/include/navbar.jsp" %>

 <% 
 	int cno = Integer.parseInt(request.getParameter("cno"));
 
	 coopDAO cdao = new coopDAO();
 	 coopDTO cdto = cdao.select(cno);
 	
 	 String cdate = cdto.getCdate();
 	 cdate = cdate.substring(0,11);
 	 %>
 	 
 	 
 	 
 	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<div class="col-3 d-none d-lg-block pt-5">
					<%@ include file="/include/sidebar2.jsp"%>
				</div>
				<div class="col-9">
				
				<div class="pt-5"></div>
				<h2>협력교회와 기관 소식</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5"><%=cdto.getCtitle()%></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2"><%=cdto.getEmail()%></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2"><%=cdate%></th>
						</tr>
					</table>
					<div class="py-3 px-5">
						<div class="text-lg">
							<p><%=cdto.getCcontent()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="history.back()"
				class="btn btn-outline-success">

<%
if (admin || sid != null && sid.equals(coopDAO.select(Integer.parseInt(request.getParameter("cno"))).getEmail())) { // 세션 처리
%>
			<button
				onclick="location.href='/4/coopInfo/coopDeleteCheck.jsp?cno=<%=cdto.getCno()%>'"
				class="btn btn-outline-primary ad">수정</button>
			<button
				onclick="location.href='/4/coopInfo/coopDeleteCheck.jsp?cno=<%=cdto.getCno()%>'"
				class="btn btn-outline-danger ad">삭제</button>
<%
	}
%>
		</div>
	</div>
	

	
</body>
 <%@include file="/include/footer.jsp" %>