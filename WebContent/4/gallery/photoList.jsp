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
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
	<ul id="imgList">
	</ul>

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
					appendHTML += ''
						+'<li>'
							+'<img src="'+ data[i].gupfolder + '/' +data[i].guuid + '_' + data[i].gfilename +'">'
						+'</li>';
				}
				$('#imgList').append(appendHTML);
			})
}
</script>
</body>
</html>