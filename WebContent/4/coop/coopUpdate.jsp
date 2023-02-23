<%@page import="jdbc.coopDTO"%>
<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>	
<head>
</head>
<body>
<%-- <% UserDTO udto = UserDAO.select(sid){%> --%>
<%@include file="/include/header.jsp" %>
<%
	if (sid == null) { // 보안 처리
		response.sendRedirect("coopList.jsp");
		return;
	}

	int cno = Integer.parseInt(request.getParameter("cno"));
 	coopDAO cdao = new coopDAO();
 	coopDTO cdto = cdao.select(cno); %> 
 	
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 <section class="py-5 text-center container"></section>
    
  <div class="container">
	<div class="pt-5"></div>
  	<h2>협력 교회와 기관 소식 수정</h2><hr>
	<form action = "coopUpdateCheck.jsp" method="post">
		<div class="input-group mb-2 input-group-lg">
			<span class="input-group-text col-2 justify-content-center" id="ltitle">제목</span> 
			<input type="text" class="form-control col-10" name="ctitle" id="ltitle"
				value="<%=cdto.getCtitle()%>" required>
		</div>
	
		<div>
			<textarea name="ccontent" id="summernote" class="mtop-10"></textarea>
		</div>
		
		<input type="hidden" name="cno" value="<%=cdto.getCno()%>">
		
		<div class="d-flex justify-content-end my-4">
			<button class="btn btn-outline-primary mx-2" type="submit">수정</button>
			<input type="button" value="취소" onclick="history.back()"
				class="btn btn-outline-secondary mx-2">
		</div>
	</div>

    <script>
     $('#summernote').val('<%=cdto.getCcontent()%>'); 
      $('#summernote').summernote({
        placeholder:'',
        tabsize: 2,
        height: 500
        
      });
    </script>
     <section class="py-5 text-center container"></section>
  </body>
 <%@include file="/include/footer.jsp" %>
</html>
<%-- <%  };  %> --%>