<%@page import="jdbc.GalleryDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

File uploadFile = new File(uploadPath, uuid + "_" + savePath);
if(!uploadFile.exists()){
	upDelResult = uploadFile.delete();
}
File saveDir = new File(savePath);
if(!saveDir.exists()){
	saveDelResult = saveDir.delete();
}

dbDelResult = GalleryDAO.delete(gno);

if (upDelResult && saveDelResult && dbDelResult) {	
	out.println("success");
} else {
	out.println("fail");
}
%>