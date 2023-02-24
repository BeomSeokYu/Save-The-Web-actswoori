<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
	<%
int nno = Integer.parseInt(request.getParameter("nno"));
NewsDTO ndto = NewsDAO.selectNews(nno);
String ndate = ndto.getNdate();
ndate = ndate.substring(0,11);

%>

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<div class="col-3 d-none d-lg-block pt-5">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>
				<div class="col-9">

					<div class="pt-5"></div>
					<h2>교회 소식</h2>
					<hr>

					<div>
						<!-- 		<table class="table table-bordered">
						<tr>
							<th class="col-1 text-center table-light">제목</th>
							<th class="col-5" id="ntitle"></th>
							<th class="col-1 text-center table-light">작성자</th>
							<th class="col-2" id="nname"></th>
							<th class="col-1 text-center table-light">날짜</th>
							<th class="col-2" id="ndate"></th>
						</tr>
					</table> -->

						<table class="table table-bordered">
							<tr>
								<th class="col-1 text-center table-light">제목</th>
								<th class="col-5"><%= ndto.getNtitle()  %></th>
								<th class="col-1 text-center table-light">작성자</th>
								<th class="col-2" id="nameth"></th>
								<th class="col-1 text-center table-light">날짜</th>
								<th class="col-2"><%= ndate %></th>
							</tr>
						</table>

						<div class="py-3 px-5">
							<div class="text-lg">
								<p><%= ndto.getNcontent()  %></p>
								<!-- <p id="ncontent"></p> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
			<input type="button" value="목록" onclick="location.href='newsAll.jsp'"
				class="btn btn-outline-success">

			<%
	if (admin || sid != null && sid.equals(NewsDAO.selectNews(Integer.parseInt(request.getParameter("nno"))).getEmail())) { // 세션 처리
%>
			<button
				onclick="location.href='/4/news/modForm.jsp?nno=<%=ndto.getNno()%>'"
				class="btn btn-outline-primary ad">수정</button>
			<button onclick="handleDeleteBtn('<%=ndto.getNno()%>')"
				class="btn btn-outline-danger ad">삭제</button>
			<%
	}
%>
		</div>
	</div>


	<%@ include file="/include/footer.jsp"%>

<%-- 
	<script type="text/javascript">
		var nno = <%=request.getParameter("nno")%>
		function viewFunction(no) {
			$.ajax({
				type : 'post',
				url : 'newsDetailCheck.jsp',
				data : {
					nno : no
				},
				dataType : "text",
				success : function(data) {
					var news = JSON.parse(data.trim());

					var ntitle = news.ntitle;
					var ncontent = news.ncontent;
					var ndate = news.ndate;
					ndate = ndate.substring(0, 11);

					console.log(news);

					$("#ntitle").html(ntitle);
					$("#ncontent").html(ncontent);
					$("#nname").html(name);
					$("#ndate").html(ndate);
				}
			});
		}

		window.onload = function() {
			viewFunction(nno);
		}
	</script> --%>


<script>
	$(function getUserName(a) {
		$.ajax({
			type : 'post',
			url : '/user/userInfoProc.jsp',
			data : {
				email : '<%=ndto.getEmail()%>'
			},
			dataType : "text",
			success : function(data) {
				var user = JSON.parse(data.trim());
				$('#nameth').html(user.name)
			}
		});
	})
		function handleDeleteBtn(nno) {
		if (confirm('정말로 삭제 하시겠습니까?')){
			fetch('/4/news/deleteProc.jsp', {	
				method: "post",
				body: new URLSearchParams({
						nno: nno,
					})
		        })
				.then(resp => resp.text())
				.then(data => {
					data.trim()
					console.log(data);
					if('success') {
						popModal2('교회 소식 삭제', '삭제를 성공하셨습니다', '/4/news/newsAll.jsp');
					} else {
						popModal('교회 소식 삭제', '삭제를 실패하셨습니다');
					}
				})
		}
		}

		$(function() {
			const urlParams = new URL(location.href).searchParams;
			const msg = urlParams.get('msg');

			if (msg == "deleteSuccess") {
				popModal("수정 성공", "수정에 성공하였습니다.")
			} else if (msg == "fail") {
				popModal("오류 발생", "오류가 발생하였습니다. 다시 시도해주세요.")
			}
		});
	</script>

</body>
</html>