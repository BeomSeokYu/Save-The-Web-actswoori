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

<!-- 게시판 영역 -->
<div class="container">
	<div class="photo-gallery container mb-3">
		<div class="row justify-content-center">
			<h2>협력 교회와 기관 소식</h2>
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
							<%
								if (sid != null) { // 세션 처리
							%>
							<a href="coopAdd.jsp" class="btn btn-sm btn-outline-success">게시물 등록 </a>
							<%
								}
							%>
						</div>
					</div>
					<hr class="my-4">

					<table class="table table-hover shadow bg-body rounded">
						<thead>
							<tr style="background-color: #548687; color: white;">
								<th scope="col" class="col-6">제목</th>
								<th scope="col" class="col-2">작성자</th>
								<th scope="col" class="col-2">작성일</th>
							</tr>
						</thead>
						<tbody id="imgList">


						</tbody>
					</table>
					<div class="row text-center" id="none"></div>
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
									<option value="C">내용</option>
									<option value="TC">제목/내용</option>
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
	<%@ include file="/include/footer.jsp"%>

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
	if (data.length < 1) {
		var noneStr = '';
		noneStr ='<div>등록된 게시물이 없습니다.<div>'
		$("#none").html(noneStr);
	}
	var imgHTML = '';
	for (var i = 0; i < data.length; i++) {
		var name = getUserName(data[i].email)
		var date = getDate(data[i].cdate)
		imgHTML += ''
			imgHTML += ''
				+ "<tr onclick=\"location.href='coopInfo.jsp?cno="
				+ data[i].cno + "'\"><td>" + data[i].ctitle + "</td>"
				+ '<td>' + name + "</td>" + '<td>'
				+ date + "</td></a></tr>"
			
/* 			+= "<tr onclick=\"location.href='coopInfo.jsp?cno="
			imgHTML += data[i].cno +'">' + data[i].ctitle + '</td>';
			imgHTML += '<td></td>';
			imgHTML += '<td>' + data[i].email + '</td>';
			imgHTML += '<td>' + data[i].cdate + '</td></tr>';
			 */
			
	imgHTML += ''
		+ '<div class="col-sm-6 col-md-4 col-lg-3 item h-100">'
		;
	}
	$('#imgList').html(imgHTML);
}

function getUserName(a) {
	$.ajax({
		type : 'post',
		url : '/user/userInfoProc.jsp',
		data : {
			email : a
		},
		dataType : "text",
		async : false,
		success : function(data) {
			var user = JSON.parse(data.trim());
			name = user.name
		}
	});
	return name
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

function getDate(input) {
	date = new Date(input)
	today = new Date()
	timegap = today - date
	if(timegap>1000*60*60*24){
		// 년월일
		return date.toISOString().split('T')[0]
	} else {
		if(today.getDate()==date.getDate()){
		// 시 분
			if(date.getHours()<12){
				if (date.getHours()<10){
					if(date.getMinutes()<10){
						return 'AM '+'0'+date.getHours()+' : 0'+date.getMinutes()
					} else {
						return 'AM '+'0'+date.getHours()+' : '+date.getMinutes()
					}
				} else {
					if(date.getMinutes()<10){
						return 'AM '+date.getHours()+' : 0'+date.getMinutes()
					} else {
						return 'AM '+date.getHours()+' : '+date.getMinutes()
					}
				}
			} else if (date.getHours()==12){
				if(date.getMinutes()<10){
					return 'PM '+date.getHours()+' : 0'+date.getMinutes()
				} else {
					return 'PM '+date.getHours()+' : '+date.getMinutes()
				}
			} else {
				if (date.getHours()<22){
					if(date.getMinutes()<10){
						return 'PM '+'0'+(date.getHours()-12)+' : 0'+date.getMinutes()
					} else {
						return 'PM '+'0'+(date.getHours()-12)+' : '+date.getMinutes()	
					}
				} else {
					if(date.getMinutes()<10){
						return 'PM '+(date.getHours()-12)+' : 0'+date.getMinutes()
					} else {
						return 'PM '+(date.getHours()-12)+' : '+date.getMinutes()
					}
				}
			}
		} else {
			// 년월일
			return date.toISOString().split('T')[0]
		}
	}
}


</script>
</body>
</html>