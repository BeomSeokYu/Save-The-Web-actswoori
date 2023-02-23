<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
 <%@ include file="/include/header.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String ltitle = request.getParameter("ltitle");
	String lname = request.getParameter("lname");
	String lcontent = request.getParameter("lcontent");
	String email = (String)session.getAttribute("sid");
	
	String tagRemove = lcontent.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	LectureDAO.insert(ltitle,lname,lcontent);
	
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
						내용이 입력이 안됐어요,,,<br>다시입력해주세요!
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
	<%
		//response.sendRedirect("lectureMain.jsp");
		return;
	}%>

	<%if(LectureDAO.insert(ltitle, lname, lcontent, email)) {%>
		<script>
		window.onload = function(){ popModal2("주요 특강 등록", "등록에 성공하셨습니다", "/2/lecture/lectureMain.jsp")}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("주요 특강 등록", "등록에 실패하셨습니다", "/2/lecture/lectureMain.jsp")}
		</script>
	<%}%>
	
	<%@ include file="/include/footer.jsp"%>   
	
