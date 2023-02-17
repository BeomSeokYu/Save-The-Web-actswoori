<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<div class="container">
<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일자</th>
    </tr>
  </thead>
  <tbody>
  
  <% 
  List<NewsDTO> newsList = NewsDAO.selectAllNews();
  
  for(NewsDTO news : newsList) {
	  %>
	 <tr>
      <th scope="row"><a href="newsDetail.jsp?nno=<%= news.getNno() %>"><%= news.getNtitle() %></a></th>
      <td><%= news.getEmail() %></td>
      <td><%= news.getNdate() %></td>
    </tr>
	  
	  <%
	}
  %>

  </tbody>
</table>

<a href="insertForm.jsp" class="btn btn-primary"> 등록하기 </a>

</div>

<%@ include file="/include/footer.jsp" %>


<script>

$(function(){
	const urlParams = new URL(location.href).searchParams;
	const msg = urlParams.get('msg');

	if (msg == "insertSuccess") {
		popModal("등록 성공", "등록에 성공하였습니다.")
	} else if (msg == "deleteSuccess") {
		popModal("삭제 성공", "삭제에 성공하였습니다.")
	}
});

</script>
</body>
</html>