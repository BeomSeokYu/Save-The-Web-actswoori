<%@page import="jdbc.GalleryDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8");

String sid = (String) session.getAttribute("sid"); // 보안 처리
if (sid == null) {
	response.sendRedirect("photoList.jsp");
	return;
}

String filename = request.getParameter("gfilename");
String uuid = request.getParameter("guuid");
int gno = Integer.parseInt(request.getParameter("gno"));
System.out.println(filename);
System.out.println(uuid);
System.out.println(gno);

/* 
// 해당 앱 내 업로드 경로 설정
String uploadPath = "/resources/gallery";
// 실제 업로드 저장 경로 설정
String savePath = application.getRealPath(uploadPath);
 */
 
//카페24용 업로드 설정
// 해당 앱 내 업로드 경로 설정
String uploadPath = "/upload/gallery";
// 실제 업로드 저장 경로 설정
String savePath = "/actschurch/tomcat/webapps" + uploadPath;


boolean upDelResult = false;
boolean saveDelResult = false;
boolean dbDelResult = false;

// 파일 삭제 처리
File uploadFile = new File(uploadPath, uuid + "_" + filename);
System.out.println(uploadFile.getAbsolutePath());
if(uploadFile.exists()){
	upDelResult = uploadFile.delete();
}
File saveDir = new File(savePath, uuid + "_" + filename);
System.out.println(saveDir.getAbsolutePath());
if(saveDir.exists()){
	saveDelResult = saveDir.delete();
}

// db 삭제 처리
if (GalleryDAO.delete(gno)) {	
	out.print("success");
} else {
	out.print("fail");
}
%>