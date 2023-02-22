<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<div class="container">

	<div class="col-6">
		<select class="form-select w-50" id="selectAmount">
       		<option value="8" selected>8</option>
       		<option value="16">16</option>
       		<option value="24">24</option>
        </select>
       </div>

<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일자</th>
    </tr>
  </thead>
  <tbody  id="imgList">


  </tbody>
</table>

	<div class="col-4">
		<div class="d-flex text-end">
		  <select class="form-select" id="selectType">
       		<option value="T" selected>제목</option>
       		<option value="F">파일명</option>
       		<option value="E">이메일</option>
       		<option value="TF">제목/파일명</option>
       		<option value="TE">제목/이메일</option>
       		<option value="TFE">제목/파일명/이메일</option>
          </select>
	      <input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
	      <button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
	    </div>
    </div>

<nav aria-label="Page navigation example">
<ul class="pagination justify-content-center" id="pagination">

</ul>
</nav>
<a href="insertForm.jsp" class="btn btn-primary"> 등록하기 </a>

</div>

<%@ include file="/include/footer.jsp" %>

<script src="/resources/js/page.js"></script>

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
	return '/4/news/totalNumProc.jsp'
}
/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getListUrl() {
	return '/4/news/newsListProc.jsp'
}

function printList(data) {
	//TODO: 리스트 출력 처리 하세요
	var imgHTML = '';
	for (var i = 0; i < data.length; i++) {
		
		imgHTML += ''
			+ '<tr><td>' + data[i].ntitle + "</td>"
			+ '<td>' + data[i].email + "</td>"
			+ '<td>' + data[i].ndate + "</td></tr>"
	}
	$('#imgList').html(imgHTML);
}

</script>

</body>
</html>