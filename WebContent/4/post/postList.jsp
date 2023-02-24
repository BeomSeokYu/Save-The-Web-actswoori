	<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/17) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
--> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<!-- lightbox2 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css" integrity="sha512-Woz+DqWYJ51bpVk5Fv0yES/edIMXjj3Ynda+KWTIkGoynAMHrqTcDUQltbipuiaD5ymEo9520lyoVOo9jCQOCA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.the-canvas {
  border: 1px solid black;
  direction: ltr;
  width:30vw;
}
.postDiv {
   width:30vw;
   
}
.photo-gallery {
  color:#313437;
  background-color:#fff;
}

.photo-gallery h2 {
  font-weight:bold;
  margin-bottom:40px;
  padding-top:40px;
  color:inherit;
}

@media (max-width:767px) {
  .photo-gallery h2 {
    margin-bottom:25px;
    padding-top:25px;
    font-size:24px;
  }
}

.photo-gallery .photos {
  padding-bottom:20px;
}

.photo-gallery .item {
  padding-bottom:30px;
}
</style>

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
</style>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>


<!-- 게시판 영역 -->
<div class="container">
   <div class="photo-gallery container mb-3">
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
					<% if (sid != null) { %>
                  <a href="/4/post/postAdd.jsp" class="btn btn-outline-secondary" onclick="regPhoto()">주보 등록</a>
               <% } %>
					</div>
		      </div>
            <hr class="my-4">
            
            <div class="row" id="imgList"></div>
            <div class="row text-center" id="none"></div>
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
			       		<option value="TF">제목/파일명</option>
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
   return '/4/post/totalNumProc.jsp'
}
/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getListUrl() {
   return '/4/post/postListProc.jsp'
}
function printList(data) {
   //TODO: 리스트 출력 처리 하세요
   if (data.length < 1) {
		var noneStr = '';
		noneStr ='<div>등록된 게시물이 없습니다.<div>'
		$("#none").html(noneStr);
	}
   var imgHTML = '';
   $('#imgList').empty();
   for (var i = 0; i < data.length; i++) {
      var img = data[i].pupfolder + '/' +data[i].puuid + '_' + data[i].pfilename;
      var pno = data[i].pno;
      var ptitle = data[i].ptitle;
      
      imgHTML = ''
         + '<div class="postDiv col-sm-6 col-md-4 col-lg-3 item w-50">'
         +    '<a class="col-lg-4 col-md-12 mb-4 mb-lg-0" '
         +   'href="postView.jsp?pno=' + pno + '">'
         +   '   <div>' + ptitle +    '</div>'
         +    '<canvas id="the-canvas' + pno
         +    '" style="border:1px solid black" class="the-canvas img-fluid shadow bg-body rounded"></canvas>'
         +    '</a>'
         + '</div>'
   $('#imgList').append(imgHTML);
   showPDF(img, pno);
   }
}


function PreviewImage() {
    pdffile=document.getElementById("post").files[0];
    pdffile_url=URL.createObjectURL(pdffile);
    $('#viewer').attr('src',pdffile_url);
}
function showPDF(url, pno) {
   //If absolute URL from the remote server is provided, configure the CORS
   //header on that server.
   // var url = path;
   
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

function regPhoto(){
   $('#uploadModal').modal('show');
}

$('#doneBtn').on('click', function(){
   if ($('#ptitle').val() != '' && $('#post').val() != '') {
      $('#imgForm').submit();
   } else {
      popModal('주보 등록 실패', '입력 값이 없는 항목이 있습니다.')
   }
});
</script>
</body>
</html>