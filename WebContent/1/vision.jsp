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
	 .main_image {
	    position: relative;
	  }
	  .main_image_text {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate( -50%, -50% );
	    color: white;
	  }

    </style>
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>교회 비전</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>

				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted">
						</div>
						<div class="col-9 text-end">
						</div>
					</div>
					
					<div class="album py-5">
   					<div class="container" align="center">
   					<img src="cross.jpg" width="70%" height="225"  width="100%" height="225" style="margin-bottom:80px">
   					</div>
   					 <div class="container">
   					 <p style="font-weight:bold; font-size:20px; color:#747474;">행전우리교회는 복음으로 하나되어 예배 양육 전도하는 한몸공동체입니다.</p>
   						
						<p>예수 그리스도 복음을 믿고 하나로 연합된 ‘한몸공동체’입니다.</p>
						<p>하나님을 사랑하여 신령과 진정으로 예배하는 ‘예배공동체’입니다.</p>
						<p>하나님 중심 말씀 중심 교회 중심으로 자라가는 ‘양육공동체’입니다.</p>
						<p>이웃을 사랑하여 복음을 전하는 ‘선교공동체’입니다.</p> <br><br>
						
					<p style="font-weight:bold; font-size:20px; color:#747474;">20223년 표어</p>
						<p> 다음 세대를 이어가는 믿음의 경주자(히12:1-3)</p><br><br>
						
					<p style="font-weight:bold; font-size:20px; color:#747474;">2023년 목표</p>
						<p>예배ㆍ양육ㆍ전도가 균형 잡힌 그리스도인</p><br><br>
					
					<p style="font-weight:bold; font-size:20px; color:#747474;">행전우리교회가 지향하는 교회상</p>
						<p>① 예수 그리스도 복음이 중심인 교회</p>
						<p>② 기도로 섬기는 교회</p>
						<p>③ 직분을 귀히 여기는 교회</p>
						<p>④ 사명을 감당하는 교회</p>
						<p>⑤ 젊은이가 꿈을 꾸는 교회</p>
						<p>⑥ 가정이 회복되는 교회</p>
						<p>⑦ 형제교회를 돌보는 교회</p>
					</div>
					</div>
					
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/include/footer.jsp"%>

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
			return '/4/news/totalNumProc.jsp'
		}
		/* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
		function getListUrl() {
			return '/4/news/newsListProc.jsp'
		}

		}

	</script>

</body>
</html>