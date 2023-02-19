<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

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


<!-- 게시판 영역 -->
<div class="container">
	<div class="photo-gallery container mb-3">
		<div class="row justify-content-center">
			<h2 class="sticky-md-top">갤러리</h2>
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
						<button class="btn btn-outline-secondary" type="button" onclick="regPhoto()">사진 등록</button>
					</div>
		        </div>
				
				<hr class="my-4">
				
				<div class="row photos" id="imgList"></div>
				
				<hr class="my-4">
				<div class="row">
					<div class="col-8">
						<ul class="pagination justify-content-center" id="pagination"></ul>
					</div>
					<div class="col-4">
						<div class="d-flex text-end">
						  <select class="form-select" id="type">
				       		<option value="T" selected>제목</option>
				       		<option value="F">파일명</option>
				       		<option value="E">이메일</option>
				       		<option value="TF">제목/파일명</option>
				       		<option value="TE">제목/이메일</option>
				       		<option value="TFE">제목/파일명/이메일</option>
				          </select>
					      <input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
					      <button class="btn btn-outline-success" type="button">검색</button>
					    </div>
				    </div>
		        </div>
			</div>
		</div>
	</div>
</div>






<%@ include file="/include/footer.jsp" %>
<!-- 등록 모달 -->
<div class="modal fade" id="uploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel">사진 등록</h1>
      </div>
      <div class="modal-body" id="msgModalBody">
		<form action="/4/gallery/photoUpload.jsp" method="post" enctype="multipart/form-data" id="imgForm">
			<label class="form-label" for="title">제목</label>
			<input class="form-control mb-3" type="text" name="title" id="title">
			<label class="form-label" for="image">사진 선택</label>
			<input class="form-control" type="file" name="image" id="image" multiple>
		</form>
      </div>
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		<button type="button" class="btn btn-warning" data-bs-dismiss="modal" id="doneBtn">등록</button>
      </div>
    </div>
  </div>
</div>
<!-- lightbox2 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js" integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
var cri = {
		amount : 8,
		pageNum : 1,
		type : null,
		keyword : null
}

var page = {
		NUM_PER_PAGE : 5.0,					// 한 페이지에 표시 할 페이지 번호 수
		start : 1,							// 시작 페이지 번호
		end : this.NUM_PER_PAGE,			// 끝 페이지 번호
		isPrevious : false,					// 이전
		isNext : false,						// 다음
		
		pageCal : function() {
			var total = 0;
			fetch('/4/gallery/totalNumProc.jsp', {	
				method: "post",
				body: new URLSearchParams({
						amount: cri.amount,
						pageNum: cri.pageNum,
						offset: cri.amount * (cri.pageNum - 1),
						keyword: cri.keyword,
						type: cri.type
					})
		        })
				.then(resp => resp.text())
				.then(data => {
					data.trim()
					console.log(data);
					total = data*1
					setPage(total);
				})
		}
}
function setPage(total) {
	var amount = cri.amount;
	var pageNum = cri.pageNum;
	
	var pages = Math.ceil(total / amount);

	page.end = (Math.ceil(pageNum / page.NUM_PER_PAGE) * page.NUM_PER_PAGE);
	page.start = (page.end - (page.NUM_PER_PAGE - 1));
	page.end = page.end >= pages ? pages : page.end;	// 실제 끝 페이지 번호 확인
	page.isPrevious = page.start > 1;
	page.isNext = page.end < pages;
	
	
	var pageHTML = '';
	//<!-- previous -->
	if (page.isPrevious) {
		pageHTML += ''
		+'<li class="page-item">'
			+'<button type="button" class="page-link" onclick="previous()" aria-label="Previous">'
				+'<span aria-hidden="true">&laquo;</span>'
				+'<span class="sr-only">이전</span>'
			+'</button>'
		+'</li>'
	}
	//<!-- page -->
	for (var i = page.start; i <= page.end; i++) {
		pageHTML += ''
		+'<li class="page-item ' + (cri.pageNum == i ? 'active' : '') +'">'
			+'<button class="page-link" onclick="pageBtn('+i+')">'+i+'</button>'
		+'</li>'
	}
	//!-- next -->
	if (page.isNext) {
		pageHTML += ''
		+'<li class="page-item">'
			+'<button type="button" class="page-link" onclick="next()" aria-label="Next">'
				+'<span aria-hidden="true">&raquo;</span>'
				+'<span class="sr-only">다음</span>'
			+'</button>'
		+'</li>'
	}
	console.log(pageHTML)
	$('#pagination').html(pageHTML);
	getList();
}

function pageBtn(pageNum) {
	cri.pageNum = pageNum;
	page.pageCal();
}
function previous() {
	page.start -= 1;
	cri.pageNum = page.start
	page.pageCal();
}
function next() {
	page.end += 1;
	cri.pageNum = page.end
	page.pageCal();
}
onload = function() {
	page.pageCal();
}

$('#selectAmount').on('change', function(){
	cri.amount = $(this).val();
	cri.pageNum = 1;
	page.start = 1;
	page.end = page.NUM_PER_PAGE
	page.pageCal();
});

$('#keyword').on('keyup', function(){
	cri.keyword = $(this).val()
	cri.type = $('#type').val()
	page.pageCal();
});
</script>



<script>
getList();
function getList() {
	fetch('/4/gallery/photoListProc.jsp', {	
		method: "post",
		body: new URLSearchParams({
				amount: cri.amount,
				pageNum: cri.pageNum,
				offset: cri.amount * (cri.pageNum - 1),
				keyword: cri.keyword,
				type: cri.type
			})
        })
		.then(resp => resp.json())
		.then(data => {
			console.log(data);
			var imgHTML = '';
			for (var i = 0; i < data.length; i++) {
				var img = data[i].upfolder + '/' +data[i].uuid + '_' + data[i].filename;
				imgHTML += ''
					+ '<div class="col-sm-6 col-md-4 col-lg-3 item h-100">'
					+ '<a class="col-lg-4 col-md-12 mb-4 mb-lg-0" href="'+ img +'" data-title="'+data[i].title +'" data-lightbox="photos">'
					+ '<img class="img-fluid shadow bg-body rounded" src="'+img+'"></a></div>';
			}
			$('#imgList').html(imgHTML);
		})
}
























lightbox.option({
    resizeDuration: 200,
    wrapAround: false,
    disableScrolling: true,
    fitImagesInViewport: true
});

function regPhoto(){
	$('#uploadModal').modal('show');
}

$('#doneBtn').on('click', function(){
	if ($('#title').val() != '' && $('#image').val() != '') {
		$('#imgForm').submit();
	} else {
		popModal('사진 등록 실패', '입력 값이 없는 항목이 있습니다.')
	}
});
</script>
</body>
</html>