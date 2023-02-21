<%@page import="vow.VowDAO"%>
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
		<h1>말씀서원</h1>
		<select class="form-select w-50" id="selectAmount">
			<option value="8" selected>8</option>
			<option value="16">16</option>
			<option value="24">24</option>
		</select>
<%
	if (sid != null) { // 세션 처리
%>
		<a class="btn btn-primary" href="vInsert.jsp" role="button">등록</a>
<%
	}
%>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" class="col-6">제목</th>
		      <th scope="col" class="col-3">작성자</th>
		      <th scope="col" class="col-3">작성일</th>
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
				<option value="C">내용</option>
				<option value="E">이메일</option>
			</select>
			<input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
			<button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
		</div>
	</div>
<%@ include file="/include/footer.jsp" %>

<!-- lightbox2 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js" integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/resources/js/page.js"></script>

<script>
	function getTotalCountUrl() {
		return '/3/vow/totalNumProc.jsp'
	}
	
	function getListUrl() {
		return '/3/vow/vSelectAllProc.jsp'
	}
	
	function printList(data) {
		var str = '';
		for (var i = 0; i < data.length; i++) {
			str += "<tr><td><a href='vSelectOne.jsp?vno=" + data[i].vno + "'>" + data[i].vtitle + "</a></td>";
			str += "<td>" + data[i].email + "</td>";
			str += "<td>" + data[i].vdate + "</td></tr>";
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