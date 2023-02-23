<!-- 최초작성자 : 최현식
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<h2>교육 부서</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar3.jsp"%>
				</div>

				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted">
						</div>
						<div class="col-9 text-end">
						</div>
					</div>
					
					<div class="container">
					<img src="edu.jpg" width="100%" height="300"style="margin-bottom:20px">
				    <h3>부서</h3><br>
				    <div class="row row-cols-1 row-cols-md-2 mb-3 text-center">
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">영아유치부</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>부장 : 김경자 권사</li>
				              <li>지도 : 김종길 목사</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">유초등부</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>부장 : 김경자 권사</li>
				              <li>교사 : 김경자, 김정화</li>
				              <li>지도 : 김종길 목사</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">중고등부</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>부장 : 변희섭 집사</li>
				              <li>교사 : 변희선, 최인춘</li>
				              <li>지도 : 김종길 목사</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">청년 대학부</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>부장 : 이원석 집사</li>
				              <li>회장 : 홍원표</li>
				              <li>지도 : 황정현 목사</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       </div> 
				     </div>
					</div>
				</div>
			</div>
		</div>


	<%@ include file="/include/footer.jsp"%>
</body>
</html>