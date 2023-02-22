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
    
    <%@ include file="/include/navbar.jsp" %>
        <!--Start of slider section-->
        <section id="slider">
            <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel" data-interval="3000">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="/resources/img/img1.jpg" alt="..." style="width: 100%; object-fit: cover;">
                    </div>
                    <!--End of item With Active-->
                    <div class="item">
                        <img src="/resources/img/img2.jpg" alt="...">
                        <div class="carousel-caption">
                            <div class="slider_text">
                                <h3>Protect</h3>
                                <h2>nature the environment</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                    </div>
                    <!--End of Item-->
                    <div class="item">
                        <img src="/resources/img/img3.jpg" alt="...">
                        <div class="carousel-caption">
                            <div class="slider_text">
                                <h3>Protect</h3>
                                <h2>nature the environment</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
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
                            <h2>welcome to green fair</h2>
                            <p>Our Green Fire Organization is one of the non profit organization near you. Get our services like</p>
                        </div>
                    </div>
                </div>
                <!--End of row-->
            </div>
            <!--End of container-->
        </section>
        <!--end of welcome section-->



        <!--Start of testimonial-->
        <section id="testimonial">
            <div class="testimonial_overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="testimonial_header text-center">
                                <h2>testimonials</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
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
                                            <li data-target="#fade-quote-carousel" data-slide-to="0" class="active"></li>
                                            <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
                                        </ol>
                                        <!-- Carousel items -->
                                        <div class="carousel-inner">
                                            <div class="active item">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                            <img src="img/tree_cut_3.jpg" alt="">
                                                        </div>
                                                        <div class="testimonial_content">
                                                            <i class="fa fa-quote-left"></i>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos eaque molestias odio aut eius animi. Impedit temporibus nisi accusamus.</p>
                                                        </div>
                                                        <div class="testimonial_author">
                                                            <h5>Sadequr Rahman Sojib</h5>
                                                            <p>CEO, Fourder</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                            <img src="img/tree_cut_3.jpg" alt="">
                                                        </div>
                                                        <div class="testimonial_content">
                                                            <i class="fa fa-quote-left"></i>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos eaque molestias odio aut eius animi. Impedit temporibus nisi accusamus.</p>
                                                        </div>
                                                        <div class="testimonial_author">
                                                            <h5>Sadequr Rahman Sojib</h5>
                                                            <p>CEO, Fourder</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--End of item with active-->
                                            <div class="item">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                            <img src="img/tree_cut_3.jpg" alt="">
                                                        </div>
                                                        <div class="testimonial_content">
                                                            <i class="fa fa-quote-left"></i>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos eaque molestias odio aut eius animi. Impedit temporibus nisi accusamus.</p>
                                                        </div>
                                                        <div class="testimonial_author">
                                                            <h5>Sadequr Rahman Sojib</h5>
                                                            <p>CEO, Fourder</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="profile-circle">
                                                            <img src="img/tree_cut_3.jpg" alt="">
                                                        </div>
                                                        <div class="testimonial_content">
                                                            <i class="fa fa-quote-left"></i>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem, veritatis nulla eum laudantium totam tempore optio doloremque laboriosam quas, quos eaque molestias odio aut eius animi. Impedit temporibus nisi accusamus.</p>
                                                        </div>
                                                        <div class="testimonial_author">
                                                            <h5>Sadequr Rahman Sojib</h5>
                                                            <p>CEO, Fourder</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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