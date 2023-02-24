<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/16)
       1.0(1차 완성 23/02/16)
--> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>행전우리교회</title>
<meta charset="UTF-8">
<%@ include file="/include/header.jsp" %>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("postList.jsp");
		return;
	}
%>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>
<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>주보 등록</h2>
				<div class="col-3 d-none d-lg-block">
					<%@ include file="/include/sidebar4.jsp"%>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-3 text-muted"></div>
						<div class="col-9 text-end"></div>
					</div>

<form action="postAddCheck.jsp" name=f1 method=post enctype="multipart/form-data" id="form">
	<div class="input-group mb-2 input-group-lg">
		<span class="input-group-text col-2 justify-content-center">제목</span> 
		<input type="text" class="form-control col-10" placeholder="제목을 입력하세요" name="ptitle" id="ptitle">
	</div>

    <input id="uploadPDF" type="file" name="post" onchange="PreviewImage();" class="form-control col-11" accept=".pdf"/>&nbsp;<br>
    
    <div class="d-flex justify-content-end my-4">
		<button class="btn btn-outline-primary mx-2" type="button" onclick="gogo()">등록</button>
		<input type="button" value="취소" onclick="history.back()"
			class="btn btn-outline-secondary mx-2">
	</div>
    
    
    <div style="clear:both">
       <iframe id="viewer" frameborder="0" scrolling="no" width="300" height="200"></iframe>
    </div>
</form>
</div></div></div></div>


 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
function PreviewImage() {
    pdffile=document.getElementById("uploadPDF").files[0];
    pdffile_url=URL.createObjectURL(pdffile);
    $('#viewer').attr('src',pdffile_url);
}

function gogo(){
	var title = $('#ptitle').val().trim()
	
	if(title=='' ) {
		alert('제목을 입력해주세요')
	} else {
		$('#form').submit()
	}
}

</script>

<%@ include file="/include/footer.jsp" %>   
</body>
</html>