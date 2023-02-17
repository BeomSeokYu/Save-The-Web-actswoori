<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
<!-- Add jQuery lightBox plugin stylesheet in the <head>. This styles the lightbox itself, not your gallery thumbnails. -->
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox.css" media="screen" />
<style type="text/css">
	/* jQuery lightBox plugin - Gallery thumbnails styles */
	* {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}
	#lightbox-container-image-data-box,
	.gallery img {
		/* Revert to default box-sizing for the data-box and the images */
		-webkit-box-sizing: content-box;
		-moz-box-sizing: content-box;
		box-sizing: content-box;
	}
	.gallery {
		background-color: #DDDDDD;
		padding: 30px;
		width: 100%;
	}
	.gallery ul {
		list-style: none;
		padding: 0;
		margin: 0;
	}
	.gallery ul li { display: inline; }
	.gallery ul img {
		border-style: solid;
		border-color: #444;
		border-width: 5px 5px 20px;
	}
	.gallery ul a {
		text-decoration: none;
	}
	.gallery ul a:hover img {
		border-color: #fff;
		color: #fff;
	}
	.gallery ul a:hover { color: #fff; }
	.columns:before,
	.columns:after {
		content: " ";
		display: table;
	}
	.columns:after {
		clear: both;
	}
	.columns {
		*zoom: 1;
		margin-left: -15px;
		margin-right: -15px;
	}
	.column {
		width: 50%;
		float: left;
		position: relative;
		padding-left: 15px;
		padding-right: 15px;
	}
</style>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<div id="gallery1" class="gallery">
		<ul id="imgList">
		</ul>
	</div><!-- /gallery1 -->
<%@ include file="/include/footer.jsp" %>
<script>
getFeedList();

function getFeedList() {
	fetch('/4/gallery/photoAllProc.jsp')
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				var appendHTML = '';
				for ( var i = 0; i < data.length; i++) {
					var img = data[i].gupfolder + '/' +data[i].guuid + '_' + data[i].gfilename;
					appendHTML += ''
						+'<li class="mx-3">'
							+'<a href="'+ img +'" title="Use the flexibility of jQuery and create a group of images as desired. $("#gallery").lightBox();" rel="lightbox[gallery1]">'
							+'<img src="'+ img +'" width="100" height="100" alt="" />'
						+'</a></li>';
				}	
				$('#imgList').append(appendHTML);
			})
}
</script>
</body>
</html>