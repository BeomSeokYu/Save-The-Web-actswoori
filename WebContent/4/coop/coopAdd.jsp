<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>
 <%@include file="/include/header.jsp" %>
  </head>
  <body>
<%@include file="/include/navbar.jsp" %>
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 <section class="py-5 text-center container"></section>
 <%@include file="/include/navbar.jsp" %>
  <div class = "container">
  <h1>협력 기관 소식 글 작성</h1><br>
<form action = "coopAddCheck.jsp" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" class="form-control" name="ctitle" id="exampleFormControlInput1">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label" >내용</label>
  <textarea class="form-control" name = "ccontent"  id="summernote" rows="3"></textarea>
</div>
<input type="hidden" name="email" value="<%=sid%>">
<button style="float:right; type="submit" class="btn btn-primary">등록</button>
</form>
<button onclick="location.href='coopList.jsp'" class="btn btn-primary">목록으로</button>
</div>

    <script>
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