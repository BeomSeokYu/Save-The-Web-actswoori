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
<style>

.iframe {
	display: block;
	border: none;
	margin: auto;
	height: 80vh;
	width: 80%;
	overflow:hidden;
	frameborder:0;
	scrolling: no;
}
</style>
<%@ include file="/include/header.jsp" %> 
</head>

<body>
<%@ include file="/include/navbar.jsp" %>
<%
	if(sid == null || !sid.equals(admin)) {
		response.sendRedirect("postList.jsp");
	}
	
	int pno = Integer.parseInt(request.getParameter("pno"));

	PostDTO pdto = PostDAO.selectPost(pno);
	String filePath = pdto.getPupfolder() + "/" + pdto.getPuuid() + "_" + pdto.getPfilename(); %>
 
<div class="container">
<form action="postEditCheck.jsp" name=f1 method=post enctype="multipart/form-data">
	제목 : <input type="text" name="ptitle" value="<%=pdto.getPtitle() %>"><br>
    <div style="clear:both">
       <iframe id="viewer" class="iframe" src="<%=filePath %>" frameborder="0" scrolling="no" width="300" height="200"></iframe>
    </div>
	
	<input type="hidden" name="pno" value="<%=pno%>">
    <input id="uploadPDF" type="file" name="post" onchange="PreviewImage();" />&nbsp;<br>
    
	<div>
	    <button type="submit" name="submit" class="btn btn-success btn-sm">
	      <i class="fa fa-dot-circle-o"></i>수정
	    </button>&emsp;
		<a href="postView.jsp?pno=<%=pno%>">취소</a>
	</div>
    
	
</form>
</div>


 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
function PreviewImage() {
    pdffile=document.getElementById("uploadPDF").files[0];
    pdffile_url=URL.createObjectURL(pdffile);
    $('#viewer').attr('src',pdffile_url);
}
</script>

<%@ include file="/include/footer.jsp" %> 

</body>
</html>