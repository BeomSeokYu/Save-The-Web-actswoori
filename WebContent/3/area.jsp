<!-- 최초작성자 : 김예건
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
				<h2>구역과 전도회</h2>
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
					<img src="area.png" width="100%" height="300"style="margin-bottom:20px">
				    <h3>구역</h3><br>
				    <div class="row row-cols-1 row-cols-md-4 mb-3 text-center">
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">1구역</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>구역장 : 노미희</li>
				              <li>부구역장 : 갈춘란</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">2구역</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>구역장 : 박영희</li>
				              <li>부구역장 : 민병녀</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">3구역</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>구역장 : 김정순</li>
				              <li>부구역장 : 유은자</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">4구역</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-4">
				              <li>구역장 : 김경자</li>
				              <li>부구역장 : 노연옥</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				     </div>
				     
				     
					<hr class="my-4">
					<h3>전도회</h3><br>
				    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="py-3">
				            <h4 class="my-0 fw-normal">남전도회</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-2">
				              <li>회장 : 안순천 집사</li>
				              <li>총무 : 배종삼 장로</li>
				              <li>회계 : 이원석 집사</li>
				              <li>서기 : 민병국 장로</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="py-3">
				            <h4 class="my-0 fw-normal">1여전도회</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-2">
				              <li>회장 : 박영희 권사</li>
				              <li>총무 : 김정삼 권사</li>
				              <li>회계 : 유은자 권사</li>
				              <li>서기 : 민병녀 권사</li>
				            </ul>
				          </div>
				        </div>
				      </div>
				       <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="py-3">
				            <h4 class="my-0 fw-normal">2여전도회</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-2">
				              <li>회장 : 류희순 집사</li>
				              <li>총무 : 최인춘 장로</li>
				              <li>회계 : 변희선 집사</li>
				              <li>서기 : 최인춘 장로</li>
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