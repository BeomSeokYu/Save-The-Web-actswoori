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
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

  <section class="py-5 text-center container"></section>
<!-- 게시판 영역 -->
<div class="container">
	<div class="photo-gallery container mb-3">
		<div class="row justify-content-center">
			<h2 class="sticky-md-top">협력 기관 소식</h2>
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
						<button class="btn btn-outline-secondary" type="button" onclick="location.href='coopAdd.jsp'">글 등록</button>
					</div>
		        </div>
				
				
			<table class="table">
			<thead>
				<tr>
			      <th scope="col">no</th>
			      <th scope="col" colspan=2>제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">time</th>
				</tr>
			</thead>
			
			<tbody id=imgList class="table-group-divider">
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
				       		<option value="F">파일명</option>
				       		<option value="TF">제목/파일명</option>
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
	return '/4/coop/totalNumProc.jsp'
}
/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
function getListUrl() {
	return '/4/coop/photoListProc.jsp'
}
function printList(data) {
	//TODO: 리스트 출력 처리 하세요
	var imgHTML = '';
	for (var i = 0; i < data.length; i++) {
		imgHTML += ''
			imgHTML += '<tr><td>' +data[i].cno+ '</td>';
			imgHTML += '<td><a href="coopInfo.jsp?cno='+data[i].cno+'">' + data[i].ctitle + '</td>';
			imgHTML += '<td></td>';
			imgHTML += '<td>' + data[i].email + '</td>';
			imgHTML += '<td>' + data[i].cdate + '</td></tr>';
			
			
	imgHTML += ''
		+ '<div class="col-sm-6 col-md-4 col-lg-3 item h-100">'
		;
	}
	$('#imgList').html(imgHTML);
}




















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