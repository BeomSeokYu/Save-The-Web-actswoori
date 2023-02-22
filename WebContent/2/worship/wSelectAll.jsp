<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<!-- lightbox2 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css" integrity="sha512-Woz+DqWYJ51bpVk5Fv0yES/edIMXjj3Ynda+KWTIkGoynAMHrqTcDUQltbipuiaD5ymEo9520lyoVOo9jCQOCA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="/include/navbar.jsp" %>


	<div class="container">

		<h1>예배설교</h1>
		<select class="form-select w-50" id="selectAmount">
			<option value="8" selected>8</option>
			<option value="16">16</option>
			<option value="24">24</option>
		</select>
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
		<ul class="pagination justify-content-center" id="pagination">
		</ul>
		<div class="d-flex text-end">
			<select class="form-select" id="selectType">
				<option value="T" selected>제목</option>
				<option value="N">설교자명</option>
				<option value="C">내용</option>
				<option value="E">이메일</option>
			</select>
			<input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
			<button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>

		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>예배 설교</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>

				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted">
							<select class="form-select form-select-sm w-50 d-inline"
								id="selectAmount">
								<option value="8" selected>8</option>
								<option value="16">16</option>
								<option value="24">24</option>
							</select> <span class="d-inline">개씩 보기</span>
						</div>
						<div class="col-9 text-end">
					<% if (sid != null) { // 세션 처리 %>
							<a href="wInsert.jsp" class="btn btn-sm btn-outline-success">게시물
								등록 </a>
						<%} %>
						</div>
					</div>
					<hr class="my-4">

					<table class="table table-hover shadow bg-body rounded">
						<thead>
							<tr style="background-color: #548687; color: white;">
						      <th scope="col" class="col-6">제목</th>
						      <th scope="col" class="col-2">설교자</th>
						      <th scope="col" class="col-2">작성자</th>
						      <th scope="col" class="col-2">작성일</th>
							</tr>
						</thead>
						<tbody id="ajaxTable">
		  				</tbody>
					</table>
					<hr class="my-4">
					<div class="row">
						<div class="col-8">
							<ul class="pagination justify-content-center" id="pagination">

							</ul>
						</div>
						<div class="col-4">
							<div class="d-flex text-end">
								<select class="form-select" id="selectType">
								<option value="T" selected>제목</option>
								<option value="N">설교자명</option>
								<option value="C">내용</option>
								<option value="E">이메일</option>
								</select> <input class="form-control form-control-sm" type="search"
									placeholder="검색어" id="keyword">
								<button class="btn btn-sm btn-outline-success" type="button"
									id="searchBtn">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/include/footer.jsp" %>

<!-- lightbox2 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js" integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/resources/js/page.js"></script>

<script>
	function getTotalCountUrl() {
		return '/2/worship/totalNumProc.jsp'
	}
	
	function getListUrl() {
		return '/2/worship/wSelectAllProc.jsp'
	}
	
	function printList(data) {
		var str = '';
		for (var i = 0; i < data.length; i++) {
			str += "<tr onclick=\"location.href='wSelectOne.jsp?wno=" + data[i].wno + "'\">"
			str += "<td>" + data[i].wtitle + "</td>";
			str += "<td>" + data[i].wname + "</td>";
			str += "<td>" + data[i].email + "</td>";
			str += "<td>" + data[i].wdate + "</td></tr>";
		}
		$('#ajaxTable').html(str);
	}
	
	lightbox.option({
		resizeDuration : 200,
		wrapAround : false,
		disableScrolling : true,
		fitImagesInViewport : true
	});
</script>
</body>
</html>