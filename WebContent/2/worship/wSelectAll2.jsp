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

<!-- 게시판 영역 -->
<div class="container">
	<div class="photo-gallery container mb-3">
		<div class="row justify-content-center">
			<h2 class="sticky-md-top">갤러리</h2>
			<div class="col-3 d-none d-lg-block">
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
						<ul class="pagination justify-content-center" id="pagination">
						
						</ul>
					</div>
					<div class="col-4">
						<div class="d-flex text-end">
						  <select class="form-select" id="selectType">
				       		<option value="T" selected>제목</option>
				       		<option value="N">설교자명</option>
				       		<option value="E">이메일</option>
				          </select>
					      <input class="form-control" type="search" placeholder="검색어" aria-label="" id="keyword">
					      <button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
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
			<input class="form-control" type="file" accept="image/*" name="image" id="image" multiple>
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
	return '/2/worship/totalNumProc.jsp'
}
/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getListUrl() {
	return '/2/worship/wSelectAllProc.jsp'
}
function printList(data) {
	//TODO: 리스트 출력 처리 하세요
	var imgHTML = '';
	for (var i = 0; i < data.length; i++) {
		imgHTML += ''
			+ '<div class="col-sm-6 col-md-4 col-lg-3 item h-100">'
			+ data[i].wtitle
			+'</div>';
	}
	$('#imgList').html(imgHTML);
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