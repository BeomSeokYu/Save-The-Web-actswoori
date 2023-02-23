<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/17) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
--> 
<%@page import="jdbc.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.PostDTO, java.util.ArrayList, jdbc.PostDAO"  %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< Updated upstream
=======
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %> 
>>>>>>> Stashed changes
<style>
.the-canvas {
  border: 1px solid black;
  direction: ltr;
  width:30vw;
}
.postDiv {
	width:30vw;
	
}
</style>
<%@ include file="/include/header.jsp" %> 
</head>

<body>
<%@ include file="/include/navbar.jsp" %>
<script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>
<%
	ArrayList<PostDTO> posts = PostDAO.selectAllPostList();
//session.setAttribute("sid", "admin");

	if(sid != null && sid.equals("admin@gmail.com")) {
%>	
	<a href="postAdd.jsp">등록</a>
<% 	} %>
	<div class="container postListDiv">
		
	</div>
	


<script type="text/javascript">
function addCanvas(pno, ptitle) {
	var str = '<div class="postDiv">'
			+	 '<a href="postView.jsp?pno=' + pno + '"><div>' + ptitle 
			+ 	'</div>'
			+ 	'<canvas id="the-canvas' + pno
			+ 	'" style="border:1px solid black" class="the-canvas"></canvas>'
			+ 	'</a>'
			+ '</div>'
			+ '<hr>';
	$('.postListDiv').append(str);
}

function showPDF(path, pno) {
	//If absolute URL from the remote server is provided, configure the CORS
	//header on that server.
	var url = path;
	
	//Loaded via <script> tag, create shortcut to access PDF.js exports.
	var pdfjsLib = window['pdfjs-dist/build/pdf'];
	
	//The workerSrc property shall be specified.
	pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';
	
	//Asynchronous download of PDF
	var loadingTask = pdfjsLib.getDocument(url);
	loadingTask.promise.then(function(pdf) {
	
	// Fetch the first page
	var pageNumber = 1;
	pdf.getPage(pageNumber).then(function(page) {
	 
	 var scale = 1.5;
	 var viewport = page.getViewport({scale: scale});
	
	 // Prepare canvas using PDF page dimensions
	 var canvas = document.getElementById('the-canvas'+pno);
	 var context = canvas.getContext('2d');
	 canvas.height = viewport.height;
	 canvas.width = viewport.width;
	
	 // Render PDF page into canvas context
	 var renderContext = {
	   canvasContext: context,
	   viewport: viewport
	 };
	 var renderTask = page.render(renderContext);
	 renderTask.promise.then(function () {
	 });
	});
	}, function (reason) {
	// PDF loading error
	console.error(reason);
	});
}
</script>

<%
	for (PostDTO post : posts) {
		String path = post.getPupfolder() + "/" + post.getPuuid() + "_" + post.getPfilename();
		
%>
	<script type="text/javascript">
		addCanvas(<%=post.getPno()%>, '<%=post.getPtitle()%>');
		showPDF('<%=path%>', <%=post.getPno()%>);
	</script>
	
<%		
	}
%>

<%@ include file="/include/footer.jsp" %> 
</body>
</html>