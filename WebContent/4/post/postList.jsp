<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/17) 
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
<%@ include file="/include/header.jsp" %> 
<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
.iframe {
	display: block;
	border: none;
	margin: auto;
	height: 150vh;
	overflow:hidden;
	frameborder:0;
	scrolling: no;
}
</style>
<link href="
https://cdn.jsdelivr.net/npm/pdfjs-dist@3.3.122/web/pdf_viewer.min.css
" rel="stylesheet">
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<!-- 게시판 영역 -->
<div class="container">
	<div class="container mb-3">
		<div class="row justify-content-center">
			<h2 class="">주보</h2>
			<div class="col-3 d-none d-lg-block">
				<%@ include file="/include/sidebar4.jsp" %>
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col-3 text-muted">
						<select class="form-select form-select-sm w-50 d-inline" id="selectAmount">
				       		<option value="4" selected>4</option>
				       		<option value="8">8</option>
				       		<option value="12">12</option>
				        </select>
				        <span class="d-inline">개씩 보기</span>
			        </div>
					<div class="col-9 text-end">
					<% if (sid != null) { // 세션 처리 %>
						<a class="btn btn-sm btn-outline-secondary" href="/4/post/postAdd.jsp">주보 등록</a>
					<%} %>
					</div>
		        </div>
				
				<hr class="my-4">
				
				<div class="container postListDiv row"></div>
				
				<hr class="my-4">
				<div class="row">
					<div class="col-8">
						<ul class="pagination pagination-sm justify-content-center" id="pagination">
						
						</ul>
					</div>
					<div class="col-4">
						<div class="d-flex text-end">
						  <select class="form-select form-select-sm" id="selectType">
				       		<option value="T" selected>제목</option>
				       		<option value="F">파일명</option>
				       		<option value="E">이메일</option>
				       		<option value="TF">제목/파일명</option>
				       		<option value="TE">제목/이메일</option>
				       		<option value="TFE">제목/파일명/이메일</option>
				          </select>
					      <input class="form-control form-control-sm" type="search" placeholder="검색어"id="keyword">
					      <button class="btn btn-sm btn-outline-secondary" type="button" id="searchBtn"><i class="bi bi-search"></i></button>
				        </div>
				    </div>
		        </div>
			</div>
		</div>
	</div>
</div>
<!-- lightbox2 js -->
<script src="/resources/js/page.js"></script>



<%@ include file="/include/footer.jsp" %> 
<script>

function showPDF(path, pno) {
	//If absolute URL from the remote server is provided, configure the CORS
	//header on that server.
	var url = path;
	
	//Loaded via <script> tag, create shortcut to access PDF.js exports.
	var pdfjsLib = window['pdfjs-dist/build/pdf'];
	
	//The workerSrc property shall be specified.
	pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';
	
	//Asynchronous download of PDF
	var loadingTask = pdfjsLib.getDocument(url);
	loadingTask.promise.then(function(pdf) {
	
	// Fetch the first page
	var pageNumber = 1;
	pdf.getPage(pageNumber).then(function(page) {
	 
	 var scale = 1.5;
	 var viewport = page.getViewport({scale: scale});
	
	 // Prepare canvas using PDF page dimensions
	 var canvas = document.getElementById('the-canvas'+pno);
	 var context = canvas.getContext('2d');
	 canvas.height = viewport.height;
	 canvas.width = viewport.width;
	
	 // Render PDF page into canvas context
	 var renderContext = {
	   canvasContext: context,
	   viewport: viewport
	 };
	 var renderTask = page.render(renderContext);
	 renderTask.promise.then(function () {
	 });
	});
	}, function (reason) {
	// PDF loading error
	console.error(reason);
	});
}
</script>


<script>
/*
[form id 이걸로 하셈]

검색 버튼 : searchBtn
검색 입력 인풋 : keyword
검색 선택 셀렉트 : selectType
게시글 표시 갯수 셀렉트 : selectAmount
리스트 다시 띄우기 : pageObj.pageCal(cri);
*/

/* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getTotalCountUrl() {
	return '/4/post/totalNumProc.jsp'
}
/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getListUrl() {
	return '/4/post/photoListProc.jsp'
}
function printList(data) {
	//TODO: 리스트 출력 처리 하세요
	var str = '';
	for (var i = 0; i < data.length; i++) {
		var pdf = data[i].pupfolder + '/' +data[i].puuid + '_' + data[i].pfilename;
		str += '<div class="col-6">'
			+   '<a class="btn" href="postView.jsp?pno=' + data[i].pno + '"><div>' + data[i].ptitle
			+ 	'</div>'
			+   '<iframe class="rounded w-100 h-50" src="'+pdf+'#toolbar=0&navpanes=0&scrolling=no"></iframe>'
			+ 	'</a>'
			+ '</div>'
	}
	$('.postListDiv').html(str);
}

</script>
</body>
</html>