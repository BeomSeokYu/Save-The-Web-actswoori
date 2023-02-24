<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/16)
       1.0(1차 완성 23/02/16)
--> 
<%@page import="jdbc.PostDAO"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
html {
    height: 100%;
    overflow: hidden;
	scroll: no;
}
body {
    min-height: 100%;
}
</style>
<%@ include file="/include/header.jsp" %> 
</head>
<body>
<%
	if(sid == null) { // 보안 처리
		response.sendRedirect("postList.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");

	String uploadPath = "/resources/postSaved"; // application.getInitParameter("uploadPath");
	String savePath = application.getRealPath(uploadPath);
	//out.print(savePath + "<br><br>");
	
   // 업로드 폴더 지정
   File upFolder = new File(savePath);
   System.out.println("upFolder : " + upFolder);
   // 업로드 경로에 해당 폴더가 없는 경우에는 생성
   if (!upFolder.exists()) {
      upFolder.mkdirs();
   }
	   
	int maxSize = 5242880;
	String encType = "UTF-8";
	
	
	MultipartRequest multiReq = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
	
	String postOriName = multiReq.getOriginalFileName("post");
	String postSysName = multiReq.getFilesystemName("post");
	
	boolean result = false;
	if(postOriName != null) {
		//out.print("파일 업로드 성공 <br>");
		
		//out.print("원본 파일 : " + postOriName + "<br>");
		//out.print("첨부 파일 : " + postSysName + "<br>");
		//out.print("파일 크기 : " + multiReq.getFile("post").length() + "<br>");
		
		
         // UUID 설정
         UUID uuid = UUID.randomUUID();
         System.out.println("uuid : " + uuid.toString());
         String uuidFileName = uuid + "_" + postOriName;
         System.out.println("uuidFileName : " + uuidFileName);
      
          // 이름 바꿔 업로드
          File originFile = new File(savePath + "/" + postSysName);
          String originFileName = originFile.getName();
          long fileSize = originFile.length();
          File tempFile = new File(savePath + "/" + uuidFileName);
          
          if(!originFile.renameTo(tempFile)) {
              System.out.println("파일명변경 실패");
          }
          
          // DB에 넣기
		String ptitle = multiReq.getParameter("ptitle");
        String email = (String) session.getAttribute("sid");
        result = PostDAO.insertPost(ptitle, uploadPath, uuid.toString(), postSysName, email);
		
		//out.print("<iframe src=" + uploadPath + "/" + uuidFileName +"></iframe>");
		
        	
		}
	
	if(result) {
       %>
	 <script>
	 	$(function() {
	 		popModal2('등록 성공', '주보 등록에 성공했습니다.', '/4/post/postList.jsp');
	 	});
	 </script>
	 <%
		
	} else {
		%>
		<script>
			$(function() {
				popModal2('등록 오류', '제목 입력과 파일을 선택해 주세요.', '/4/post/postList.jsp');
			});
		</script>
		<%		
		
	}

	
%>


<%@ include file="/include/footer.jsp" %>   
</body>
</html>
<script>history.forward();</script>