<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String sid = (String)session.getAttribute("email");%>
<%@include file="../../include/header.jsp" %>

<section class="py-5 text-center container"></section>

<div class="container" style="margin: auto; ">
<h1>협력 기관 소식</h1>
<div style="float:right; margin-bottom:10px">
	<form method="post" name="search" action="searchbbs.jsp">
		<table class="pull-right">
			<tr>
				<td><select class="form-control" name="searchField">
						<option value="0">선택</option>
						<option value="bbsTitle">제목</option>
						<option value="userID">작성자</option>
				</select></td>
				<td><input type="text" class="form-control"
					placeholder="검색어 입력" name="searchText" maxlength="100"></td>
				<td><button type="submit" class="btn btn-success">검색</button></td>
			</tr>
		</table>
	</form>
</div>
<br>
 <table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">no</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  <tbody>
<%
		ArrayList<coopDTO> coops = coopDAO.getList();
		
		for(coopDTO coop : coops){	
%>
	<tr>
      <th scope="row"><%=coop.getCno() %></th>
      <td><%=coop.getCtitle() %></td>
      <td><%=sid %></td>
      <td><%=coop.getCdate() %></td>
    </tr>

<%			
	}
%>

  </tbody>
</table>
<button onclick="location.href='coopAdd.jsp'" class="btn btn-success" style="float:right;">글 등록하기</button>
</div>
<%@include file="../../include/footer.jsp" %>
</body>
</html>