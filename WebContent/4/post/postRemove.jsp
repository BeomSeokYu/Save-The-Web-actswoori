<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/16)
       1.0(1차 완성 23/02/16)
       1.3(matadata 파일 삭제 기능 추가 23/02/24)
--> 
<%@page import="jdbc.PostDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>      
<%
	sid = (String) session.getAttribute("sid"); // 보안 처리
	if(sid == null) {
		response.sendRedirect("postList.jsp");
		return;
	}
	
	String pfilename = request.getParameter("pfilename");
	String puuid = request.getParameter("puuid");
	int pno = Integer.parseInt(request.getParameter("pno"));

	// 해당 앱 내 업로드 경로 설정
	String uploadPath = "/resources/postSaved";
	// 실제 업로드 저장 경로 설정
	String savePath = application.getRealPath(uploadPath);

	boolean upDelResult = false;
	boolean saveDelResult = false;
	boolean dbDelResult = false;

	File uploadFile = new File(uploadPath, puuid + "_" + pfilename);
	if(!uploadFile.exists()){
		upDelResult = uploadFile.delete();
	}
	File saveDir = new File(savePath);
	if(!saveDir.exists()){
		saveDelResult = saveDir.delete();
	}

	
	if(PostDAO.deletePost(pno)) {
%>
	<script>
	window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "postList.jsp")}
	</script>
<%	} else {	%>
	<script>
		window.onload = function(){ popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "postView.jsp?pno="+pno)}
	</script>
<%	}	%>
<%@ include file="/include/footer.jsp" %>      

<script>history.forward();</script>