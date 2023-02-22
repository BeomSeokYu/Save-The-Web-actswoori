<%--작성자 정보 : 최현식
작성일 정보 : 2023-02-20
버전 정보 : 1.2--%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2 class="sticky-md-top">복음과 교리</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp" %>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-6">
							<select class="form-select w-50" id="selectAmount">
								<option value="8" selected>8</option>
								<option value="16">16</option>
								<option value="24">24</option>
							</select>
						</div>
						<div class="col-6 text-end">
							<button class="btn btn-outline-secondary" type="button"
								onclick="checkSid()" class="ad">등록</button>
						</div>
					</div>
					<hr class="my-4">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col" class="col-2">#</th>
					      <th scope="col" class="col-6">제목</th>
					      <th scope="col" class="col-2">작성자</th>
					      <th scope="col" class="col-2">작성일</th>
					    </tr>
					  </thead>
					  <tbody id="ajaxTable">
					  </tbody>
					</table>
					<ul class="pagination justify-content-center" id="pagination">
					</ul>
					<div class="d-flex text-end">
						<select class="form-select" id="selectType">
							<option value="T" selected>제목</option>
							<option value="F">내용</option>
							<option value="TF">제목/내용</option>
						</select>
						<input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
						<button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
 	var sid = "<%=sid%>"
		

		function checkSid() {
			if (sid == null) {
				popModal("실패", "등록을 하기 위해서는 로그인이 필요합니다")
			} else {
				location.href = "docAdd.jsp"
			}
		}

		function getUserName(a) {
			$.ajax({
				type : 'post',
				url : '/user/userInfoProc.jsp',
				data : {
					email : a
				},
				dataType : "text",
				async : false,
				success : function(data) {
					var user = JSON.parse(data.trim());
					name = user.name
				}
			});
			return name
		}

		window.onload = function() {
			searchFunction();
			if (sid != null) {
				$('.ad').show()
			} else {
				$('.ad').hide()
			}
		}

		/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getTotalCountUrl() {
			return '/2/doctrine/totalNumProc.jsp'
		}
		/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getListUrl() {
			return '/2/doctrine/docListProc.jsp'
		}
		function printList(data) {
			//TODO: 리스트 출력 처리 하세요
			var str = '';
			for (var i = 0; i < data.length; i++) {
				var asd = getUserName(data[i].email)
				str += "<tr><td>" + data[i].dno + "</td>";
				str += "<td><a href='docView.jsp?dno=" + data[i].dno + "'>"
						+ data[i].dtitle + "</a></td>";
				str += "<td>" + asd + "</td>";
				str += "<td>" + data[i].ddate + "</td></tr>";
			}
			$("#ajaxTable").html(str);
		}
		/*   	function searchFunction() {
		
		 $.ajax({
		 type:'post',
		 url:'docList.jsp',

		 success:function(data){
		
		 var feeds = JSON.parse(data.trim());
		
		 var str = "";
		 for(var i = 0; i < feeds.length; i++){
		 var asd = getUserName(feeds[i].email)
		 str += "<tr><td>" + feeds[i].dno + "</td>";
		 str += "<td><a href='docView.jsp?dno="+ feeds[i].dno +"'>" + feeds[i].dtitle + "</a></td>";
		 str += "<td>"+asd+"</td>"
		 str += "<td>" + feeds[i].ddate + "</td></tr>";
		 } $("#ajaxTable").html(str);
		 }
		 });
		 } */
	</script>

	<%@ include file="/include/footer.jsp"%>
	<script src="/resources/js/page.js"></script>

</body>
</html>