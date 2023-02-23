<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>

</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>모임 안내</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar1.jsp"%>
				</div>

				<div class="col-9">
					<div>
						<img src="/resources/img/moim.jpg"
							style="width: 1000px; height: 295px; object-fit: cover; object-position: left top;"
							alt="모임표지" />
					</div>
					<hr class="my-5">
					<h3 class="my-4">예배 및 기도회</h3>

					<table class="table mb-4">
						<thead class="table-light">
							<tr>
								<th class = "col-6">예배</th>
								<th class = "col-6">시간</th>
							</tr>
						</thead>
						<tbody class="table-gruop-divider">
							<tr>
								<th>주일 1부 예배</th>
								<th>오전 9:00</th>
							</tr>

							<tr>
								<th>주일 2부 예배</th>
								<th>오전 11:00</th>
							</tr>

							<tr>
								<th>주일 오후 예배</th>
								<th>오전 9:00</th>
							</tr>

							<tr>
								<th>수요예배</th>
								<th>오후 7:00</th>
							</tr>

							<tr>
								<th>금요기도회</th>
								<th>오후 8:30</th>
							</tr>

							<tr>
								<th>새벽기도회</th>
								<th>월~금 5시</th>
							</tr>
						</tbody>
					</table>

					<hr class="my-5">
					<h3 class="my-4">부서 예배</h3>
					<table class="table">
						<thead class="table-light">
							<tr>
								<th class = "col-6">예배</th>
								<th class = "col-6">시간</th>
							</tr>
						</thead>
						<tbody class="table-gruop-divider">
							<tr>
								<th>유치부</th>
								<th>오전 11:00</th>
							</tr>

							<tr>
								<th>유초등부</th>
								<th>오전 9:00</th>
							</tr>

							<tr>
								<th>중고등부</th>
								<th>오전 9:00</th>
							</tr>

							<tr>
								<th>청년대학부</th>
								<th>오후 1:30</th>
							</tr>

							<tr>
								<th>구역예배</th>
								<th>구역별 별도공지</th>
							</tr>

							<tr>
								<th>새가족/학습세례</th>
								<th>비정규 모임</th>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/include/footer.jsp"%>
</body>
</html>