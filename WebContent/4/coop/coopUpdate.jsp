<%@page import="jdbc.coopDTO"%>
<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>	
<head>
<%@include file="/include/header.jsp" %>
</head>
	<%	//로그인 안되어있을 시
		if(sid == null || sid.equals(admin)){
		response.sendRedirect("/login.jsp");
		}else{
		
	%>
<body>
<%-- <% UserDTO udto = UserDAO.select(sid){%> --%>

 <% int cno = Integer.parseInt(request.getParameter("cno"));
 	coopDAO cdao = new coopDAO();
 	coopDTO cdto = cdao.select(cno); %> 
 	
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 <section class="py-5 text-center container"></section>
    
  <div class = "container">
  <h1>협력 기관 소식 글 수정</h1><br>
<form action = "coopUpdateCheck.jsp" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" class="form-control" name="ctitle" id="exampleFormControlInput1" value="<%=cdto.getCtitle()%>">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label" >내용</label>
  <textarea class="form-control" name = "ccontent"  id="summernote" rows="3"></textarea>
</div>
<input type="hidden" name="cno" value="<%=cdto.getCno()%>">
<button style="float:right; type="submit" class="btn btn-primary">수정하기</button>
</form>
<button onclick="location.href='coopList.jsp'" class="btn btn-primary">목록으로</button>
</div>

    <script>
     $('#summernote').val('<%= cdto.getCcontent() %>'); 
      $('#summernote').summernote({
        placeholder:'',
        tabsize: 2,
        height: 300
        
      });
    </script>
     <section class="py-5 text-center container"></section>
  </body>
 <%@include file="/include/footer.jsp" %>
</html>
<% }; %>