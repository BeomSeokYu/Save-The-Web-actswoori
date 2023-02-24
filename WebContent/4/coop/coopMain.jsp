<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<%@include file="/include/header.jsp" %>
<title>Slick</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script>
      $( document ).ready( function() {
        $( '.slider' ).slick( {
          autoplay: true,
          autoplaySpeed: 4000,
          slidesToShow: 3,
          slidesToScroll: 1,
        } );
      } );
    </script>
    <style>
      .slider {
        width: 600px;
        margin: 0px auto;
      }
      .slider .slick-slide {
        margin: 10px;
      }
      .slick-prev:before, .slick-next:before {
        color: #F2F2F2;
      }
      .my-box { 
      border:1px solid; 
      width: 150px;
      height: 130px;
  	  padding: 20px;
	  display:block;
	  text-align: center;
	  align-items: center; }
	  
	 
    </style>
  </head>
<body> 
 <%@include file="/include/navbar.jsp" %> 
    <section class="py-5 text-center container"></section>

	<div class="container" style="margin: auto;">
		<h1>협력 교회</h1>
	</div>
	 <div class="container" style="font-size:14px;">
	 <div class="slider">
	<div class="my-box">예건교회</div>
	<div class="my-box">예건교회</div>
	<div class="my-box">예건교회</div>
	<div class="my-box">예건교회</div>
	<div class="my-box">예건교회</div>
	<div class="my-box">예건교회</div>
	</div>
	</div>
	<div class="container" style="margin: auto;">
	<a href="coopList.jsp" style="font-weight:bold; color:orange;font-size:25px">협력 기관 소식</a>
	</div>
    


    <div class="container" style="font-size:14px;">
    <div class="slider">
<%
		ArrayList<coopDTO> coops = coopDAO.getList();
		
		for(coopDTO coop : coops){	
%>

      <div class="my-box"><a href="coopInfo.jsp?cno=<%=coop.getCno() %>"><%=coop.getCtitle() %></a></div>
<%			
		}
%>
    </div>
   </div>
   <section class="py-5 text-center container"></section>
<%@include file="/include/footer.jsp" %>
  </body>
</html>