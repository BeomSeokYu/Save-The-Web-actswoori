<!-- 최초작성자 : 유범석
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 유범석
버전  기록 : 0.2(시작 23/02/17) 김예건 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- navigation bar -->
<!-- <nav class="navbar navbar-expand-md fixed-top navbar-light bg-light" aria-label="Eighth navbar example">
  <div class="container">
    <a class="navbar-brand custom_navbar-brand" href="#"><img src="/resources/img/logo_main.png" alt=""></a>
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
            <li><a class="dropdown-item" href="/1/vision.jsp">교회 비전</a></li>
            <li><a class="dropdown-item" href="/1/moim.jsp">모임 안내</a></li>
            <li><a class="dropdown-item" href="#">섬기는 사람들</a></li>
            <li><a class="dropdown-item" href="/1/directions.jsp">오시는 길</a></li>
          </ul>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            예배와 말씀
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/2/worship/wSelectAll.jsp">예배 설교</a></li>
            <li><a class="dropdown-item" href="/2/lecture/lectureMain.jsp">주요 특강</a></li>
            <li><a class="dropdown-item" href="/2/doctrine/doctrine.jsp">복음과 교리</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         양육과 교육
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">교육 부서</a></li>
            <li><a class="dropdown-item" href="#">구역과 전도회</a></li>
            <li><a class="dropdown-item" href="/3/vow/vSelectAll.jsp">말씀 서원</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           돌봄과 선교
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/4/news/newsAll.jsp">교회 소식</a></li>
            <li><a class="dropdown-item" href="/4/post/postList.jsp">주보</a></li>
            <li><a class="dropdown-item" href="/4/coop/coopList.jsp">협력 교회와 기관소식</a></li>
            <li><a class="dropdown-item" href="/4/gallery/photoList.jsp">갤러리</a></li>
      	</li>
        
      </ul>
    </div>
  </div>
</nav> -->

<div class="container border-bottom">
  <header class="d-flex flex-wrap justify-content-center py-3 mb-4">
      <a class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none" href="/main.jsp">
      <img src="/resources/img/logo_main.png" alt="">
      </a>

    <ul class="nav nav-pills nav-main">
      <li class="nav-item dropdown">
          <a class="nav-link text-dark" href="/1/vision.jsp" role="button" aria-expanded="false">
            교회 소개
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/1/vision.jsp">교회 비전</a></li>
            <li><a class="dropdown-item" href="/1/moim.jsp">모임 안내</a></li>
            <li><a class="dropdown-item" href="/1/peopleAll.jsp">섬기는 사람들</a></li>
            <li><a class="dropdown-item" href="/1/directions.jsp">오시는 길</a></li>
          </ul>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link text-dark" href="/2/worship/wSelectAll.jsp" role="button" aria-expanded="false">
            예배와 말씀
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/2/worship/wSelectAll.jsp">예배 설교</a></li>
            <li><a class="dropdown-item" href="/2/lecture/lectureMain.jsp">주요 특강</a></li>
            <li><a class="dropdown-item" href="/2/doctrine/doctrine.jsp">복음과 교리</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link text-dark" href="/3/edu.jsp" role="button" aria-expanded="false">
         양육과 교육
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/3/edu.jsp">교육 부서</a></li>
            <li><a class="dropdown-item" href="/3/area.jsp">구역과 전도회</a></li>
            <li><a class="dropdown-item" href="/3/vow/vSelectAll.jsp">말씀 서원</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link text-dark" href="/4/news/newsAll.jsp" role="button" aria-expanded="false">
           돌봄과 선교
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/4/news/newsAll.jsp">교회 소식</a></li>
            <li><a class="dropdown-item" href="/4/post/postList.jsp">주보</a></li>
            <li><a class="dropdown-item" href="/4/coop/coopList.jsp">협력 교회와 기관 소식</a></li>
            <li><a class="dropdown-item" href="/4/gallery/photoList.jsp">갤러리</a></li>
      	</ul>
      	</li>
    </ul>
  </header>
</div>


<!--Start Hedaer Section-->
<!-- <section id="header">
    <div class="header-area">
        <div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
            <div class="container">
                <nav class="navbar navbar-default zero_mp ">
                    Brand and toggle get grouped for better mobile display
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand custom_navbar-brand" href="/main.jsp"><img src="/resources/img/logo_main.png" alt=""></a>
                    </div>
                    End of navbar-header

                    Collect the nav links, forms, and other content for toggling
                    <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right main_menu">
                            <li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            교회 소개
					          </a>
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="/1/vision.jsp">교회 비전</a></li>
					            <li><a class="dropdown-item" href="/1/moim.jsp">모임 안내</a></li>
					            <li><a class="dropdown-item" href="#">섬기는 사람들</a></li>
					            <li><a class="dropdown-item" href="/1/directions.jsp">오시는 길</a></li>
					          </ul>
					        </li>
					       <li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            예배와 말씀
					          </a>
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="/2/worship/wSelectAll.jsp">예배 설교</a></li>
					            <li><a class="dropdown-item" href="/2/lecture/lectureMain.jsp">주요 특강</a></li>
					            <li><a class="dropdown-item" href="/2/doctrine/doctrine.jsp">복음과 교리</a></li>
					          </ul>
					        </li>
					        
					        <li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					         양육과 교육
					          </a>
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="#">교육 부서</a></li>
					            <li><a class="dropdown-item" href="#">구역과 전도회</a></li>
					            <li><a class="dropdown-item" href="/3/vow/vSelectAll.jsp">말씀 서원</a></li>
					          </ul>
					        </li>
					        
					        <li class="nav-item dropdown">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					           돌봄과 선교
					          </a>
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="/4/news/newsAll.jsp">교회 소식</a></li>
					            <li><a class="dropdown-item" href="/4/post/postList.jsp">주보</a></li>
					            <li><a class="dropdown-item" href="/4/coop/coopList.jsp">협력 교회와 기관소식</a></li>
					            <li><a class="dropdown-item" href="/4/gallery/photoList.jsp">갤러리</a></li>
					          </ul>
					      	</li>
                        </ul>
                    </div>
                    /.navbar-collapse
                </nav>
                End of nav
            </div>
            End of container
        </div>
        End of header menu
    </div>
    end of header area
</section>
End of Hedaer Section -->
