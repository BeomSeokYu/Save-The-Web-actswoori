<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdbc.PageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="jdbc.GalleryDTO"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 삽입 -->
<%@page import="sqlMap.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	Criteria cri = new Criteria();
	PageDTO pdto = null;
	try{
		pdto = new PageDTO(cri, (int)sqlSession.selectOne("GalleryMapper.totalCount", cri));
	}catch(Exception e){
	    e.printStackTrace();
	}finally{
	    sqlSession.close();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<jsp:include page="/include/header.jsp"/>
</head>
<body>
<jsp:include page="/include/navbar.jsp"/>
	<div class="wrapper">
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board List Page</h1>
                </div>
            </div>
			<div class="row">
		        <div class="col-lg-offset-3 col-lg-6">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                    Board List
		                    <a class="btn btn-xs pull-right btn-info" href="/board/register" id="regBtn">register new board</a>
		                </div>
		                <div class="panel-body">
		                	<div class="row">
								<form class="text-right col-lg-12">
							        Show
							        <select id="selectAmount">
							       		<option value="8" <%= pdto.getCriteria().getAmount() == 8 ? "selected" : "" %>>8</option>
							       		<option value="16" <%= pdto.getCriteria().getAmount() == 16 ? "selected" : "" %>>16</option>
							       		<option value="24" <%= pdto.getCriteria().getAmount() == 24 ? "selected" : "" %>>24</option>
							        </select>
							        entries
								</form>
							</div>
							<p></p>
							<div class="row">
								<div class="col-lg-12">
									<table class="table table-striped table-bordered table-hover">
									    <thead>
									        <tr>
									            <th>no.</th>
									            <th>제목</th>
									            <th>폴더</th>
									            <th>UUID</th>
									            <th>파일명</th>
									            <th>작성자</th>
									            <th>날짜</th>
									        </tr>
									    </thead>
									    <tbody id='dataTable'>
											<%-- <%	for (GalleryDTO gdto : list) { %>
												<tr>
										            <td><%= gdto.getGno() %></td>
										            <td><%= gdto.getGtitle() %></td>
										            <td><%= gdto.getGupfolder() %></td>
										            <td><%= gdto.getGuuid() %></td>
										            <td><%= gdto.getGfilename() %></td>
										            <td><%= gdto.getEmail() %></td>
										            <td><%= gdto.getGdate() %></td>
										        </tr>
										    <%	} %> --%>
								        </tbody>
									</table>
								</div>
							</div>
							<div class="row text-right">
								<form class="col-lg-12" action="/board/list" id="searchFrm">
									<select name="type">
							       		<option value="T" <%= pdto.getCriteria().getType() == "T" ?  "selected" : "" %>>제목</option>
							       		<option value="C" <%= pdto.getCriteria().getType() == "F" ?  "selected" : "" %>>파일명</option>
							       		<option value="W" <%= pdto.getCriteria().getType() == "E" ?  "selected" : "" %>>이메일</option>
							       		<option value="TC" <%= pdto.getCriteria().getType() == "TF" ?  "selected" : "" %>>제목/파일명</option>
							       		<option value="TW" <%= pdto.getCriteria().getType() == "TE" ?  "selected" : "" %>>제목/이메일</option>
							       		<option value="TCW" <%= pdto.getCriteria().getType() == "TFE" ?  "selected" : "" %>>제목/파일명/이메일</option>
							        </select>
							      	<input type="search" name="keyword" value="<%= pdto.getCriteria().getKeyword() %>">
							      	<button class="btn btn-sm" id="searchBtn" type="button">검색</button>
							      	<input type="hidden" name="pageNum" value="1">
									<input type="hidden" name="amount" value="<%= pdto.getCriteria().getAmount() %>">
								</form>
							</div>
							<div class="row text-center">
								<ul class="pagination" id="pagination">
									<%-- <!-- previous -->
									<li class="page-item">
									<% if (pdto.isPrevious()) {%>
										<button class="page-link" id="previous()" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
											<span class="sr-only">Previous</span>
										</button>
									<% } %>
									</li>
									<!-- page -->
									<% for (int i = pdto.getStart(); i <= pdto.getEnd(); i++) { %>
										<li class="page-item <%= pdto.getCriteria().getPageNum() == i ? "active" : "" %>">
											<a class="page-link" href="<%= i %>"><%= i %></a>
										</li>
									<% } %>
									<!-- next -->
									<% if (pdto.isNext()) { %>
										<li class="page-item">
											<a class="page-link" id="next()" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
											</a>
										</li>
									<% } %> --%>
								</ul>
							</div>
							<form id="actionFrm" action="/board/list">
								<input type="hidden" name="pageNum" value="<%= pdto.getCriteria().getPageNum() %>">
								<input type="hidden" name="amount" value="<%= pdto.getCriteria().getAmount() %>">
								<input type="hidden" name="keyword" value="<%= pdto.getCriteria().getKeyword() %>">
								<input type="hidden" name="type" value="<%= pdto.getCriteria().getType() %>">
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel"> 알림</h4>
			            </div>
			            <div class="modal-body" id="modalBody">
			                처리가 완료되었습니다.
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			        <!-- /.modal-content -->
			   </div>
			   <!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
<jsp:include page="/include/footer.jsp"/>
<script>
	function setPage(total) {
		var amount = cri.amount;
		var pageNum = cri.pageNum;
		
		var pages = Math.ceil(total / amount);

		page.end = (Math.ceil(pageNum / page.NUM_PER_PAGE) * page.NUM_PER_PAGE);
		page.start = (page.end - (page.NUM_PER_PAGE - 1));
		page.end = page.end >= pages ? pages : page.end;	// 실제 끝 페이지 번호 확인
		page.previous = page.start > 1;
		page.next = page.end < pages;
		
		
		var pageHTML = '';
		if (page.isPrevious) {
			pageHTML += ''
			+'<li class="page-item">';
				+'<button type="button" class="page-link" onclick="previous()" aria-label="Previous">'
					+'<span aria-hidden="true">&laquo;</span>'
					+'<span class="sr-only">Previous</span>'
				+'</button>'
			+'</li>'
		}
		//<!-- page -->
		for (var i = page.start; i <= page.end; i++) {
			pageHTML += ''
			+'<li class="page-item ' + (cri.pagenum == i ? "active" : "") +'">'
				+'<button class="page-link" onclick="pageBtn('+i+')">'+i+'</button>'
			+'</li>'
		}
		//!-- next -->
		if (page.isNext) {
			pageHTML += ''
			+'<li class="page-item">'
				+'<button type="button" class="page-link" onclick="next()" aria-label="Next">'
					+'<span aria-hidden="true">&raquo;</span>'
					+'<span class="sr-only">Next</span>'
				+'</button>'
			+'</li>'
		}
		console.log(pageHTML)
		$('#pagination').html(pageHTML);
		getList();
	}
	
	function pageBtn(page) {
		cri.pageNum = page;
		getList();
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
	page.pageCal();

	// list Ajax 가져오기
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
				var listHTML = ''
				for (var i = 0; i < data.length; i++) {
					listHTML += ''
					+'<tr>'
			            +'<td>'+data[i].gno+'</td>'
			            +'<td>'+data[i].title+'</td>'
			            +'<td>'+data[i].upfolder+'</td>'
			            +'<td>'+data[i].uuid+'</td>'
			            +'<td>'+data[i].filename+'</td>'
			            +'<td>'+data[i].email+'</td>'
			            +'<td>'+data[i].date+'</td>'
		        	+'</tr>'
				}
				$('#dataTable').html(listHTML);
			})
			.catch(err => console.log('Error : ', err));	
	}
	
	// Pageing Event 처리
	var actionFrm = $('#actionFrm');
	$('.page-link').on('click', function(event) {
		event.preventDefault();
		actionFrm.find("input[name='bno']").remove();
		actionFrm.find("input[name='pageNum']").val($(this).attr('href'));
		actionFrm.attr('action', '/galleryTest.jsp');
		actionFrm.submit();
	});
	// view 페이지로 이동 처리
	$('.move').on('click', function (event) {
		event.preventDefault();
		var inputBno = actionFrm.find("input[name='bno']");
		console.log(inputBno.length);
		if(inputBno.length > 0) {
			inputBno.val($(this).attr('data'));
		} else {
			actionFrm.append('<input type="hidden" name="bno" value="'+ $(this).attr('data') +'">');
			
		}
		actionFrm.attr('action', '/board/view');
		actionFrm.submit();
	});
	
	// 페이지 표시 게시물 수 변경 이벤트 설정
	$('#selectAmount').on('change', function (event) {
		actionFrm.find("input[name='amount']").val($(this).val());
		actionFrm.attr('action', '/galleryTest.jsp');
		actionFrm.submit();
	});
	
	// 검색 버튼 이벤트 처리
	var searchFrm = $('#searchFrm');
	$('#searchBtn').on('click', function () {
		if(searchFrm.find("input[name='keyword']").val() == '') {
			$('#modalBody').text('검색어를 입력해 주세요.');
			$("#myModal").modal('show');
		} else {
			searchFrm.submit();
		}
	});
	
	// 처리 결과 알림 모달창 ----------------------
	var result = '${ result }'
	checkModal(result);
	
	// 모달창 재출력 방지
	history.replaceState({}, null, null);
	
	// 모달창 표시
	function checkModal(result) {
		// result가 없으면 리턴
		if(result === '' || history.state) {
			return;
		}
		$("#myModal").modal('show');
	}
</script>
</body>
</html>