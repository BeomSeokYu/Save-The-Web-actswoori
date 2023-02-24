<%@page import="jdbc.GalleryDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sid = (String) session.getAttribute("sid"); // 보안 처리
if (sid == null) {
	response.sendRedirect("photoList.jsp");
	return;
}

String filename = request.getParameter("gfilename");
String uuid = request.getParameter("guuid");
int gno = Integer.parseInt(request.getParameter("gno"));

// 해당 앱 내 업로드 경로 설정
String uploadPath = "/resources/gallery";
// 실제 업로드 저장 경로 설정
String savePath = application.getRealPath(uploadPath);

boolean upDelResult = false;
boolean saveDelResult = false;
boolean dbDelResult = false;

File uploadFile = new File(uploadPath, uuid + "_" + filename);
if(!uploadFile.exists()){
	upDelResult = uploadFile.delete();
}
File saveDir = new File(savePath);
if(!saveDir.exists()){
	saveDelResult = saveDir.delete();
}

dbDelResult = GalleryDAO.delete(gno);

if (upDelResult && saveDelResult && dbDelResult) {	
%>
	<script>
	window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "photoList.jsp")}
	</script>
<%	} else {	%>
	<script>
		window.onload = function(){ popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "photoList.jsp")}
	</script>
<%	}	%>

<script>
function popModal2(head, body, url) {
    $('#msgModalLabel').text(head);
    $('#msgModalBody').html(body);
    $('#modal-footer').empty()
       .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="location.href=\'' + url + '\'">확인</button>')
    $('#msgModal').modal('show');
 }
</script>
<script>history.forward();</script>