<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid");

	String admin = "admin@gmail.com";

	if(sid != null) {
		session.setAttribute("sid", sid);
	}
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>행전우리교회</title>
	
	<!-- 우리꺼 -->
	<!-- viewport (모바일) -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- bootstrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- bootstrap icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	
	<!-- css -->
	<link href="/resources/css/common.css" rel="stylesheet">
		
		
    <!--    Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!--Fontawesom-->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">

    <!--Animated CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">

    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!--Bootstrap Carousel-->
    <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />

    <link rel="stylesheet" href="/resources/css/isotope/style.css">

    <!--Main Stylesheet-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!--Responsive Framework-->
    <link href="/resources/css/responsive.css" rel="stylesheet">
</head>
