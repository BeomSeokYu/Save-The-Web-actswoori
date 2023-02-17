<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<%
	String lno = request.getParameter("lno");
	int lnoo = Integer.parseInt(lno);
	LectureDTO lecture = LectureDAO.getDetail(lnoo);
	out.println(lecture.getLtitle());

%>

<!-- 썸머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div></div>

<form action="lectureModifyCheck.jsp?lno=<%=lno%>" method="post">
<div class = "container">
<div class="form-floating">
      <input type="text" name = "ltitle" class="form-control" id="ltitle" value="<%= lecture.getLtitle() %>">
      <label for="floatingInput">제목</label>
</div>
<div class="form-floating">
      <input type="text" name = "lname" class="form-control" id="lname" value=" <%=lecture.getLname() %>">
      <label for="floatingPassword">설교자</label>
</div>
<textarea name = "lcontent" id = "summernote" class="mtop-10"><%=lecture.getLcontent()%></textarea>
<button class="btn btn-primary" type="submit">수정</button>
<button onclick="location.href='/2/lecture/lectureMain.jsp'" class="btn btn-warning">취소</button>
</div>
</form> 
 

<!-- 썸머노트 스크립트 -->
<script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
</script>

<%@ include file="/include/footer.jsp" %>
</body>
</html>