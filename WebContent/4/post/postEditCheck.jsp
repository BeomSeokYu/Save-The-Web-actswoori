<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/17) 
       0.5(기본작업 23/02/18) 
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
</head>
<body>
<%@ include file="/include/header.jsp" %> 
<%	
	
	request.setCharacterEncoding("UTF-8");
	String sid = (String) session.getAttribute("sid");
	if(sid == null || !sid.equals("admin")) {
		response.sendRedirect("postList.jsp");
	}
	
	String uploadPDF = request.getParameter("uploadPDF");
	
	String uploadPath = "/resources/postSaved";
	String savePath = application.getRealPath(uploadPath);
	
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
	
	if(postOriName != null) {
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
        int pno = Integer.parseInt( multiReq.getParameter("pno") );
		String ptitle = multiReq.getParameter("ptitle");
        boolean result = PostDAO.updatePost(pno, ptitle, uploadPath, uuid.toString(), postSysName);
		
		if(result) {
        %>
		 <script>
		 	$(function() {
		 		popModalRedirect('주보 수정', '주보가 수정되었습니다.', 'postList.jsp');
		 	});
		 </script>
		 <%
			
		} else {
		%>
		<script>
			$(function() {
				popModalRedirect('주보 수정', '알 수 없는 이유로 수정하지 못했습니다.', 'postList.jsp?pno=' + pno);
			});
		</script>
		<%		
			
		}
        	

	}

	
%>


<%@ include file="/include/footer.jsp" %>   
</body>
</html>