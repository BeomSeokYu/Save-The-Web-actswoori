<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
--> 
<%@page import="jdbc.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.PostDTO, java.util.ArrayList, jdbc.PostDAO"  %>
<!DOCTYPE html>
<html>
<head>
<title>행전우리교회</title>
<style>

iframe {
	display: block;
	border: none;
	margin: auto;
	height: 80vh;
	width: 80%;
	overflow:hidden;
	frameborder:0;
	scrolling: no;
}
</style>
<%@ include file="/include/header.jsp" %> 
</head>

<body>
<%@ include file="/include/navbar.jsp" %>
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String email = request.getParameter("email");
	
//	if (UserDAO.exist(email)) {
//	   out.write(UserDAO.selectUser(email));
//	}
	int pno = Integer.parseInt(request.getParameter("pno"));

	PostDTO pdto = PostDAO.selectPost(pno);
	String filePath = pdto.getPupfolder() + "/" + pdto.getPuuid() + "_" + pdto.getPfilename(); 
	
	String pdate = pdto.getPdate();
	pdate = pdate.substring(0,11);
	
	%>
 
 
 <div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<div class="col-3 d-none d-lg-block pt-5">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>
				<div class="col-9">
				
				<div class="pt-5"></div>
				<h2>주보</h2>
				<hr>

				<div>
					<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5"><%=pdto.getPtitle() %></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2" id="nameth"></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2"><%=pdate %></th>
						</tr>
					</table>
					<div class="py-3 px-5">
						<div class="text-lg">
							<iframe src="<%=filePath %>" ></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
		<!-- if 4페이지였으면 목록 클릭했을 때 4페이지로 가게 하기 위해서 -->
		<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">목록</a>  -->

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="history.back()"
				class="btn btn-outline-success">

<%
if (admin || sid != null && sid.equals(PostDAO.selectPost(Integer.parseInt(request.getParameter("pno"))).getEmail())) { // 세션 처리
%>
			<button
				onclick="location.href='/4/post/postEdit.jsp?pno=<%=pno %>'"
				class="btn btn-outline-primary">수정</button>
			<button
				onclick="delCheck('/4/post/postRemove.jsp?pno=<%=pno %>')"
				class="btn btn-outline-danger">삭제</button>

<%
	}
%>
		</div>
	</div>
 
 <script type="text/javascript">
	$(function getUserName(a) {
		$.ajax({
			type : 'post',
			url : '/user/userInfoProc.jsp',
			data : {
				email : '<%=pdto.getEmail()%>'
			},
			dataType : "text",
			success : function(data) {
				var user = JSON.parse(data.trim());
				$('#nameth').html(user.name)
			}
		});
	})
	
	function delCheck(nextPage) {
		var flag = confirm("정말로 삭제하시겠습니까?");
		if(flag) location.href=nextPage;
	}


 </script>


<%@ include file="/include/footer.jsp" %> 

</body>
</html>