<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
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

	<div class="container mt-3">
	<h3 class="my-3">가입 신청 회원 리스트</h3>
		<table class="table table-striped table-hover">

			<thead>
				<tr>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">직분</th>
					<th scope="col">신청시간</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody id="ajaxTable">

				
			</tbody>
		</table>
	</div>
	<%@ include file="/include/footer.jsp"%>
	
	<script>
	function searchFunction() {
		$.ajax({
			type:"post",
			url:"/admin/tempCheck.jsp",
			success : function(data) {
				let users = JSON.parse(data.trim());
				let str = "";
				
				for (var i = 0; i < users.length; i++) {
					str += "<tr><td>" + users[i].email + "</td>";
					str += "<td>" + users[i].name + "</td>"
					str += "<td>" + users[i].job + "</td>"
					str += "<td>" + users[i].joindate + "</td>"
					str += "<td><button onclick='acceptUser(\"" + users[i].email + "\")' class='btn btn-sm btn-primary mx-3 px-3'>승인</button>"
					str +=	"<button onclick='rejectUser(\"" + users[i].email + "\")' class='btn btn-sm btn-danger mx-3 px-3'>거절</button></td></tr>"
				}
				$("#ajaxTable").html(str);
			}
		})
		
	}
	
	function acceptUser(userEmail) {
		$.ajax({
			type:"post",
			url:"/admin/acceptCheck.jsp",
			data : {email : userEmail },
			success : function(data) {
				if (data.trim() == 1 ) {
					alert("회원 [" + userEmail +"] 님을 승인하였습니다")
					searchFunction();
				} else {
					alert("처리에 문제가 생겼습니다.")
				}
			},
			error: function (err) {
				 	alert("처리에 문제가 생겼습니다.");
				}
		})
	}
	
	function rejectUser(userEmail) {
		$.ajax({
			type:"post",
			url:"/admin/removeUser.jsp",
			data : {email : userEmail },
			success : function(data) {
				if (data.trim() == 1 ) {
					alert("회원 [" + userEmail +"] 님을 승인 거절하였습니다")
					searchFunction();
				} else {
					alert("처리에 문제가 생겼습니다.")
				}
			},
			error: function (err) {
				 	alert("처리에 문제가 생겼습니다.");
				}
		})
		
	}
	
	window.onload = function() {
		searchFunction()
	}
	
	
	</script>

	
</body>
</html>