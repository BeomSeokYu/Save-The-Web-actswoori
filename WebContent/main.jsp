<%@page import="jdbc.NewsDTO"%>
<%@page import="java.util.*"%>
<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<%@ include file="/include/footer.jsp" %>
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file="/include/header.jsp" %>
	<%@ include file="/include/navbar.jsp" %>
    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!--Bootstrap Carousel-->
    <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />
    <!-- css -->
	<link href="/resources/css/common.css" rel="stylesheet">
    <!--    Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--Fontawesom-->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <!--Animated CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">
    <link rel="stylesheet" href="/resources/css/isotope/style.css">
    <!--Main Stylesheet-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!--Responsive Framework-->
    <link href="/resources/css/responsive.css" rel="stylesheet">
	
    <body data-spy="scroll" data-target="#header">
        <!--Start of slider section-->
        <section class="" id="slider">
            <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel" data-interval="3000">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="/resources/img/img1.jpg" style="width: 100%; object-fit: cover;" alt="...">
                    </div>
                    <!--End of item With Active-->
                    <div class="item">
                        <img src="/resources/img/img2.jpg" style="width: 100%; object-fit: cover;" alt="...">
                    </div>
                    <!--End of Item-->
                    <div class="item">
                        <img src="/resources/img/img3.jpg" style="width: 100%; object-fit: cover;" alt="...">
                    </div>
                    <!--End of item-->
                    <div class="item">
                        <img src="/resources/img/img4.jpg" style="width: 100%; object-fit: cover;" alt="...">
                    </div>
                    <!--End of item-->
                </div>
                <!--End of Carousel Inner-->
            </div>
        </section>
        <!--end of slider section-->


        <!--Start of welcome section-->
        <section id="welcome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="wel_header">
                            <h2>모임 안내</h2>
                            <p>행전우리교회의 예배 시간을 안내해드립니다</p>
                        </div>
                        
                        <hr class="my-5">
                        <h3 class="my-4">예배및기도회</h3>

					<table class="table mb-4">
						<thead class="table-light">
							<tr>
								<th style="width:50%">예배</th>
								<th style="width:50%">시간</th>
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
					<h3 class="my-4">부서예배</h3>
					<table class="table mb-4">
						<thead class="table-light">
							<tr>
								<th style="width:50%">예배</th>
								<th style="width:50%">시간</th>
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
                <!--End of row-->
            </div>
            <!--End of container-->
        </section>
        <!--end of welcome section-->


<% List<NewsDTO> newsList = NewsDAO.selectNewNews(); 

%>

        <!--Start of testimonial-->
        <section id="testimonial">
            <div class="testimonial_overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="testimonial_header text-center">
                                <h2>교회 소식</h2>
                            </div>
                        </div>
                    </div>
                    <!--End of row-->
                    <section id="carousel">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000">
                                        <!-- Carousel indicators -->
                                        <ol class="carousel-indicators">
                                            <% if (newsList.size() > 0)  {%>
                                            <li data-target="#fade-quote-carousel" data-slide-to="0" class="active"></li>
                                            <% } if (newsList.size() > 2) {%>
                                            <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
                                            <% } %>
                                        </ol>
                                        <!-- Carousel items -->
                                        <div class="carousel-inner">
                                            <div class="active item">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                    	<% if (newsList.size() > 0) {%>
                                                        <div class="profile-circle">
                                                            <img class="opacity-75" src="/resources/img/news.png" alt="">
                                                        </div>
                                                        <div class="testimonial_content rounded">
                                                            <p></p>
                                                            <a href="/4/news/newsDetail.jsp?nno=<%= newsList.get(0).getNno() %>">
                                                            <span><%= newsList.size() > 0 ? newsList.get(0).getNtitle() : ""  %></span>
                                                            </a>
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                    <div class="col-md-6">
                                                    	<% if (newsList.size() > 1)  {%>
                                                        <div class="profile-circle">
                                                            <img class="opacity-75" src="/resources/img/news.png" alt="">
                                                        </div>
                                                        <div class="testimonial_content rounded">
                                                            <p></p>
                                                            <a href="/4/news/newsDetail.jsp?nno=<%= newsList.get(1).getNno() %>">
                                                            <span><%= newsList.size() > 1 ? newsList.get(1).getNtitle() : ""  %></span>
                                                            </a>
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--End of item with active-->
                                            <% if (newsList.size() > 2)  {%>
                                            <div class="item">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                    	<% if (newsList.size() > 2)  {%>
                                                            <img class="opacity-75" src="/resources/img/news.png" alt="">
                                                        </div>
                                                        <div class="testimonial_content rounded">
                                                            <p></p>
                                                            <a href="/4/news/newsDetail.jsp?nno=<%= newsList.get(2).getNno() %>">
                                                            <span><%= newsList.size() > 2 ? newsList.get(2).getNtitle() : "" %></span>
                                                            </a>
                                                        <% } %>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                    	<% if (newsList.size() > 3)  {%>
                                                            <img class="opacity-75" src="/resources/img/news.png" alt="">
                                                        </div>
                                                        <div class="testimonial_content rounded">
                                                            <p></p>
                                                            <a href="/4/news/newsDetail.jsp?nno=<%= newsList.get(3).getNno() %>">
                                                            <span><%= newsList.size() > 3 ? newsList.get(3).getNtitle() : "" %></span>
                                                            </a>
                                                        <% } %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                            <!--ENd of item-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End of row-->
                        </div>
                        <!--End of container-->
                    </section>
                    <!--End of carousel-->
                </div>
            </div>
            <!--End of container-->
        </section>
        <!--end of testimonial-->
            



        <!--Scroll to top-->
        <a href="#" id="back-to-top" title="Back to top">&uarr;</a>
        <!--End of Scroll to top-->
	
		<%@ include file="/include/footer.jsp" %>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
		<script src="/resources/js/jquery-1.12.3.min.js"></script>
		
		<!--Counter UP Waypoint-->
		<script src="/resources/js/waypoints.min.js"></script>
		<!--Counter UP-->
		<script src="/resources/js/jquery.counterup.min.js"></script>
		
		<script>
		    //for counter up
		    $('.counter').counterUp({
		        delay: 10,
		        time: 1000
		    });
		</script>
		
		<!--Isotope-->
		<script src="/resources/js/isotope/min/scripts-min.js"></script>
		<script src="/resources/js/isotope/cells-by-row.js"></script>
		<script src="/resources/js/isotope/isotope.pkgd.min.js"></script>
		<script src="/resources/js/isotope/packery-mode.pkgd.min.js"></script>
		<script src="/resources/js/isotope/scripts.js"></script>
		
		
		<!--Back To Top-->
		<script src="/resources/js/backtotop.js"></script>
		
		
		<!--JQuery Click to Scroll down with Menu-->
		<script src="/resources/js/jquery.localScroll.min.js"></script>
		<script src="/resources/js/jquery.scrollTo.min.js"></script>
		<!--WOW With Animation-->
		<script src="/resources/js/wow.min.js"></script>
		<!--WOW Activated-->
		<script>
		    new WOW().init();
		</script>
		
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="/resources/js/bootstrap.min.js"></script>
		<!-- Custom JavaScript-->
		<script src="/resources/js/main.js"></script>
		
    </body>

</html>