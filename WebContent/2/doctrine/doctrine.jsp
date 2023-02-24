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
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
<script type="text/javascript">
if ('<%=request.getParameter("msg")%>'=='addok'){
	history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
};
}
</script>
	<!-- 게시판 영역 -->
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>복음과 교리</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar2.jsp"%>
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
							<button class="btn btn-sm btn-outline-success" type="button" onclick="checkSid()" class="ad">게시물 등록</button>
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
						<tbody id="ajaxTable">
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

	<script>
 	var sid = "<%=sid%>"

		function checkSid() {
			if (sid == null) {
				popModal("실패", "등록을 하기 위해서는 로그인이 필요합니다")
			} else {
				location.href = "docAdd.jsp"
			}
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
		
		
		
		window.onload = function() {
			searchFunction();
			if (sid != null) {
				$('.ad').show()
			} else {
				$('.ad').hide()
			}
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
			if (data.length < 1) {
				var noneStr = '';
				noneStr ='<div>등록된 게시물이 없습니다.<div>'
				$("#none").html(noneStr);
			}
			var str = '';
			for (var i = 0; i < data.length; i++) {
				var name = getUserName(data[i].email)
				var date = getDate(data[i].ddate)
				str += "<tr onclick=\"location.href='docView.jsp?dno="
					+ data[i].dno + "'\"><td>" + data[i].dtitle + "</td>";
				str += "<td>" + name + "</td>";
				str += "<td>" + date + "</td></tr>";
			}
			$("#ajaxTable").html(str);
		}
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
	</script>

	<%@ include file="/include/footer.jsp"%>
	<script src="/resources/js/page.js"></script>

</body>
</html>