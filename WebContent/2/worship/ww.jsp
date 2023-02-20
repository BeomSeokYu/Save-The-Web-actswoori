<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<script src="/resources/js/page.js"></script>
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
				<option value="N">파일명</option>
				<option value="E">이메일</option>
			</select> <input class="form-control" type="search" placeholder="검색어"
				aria-label="" id="keyword">
			<button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
		</div>
		<ul class="pagination pagination-sm" id="ajaxPaging">
		</ul>
	</div>
<%@ include file="/include/footer.jsp" %>
<!-- lightbox2 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"
	integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	/*
	[form id 이걸로 하셈]
	
	검색 버튼 : searchBtn
	검색 입력 인풋 : keyword
	검색 선택 셀렉트 : selectType
	게시글 표시 갯수 셀렉트 : selectAmount
	*/
	
	/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
	function getTotalCountUrl() {
		return '/2/worship/totalNumProc.jsp'
	}
	/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
	function getListUrl() {
		return '/2/worship/photoListProc.jsp'
	}
	function printList(data) {
		//TODO: 리스트 출력 처리 하세요
		var str = '';
		for (var i = 0; i < data.length; i++) {
			str += "<tr><td><a href='wSelectOne.jsp?wno=" + data[i].wno + "'>" + data[i].wtitle + "</a></td>";
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
	
<%--  	
	var total = <%=WorshipDAO.getTotal()%>; /* 전체게시글 수 */
	var realEnd = Math.ceil(total * 0.1);
	
	function searchFunction(num) {
		var pageNum = num; /* 현재 조회하는 페이지번호 */
		var endPage = Math.ceil(pageNum * 0.1) * 10; /* 게시글 화면에 보여질 마지막 번호 */
		var startPage = endPage - 10 + 1; /* 게시글 화면에 보여질 첫번째 번호 */
		var prev = startPage > 1; /* 이전버튼 활성화여부 */
		var next = endPage < realEnd; /* 다음버튼 활성화여부 */
		
		if (endPage > realEnd) {
			endPage = realEnd;
		}
		
		$.ajax({
			type : 'post',
			url : 'wSelectAllCheck.jsp',
			data : {pn : pageNum},
			dataType : "text",
			success : function (data) {
				var worships = JSON.parse(data.trim());
				
				var str = "";
				for(var i = 0; i < worships.length; i++){
					str += "<tr><td><a href='wSelectOne.jsp?wno=" + worships[i].wno + "'>" + worships[i].wtitle + "</a></td>";
					str += "<td>" + worships[i].wname + "</td>";
					str += "<td>" + worships[i].email + "</td>";
					str += "<td>" + worships[i].wdate + "</td></tr>";
				}
				$("#ajaxTable").html(str);
				
				var str2 = "";
				if (prev) {
					str2 += '<li><a href="javascript:searchFunction(' + (startPage - 1) + ');">이전</a></li>';
				}
				for (var i = startPage; i <= endPage; i++) {
					if (i == pageNum) {
						str2 += '<li><a href="javascript:searchFunction(' + i + ');" class="active">' + i + '</a></li>';
					} else {
						str2 += '<li><a href="javascript:searchFunction(' + i + ');">' + i + '</a></li>';
					}
				}
				if (next) {
					str2 += '<li><a href="javascript:searchFunction(' + (endPage + 1) + ');">다음</a></li>';
				}
				
				$("#ajaxPaging").html(str2);
			}
		});
	} 
	
	window.onload = function() {
 		searchFunction(1); 
	}
 --%>	
</script>
</body>
</html>