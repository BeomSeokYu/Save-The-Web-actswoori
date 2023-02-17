<%@page import="jdbc.PostDAO"%>
<%@page import="jdbc.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<body>
<%@ include file="/include/header.jsp" %> 
<%
	ArrayList<PostDTO> posts = PostDAO.selectAllPostList();

%>

	<div class="container">
		<div>
			<canvas id="the-canvas" style="border:1px solid black"></canvas>
		</div>
		
	</div>
  
  <!-- Use latest PDF.js build from Github -->
  <script type="text/javascript" src="http://polishwords.com.pl/dev/pdfjs/pdf.js"></script>
  
  <script type="text/javascript">
		//   $("input[name=itemChk]:checked").each(function() {
		//          $("#item").append("<div class='col-xs-4'></div>"); // 태그 추가
		//     });
	function addCanvas(pno) {
		var str = '<div><canvas id="the-canvas' + pno
				+ '" style="border:1px solid black"></canvas></div>';
		$('.container').append(str);
	}

	function showPDF(path, pno) {
		var url = path;
	
	    // Disable workers to avoid yet another cross-origin issue (workers need the URL of
	    // the script to be loaded, and dynamically loading a cross-origin script does
	    // not work)
	    PDFJS.disableWorker = true;
	
	    // Asynchronous download PDF as an ArrayBuffer
	    PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
	
	      // Fetch the first page
	      pdf.getPage(1).then(function getPageHelloWorld(page) {
	        var scale = 1;
	        var viewport = page.getViewport(scale);
	
	        // Prepare canvas using PDF page dimensions
	        var canvas = document.getElementById('the-canvas'+pno);
	        var context = canvas.getContext('2d');
	        canvas.height = viewport.height;
	        canvas.width = viewport.width;
	
	        // Render PDF page into canvas context
	        page.render({canvasContext: context, viewport: viewport});
	      });
	    });
	    
	}	// end function showPDF()
	addCanvas(1);
	showPDF('\resources\postSaved/1aff899e-3179-453b-8ac7-7bd84cb11276_주보.pdf',1);
	addCanvas(2);
	showPDF('https://mozilla.github.io/pdf.js/web/compressed.tracemonkey-pldi-09.pdf',1);

	</script>
<%
	for (PostDTO post : posts) {
		String savePath = application.getRealPath(post.getPupfolder());
		String path = savePath + "/" + post.getPuuid() + "_" + post.getPfilename();
		out.print(path);
%>
	<script type="text/javascript">
		addCanvas(<%=post.getPno()%>);
		showPDF(path, <%=post.getPno()%>);
	</script>
	
<%		
	}
%>

<%@ include file="/include/footer.jsp" %> 
</body>
</html>
