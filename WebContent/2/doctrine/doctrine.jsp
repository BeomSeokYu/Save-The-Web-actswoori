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
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<div class="container shadow mx-auto p-5 w-75">
 <div class="col-9">
				<div class="row">
					<div class="col-6">
						<select class="form-select w-50" id="selectAmount">
				       		<option value="8" selected>8</option>
				       		<option value="16">16</option>
				       		<option value="24">24</option>
				        </select>
			        </div>
		        </div>
			        <div class="col-4">
						<div class="d-flex text-end">
						  <select class="form-select" id="selectType">
				       		<option value="T" selected>제목</option>
				       		<option value="F">내용</option>
				       		<option value="TF">제목/내용</option>
				          </select>
					      <input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
					      <button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
					    </div>
					    <ul class="pagination justify-content-center" id="pagination"></ul>
					    
				    </div>
		        </div>
		        
		        
 <script>
 	var sid = "<%=sid%>"
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
 
	function checkSid(){
		if (sid==null) {
			popModal("실패", "등록을 하기 위해서는 로그인이 필요합니다")
		} else {
			location.href="docAdd.jsp"
		}
	}
	
	function getUserName(a){
		$.ajax({
 			type:'post',
 			url:'/user/userInfoProc.jsp',
 			data : {email:a},
			dataType:"text",
			async:false,
 			success:function(data){
 				var user = JSON.parse(data.trim());
 				name = user.name
 			}
 		});
 				return name
	}
	
 	window.onload = function() {
 		searchFunction();
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
 		for(var i = 0; i < data.length; i++){
				var asd = getUserName(data[i].email)
				str += "<tr><td>" + data[i].dno + "</td>";
				str += "<td><a href='docView.jsp?dno="+ data[i].dno +"'>" + data[i].dtitle + "</a></td>";
				str += "<td>"+asd+"</td>";
				str += "<td>" + data[i].ddate + "</td></tr>";
			} $("#ajaxTable").html(str);
 	}
 	
 	
 	
 </script>
 
<div style="height: 100px;">
		</div>
<h1>복음과 교리</h1>
<hr>
<div class = "input-group justify-content-center">

</div>

<table align=center>
<thead>
	<th>#</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</thead>
<tbody id="ajaxTable">

</tbody>
</table>

<%-- <%if(sid.equals(admin)){ %> --%>
<input type="button" value="등록하기" onclick="checkSid()">
<%-- <%} %> --%>
</div>
    <%@ include file="/include/footer.jsp" %>
      <script src="/resources/js/page.js"></script>
    
</body>
</html>