<!-- 최초작성자 : 유범석
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 유범석
버전  기록 : 0.2(시작 23/02/17) 김예건 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- navigation bar -->
<nav class="navbar navbar-expand-md fixed-top navbar-light bg-light" aria-label="Eighth navbar example">
  <div class="container">
    <a class="navbar-brand" href="/main.jsp">행전우리교회</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample07">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            교회 소개
          </a>
          <ul class="dropdown-menu">
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/1/vision.jsp">교회 비전</a></li>
            <li><a class="dropdown-item" href="/1/moim.jsp">모임 안내</a></li>
            <li><a class="dropdown-item" href="#">섬기는 사람들</a></li>
            <li><a class="dropdown-item" href="/1/directions.jsp">오시는 길</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            예배와 말씀
          </a>
          <ul class="dropdown-menu">
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/2/worship/wSelectAll.jsp">예배 설교</a></li>
            <li><a class="dropdown-item" href="/2/lecture/lectureMain.jsp">주요 특강</a></li>
            <li><a class="dropdown-item" href="/2/doctrine/doctrine.jsp">복음과 교리</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         양육과 교육
          </a>
          <ul class="dropdown-menu">
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">교육 부서</a></li>
            <li><a class="dropdown-item" href="#">구역과 전도회</a></li>
            <li><a class="dropdown-item" href="/3/vow/vSelectAll.jsp">말씀 서원</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           돌봄과 선교
          </a>
          <ul class="dropdown-menu">
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/4/news/newsAll.jsp">교회 소식</a></li>
            <li><a class="dropdown-item" href="/4/post/postList.jsp">주보</a></li>
            <li><a class="dropdown-item" href="/4/coop/coopList.jsp">협력 교회와 기관소식</a></li>
            <li><a class="dropdown-item" href="/4/gallery/photoList.jsp">갤러리</a></li>
            <li><hr class="dropdown-divider"></li>
      
        
      </ul>
    </div>
  </div>
</nav>