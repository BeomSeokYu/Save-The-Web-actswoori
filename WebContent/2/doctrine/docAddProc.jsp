<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0--%>


<%@page import="jdbc.docDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");

	String dtitle = request.getParameter("dtitle");
	String dcontent = request.getParameter("dcontent");
	String email = request.getParameter("email");
	
	String tagRemove = dcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	
	if (tagRemove.equals("") ||email == null || dtitle == null) { // 보안 처리;
	%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">빈칸이있어요!</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						입력이 안된칸이 있어요,,,<br>다시입력해주세요!
					</div>
					<div class="modal-footer">
						<!-- <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button> -->
						<button onclick="history.back()"
							class="btn btn-outline-primary">다시 입력</button>
						<button onclick="location.href='/2/doctrine/doctrin.jsp'"
							class="btn btn-outline-secondary">목록으로 이동</button>	
					</div>
				</div>
			</div>
		</div>

		
		<script>
			$(function() {
				$("#exampleModal2").modal("show");
			});
		</script>
	<%}%>
	<%else{	
		response.sendRedirect("doctrin.jsp");
		return;
	}
	

	
	out.print(docDAO.insertDoc(dtitle, dcontent,email));
%>


