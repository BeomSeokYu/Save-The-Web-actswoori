<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@page import="org.apache.commons.fileupload.DefaultFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="jdbc.GalleryDAO"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
%>
<%
	
	// 해당 앱 내 업로드 경로 설정
	String uploadPath = "/resources/gallery";
	// 실제 업로드 저장 경로 설정
	String savePath = application.getRealPath(uploadPath);
	
	File uploadDir = new File(uploadPath);
	if(!uploadDir.exists()){
		uploadDir.mkdirs();
	}
	File saveDir = new File(savePath);
	if(!saveDir.exists()){
		saveDir.mkdirs();
	}
	
	int maxSize=50*1024*1024; //50M byte제한
	//업로드 객체를 생성해주는 팩토리 객체 : 주로 설정을 담당(서버의 저장경로, 파일의용량제한..)
	DefaultFileItemFactory itemFactory = new DefaultFileItemFactory();
	itemFactory.setRepository(new File(savePath));//저장될 위치!!!, 물리적인 저장이 아닌, 임시디렉토리
	itemFactory.setSizeThreshold(maxSize); //용량을 지정한 크기로 제한
	
	//이 객체가 실제 업로드를 수행함
	ServletFileUpload upload = new ServletFileUpload(itemFactory);//설정정보를 생성자의 인수로 전달!!!
	
	//FileItem 은 클라이언트의 전송 정보 하나 하나를 의미한다. 즉 html에서의 input 텍스트박스, file 컴포넌트 들..
	//우리의 경우 input type="text" 가 FileItem에 담기고 
	//우리의 경우 input type="file" 가 FileItem에 담기고
	upload.setHeaderEncoding("UTF-8");
	List<FileItem> items = upload.parseRequest(request); //업로드 컴포넌트에게 클라이언트의 요청 정보를 전달한다!!!
	
	String title = "";
	for(FileItem item : items){
		//반복문으로 처리되다보니, 파일만 따로 처리를 하려면, 구분로직이 필요함..
		if(item.isFormField()) {
			title = item.getString("UTF-8");
			out.print("제목: "+title+"<br>");
		} else { //텍스트박스가 아닌것만 업로드 처리!! FormField는 text박스만 의미함
			//업로드 처리하자!! 메모리상의 이미지 정보를 실제 물리적 파일로 저장하자!!
			//새롭게  생성할 파일명
			out.print("당신이 업로드한 파일의 원래 이름은 "+item.getName());
			
			// UUID 설정
			UUID uuid = UUID.randomUUID();
			String uuidFileName = uuid + "_" + item.getName();
			System.out.println("uuidFileName : " + uuidFileName);
		
			//String ext = FileManager.getExtend(item.getName());//확장자 구하기
			//String filename = System.currentTimeMillis()+"."+ext;
			
			File file =new File(savePath+"/"+uuidFileName);//비어있는 파일
			item.write(file); //저장 정보를 File 클래스의 인스턴스로 전달!!
			
			// DB에 넣기
		    GalleryDAO.insert(title, uploadPath, item.getName(), uuid.toString(), "최현식");
			
			out.print("원래 파일명: "+item.getName()+"<br>");
			out.print("생성된 파일명: "+uuidFileName+"<br>");
			out.print("저장된 위치: "+savePath+"<br>");
			out.print("업로드 파일크기: "+item.getSize()+" bytes  <br>");
		}
	}
	title = "";
	
	response.sendRedirect("/4/gallery/photoList.jsp");
%>
<script>history.forward();</script>