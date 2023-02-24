<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/16

버전  기록 : 0.1(시작 23/02/16) -->

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

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>오시는 길</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar1.jsp"%>
				</div>

				<div class="col-9">
					<hr>
					<h4 class="my-4 mx-2" style="font-family: 'LINESeedKR-Bd';">주소</h4>
					<p class="my-2 mx-2" style="font-family: 'LINESeedKR-Bd';">서울 서대문구 증가로 130 지하 1층</p>
					<p class="my-2 mx-2" style="font-family: 'LINESeedKR-Bd';">서대문구 증가로 130</p>
					<hr>
					<h4 class="my-4 mx-2" style="font-family: 'LINESeedKR-Bd';">탑승 버스</h4>
					<p class="my-2" style="font-family: 'LINESeedKR-Bd';">
						<span class="mx-2"><span class="badge bg-primary">간선</span> 272 </span>
						<span class="mx-2"><span class="badge bg-success">지선</span> 7017 </span>
						<span class="mx-2"><span class="badge bg-success">지선</span> 7021 </span>
						<span class="mx-2"><span class="badge bg-success">지선</span> 7612 </span>
						<span class="mx-2"><span class="badge bg-success">지선</span> 7734 </span>
						<span class="mx-2"><span class="badge bg-success">지선</span> 7738 </span>
					</p>
					<hr>
					<div class="my-3 shadow bg-body rounded"
						style="position: relative;">
						<div class="rounded shadow" id="map" style="width: 1000px; height: 500px;"></div>
						<button id="viewBtn"
							style="position: absolute; bottom: 10px; left: 10px; z-index: 9999"
							class="btn btn-success" onclick="showRoadView()">로드뷰 보기</button>
					</div>
					<div class="text-end"></div>
					<div class="my-3">
						<div id="roadview" class="shadow bg-body rounded"
							style="width: 1000px; height: 500px; display: none"></div>
					</div>
				</div>


			</div>
		</div>
	</div>


	<%@ include file="/include/footer.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d944d4a9cb22483964d7e130a9b4c2a"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.5775, 126.9233),
			level : 2
		};

		var map = new kakao.maps.Map(container, options);

		map.setZoomable();

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		var iwContent = '<div style="padding:5px; font-family: LINESeedKR-Bd;">행전우리교회 </div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var iwPosition = new kakao.maps.LatLng(37.5775, 126.9233); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);

		//로드뷰
		var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		var position = new kakao.maps.LatLng(37.5775, 126.9233);
		var viewBtn = document.getElementById('viewBtn');

		RoadViewFlag = false

		function showRoadView() {
			if (RoadViewFlag == false) {
				RoadViewFlag = true;
				roadviewContainer.style.display = 'block';
				viewBtn.innerText = "로드뷰 끄기";
				// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
				roadviewClient.getNearestPanoId(position, 50, function(panoId) {
					roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
				});
			} else {
				RoadViewFlag = false
				roadviewContainer.style.display = 'none';
				viewBtn.innerText = "로드뷰 보기";

			}

		}
	</script>
</body>
</html>