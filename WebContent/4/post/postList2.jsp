<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.228/pdf.min.js"></script>
<style type="text/css">

#pdf-main-container {
	width: 400px;
	margin: 20px auto;
}

.pdf-canvas {
	display: block;
	border: 1px solid rgba(0,0,0,0.2);
	box-sizing: border-box;
}

</style>
</head>

<body>
<%@ include file="/include/header.jsp" %> 
<!--
	v	태그 id -> class로 변경
		출력 div에 값 넣는 대신 요소 추가하는 걸로 수정
		ajax는 나중에
 --> 
<% ArrayList<PostDTO> postlist = PostDAO.selectAllPostList();
	String filePath = postlist.get(4).getPupfolder() + "/" + postlist.get(4).getPuuid() + "_" + postlist.get(4).getPfilename(); %>

<div id="pdf-main-container">
	<div class="pdfDiv">
		<h3>제목 written by 작성자 </h3>
		<canvas class="pdf-canvas" width="400"></canvas>
	</div>
</div>

<script>

var _PDF_DOC,
    _PAGE_RENDERING_IN_PROGRESS = 0,
    pno = '0',
    jqCANVAS = $('pdfDiv'+pno).find('canvas');
    _CANVAS = document.querySelector('pdfDiv'+pno).find('canvas'); //('.pdf-canvas'),
    _MAIN_CONTAINER = document.querySelector('#pdf-main-container');

// initialize and load the PDF
async function showPDF(pdf_url, pno) {
    // get handle of pdf document
    try {
        _PDF_DOC = await pdfjsLib.getDocument({ url: pdf_url });
    }
    catch(error) {
        alert(error.message);
    }
    
    // show the first page
    showPage();
}

// load and render specific page of the PDF
async function showPage() {
    _PAGE_RENDERING_IN_PROGRESS = 1;

    // get handle of page
    try {
        var page = await _PDF_DOC.getPage(1);
    }
    catch(error) {
        alert(error.message);
    }

    // original width of the pdf page at scale 1
    var pdf_original_width = page.getViewport(1).width;
    
    // as the canvas is of a fixed width we need to adjust the scale of the viewport where page is rendered
    var scale_required = jqCANVAS.width / pdf_original_width;

    // get viewport to render the page at required scale
    var viewport = page.getViewport(scale_required);

    // set canvas height same as viewport height
    jqCANVAS.height = viewport.height;

    // page is rendered on <canvas> element
    var render_context = {
        canvasContext: jqCANVAS.getContext('2d'),
        viewport: viewport
    };
        
    // render the page contents in the canvas
    try {
        await page.render(render_context);
    }
    catch(error) {
        alert(error.message);
    }

    _PAGE_RENDERING_IN_PROGRESS = 0;

}



// canvas 생성
async function addCanvas(pno, ptitle) {
	pno = pno;
	var str = '<div class="pdfDiv' + pno + '"><h3>' + ptitle + '</h3>' +
		'	<canvas width="400" class="pdf-canvas"></canvas></div>' +
	_MAIN_CONTAINER.insertAdjacentHTML('beforeend', str);
	
	// "Show PDF"
	showPDF('<%=filePath %>');		
}
addCanvas('4', '<%=postlist.get(4).getPtitle() %>');
</script>

<%@ include file="/include/footer.jsp" %> 
</body>
</html>