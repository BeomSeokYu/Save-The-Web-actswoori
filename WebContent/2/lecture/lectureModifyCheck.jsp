<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/include/header.jsp"%>
    
<%
	request.setCharacterEncoding("utf-8");

if (sid == null) {
	response.sendRedirect("lectureMain.jsp");
	return;
}
	
		String lno = request.getParameter("lno");
		int lnoo = Integer.parseInt(lno);
 	
		
		String ltitle = request.getParameter("ltitle");
		String lname = request.getParameter("lname");
		String lcontent = request.getParameter("lcontent");
		
		
		String tagRemove = lcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		
		if (tagRemove.equals("") ||email == null || ltitle == null) { // 보안 처리;
		%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal2" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">내용이 빈칸이에요!</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							내용이 입력이 안됬어요,,,<br>다시입력해주세요!
						</div>
						<div class="modal-footer">
							<!-- <button onclick="location.href='/user/login.jsp'" class="btn btn-primary">로그인 이동</button> -->
							<button onclick="history.back()"
								class="btn btn-outline-primary">다시 입력</button>
							<button onclick="location.href='/2/lecture/lectureMain.jsp'"
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
		<%}else{
			// response.sendRedirect("lectureMain.jsp");
			return;
		}
		
		if(LectureDAO.update(lnoo, ltitle, lname, lcontent)) {%>
		<script>
		window.onload = function(){ popModal2("주요 특강 수정", "수정에 성공하셨습니다", "/2/lecture/lectureDetail.jsp?lno=<%=lno%>")}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("주요 특강 수정", "수정에 실패하셨습니다", "/2/lecture/lectureDetail.jsp?lno=<%=lno%>")}
		</script>
	<%}%>
	
	<%@ include file="/include/footer.jsp"%>   
