<%@page import="page.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>

<% 
	
	//나중에 user 받아오고
	//if (UserDAO.login(id, password) == 1) {
		
	//}
	//String adminLoginCheck = session.getAttribute("sid");
	String adminLoginCheck = "a";
	
	if (adminLoginCheck != null){%>
		<style>
			.adminAdd{
				visibility: hidden;
			}
		</style>
	<%	
	}
%>

</head>
<body>
	<%@ include file="/include/navbar.jsp"%>

<%
	//1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
	// 첫 페이지 경우
		int pageNum = 1;
		int amount = 5;
	// 페이지번호를 클릭하는 경우
		if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
   			pageNum = Integer.parseInt(request.getParameter("pageNum"));
   			amount = Integer.parseInt(request.getParameter("amount"));
		}
	// 2. pageVO생성
	LectureDAO ldto = new LectureDAO();
	
	ArrayList<LectureDTO> lectures = LectureDAO.getListpaging(pageNum, amount);
	
	int total = ldto.getTotal(); // 전체게시글수
	PageVO pvo = new PageVO(pageNum, amount, total);
	// 3. 페이지네이션을 화면에 전달
		request.setAttribute("pageVO", pvo);
	// 화면에 가지고 나갈 list를 request에 저장 !!
		request.setAttribute("lectures", lectures);
%>
<div class = "container">
<div class="pt-5"></div>
	<h2>특강</h2>
	<div class = "d-grid gap-2 d-md-flex justify-content-md-end">
	  <input class="form-control input-sm" type="search" placeholder="검색어" aria-label="" id="keyword" placeholder=".input-sm">
	  <button class="btn btn-outline-success" type="button" id="searchBtn">검색</button>
	</div> 
	<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th class ="col-8 text-center">제목</th>
			<th class ="col-2 text-center">설교자</th>
			<th class ="col-2 text-center">작성일</th>
		</tr>
	</thead>
	<tbody class = "table-group-divider">
	

	<%	
	for (LectureDTO lecture : lectures) {
	%>
		<tr>
		<td class = "text-center"><a href="lectureDetail.jsp?lno=<%=lecture.getLno()%>"> <%=lecture.getLtitle() %></td>
		<td class = "text-center"><%=lecture.getLname() %></td>
		<td class = "text-center"><small><%=lecture.getLdate() %></small></td>
		</tr>
		<%
	}
%>
	</tbody>
	</table>
	
	
		<div class="adminAdd d-grid gap-2 d-md-flex justify-content-md-end" style = "visibility:visible">
		<button onclick="location.href='lectureAdd.jsp'"class="btn btn-primary">글 올리기</button>
		</div>
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<!-- 2. 이전버튼 활성화 여부 -->
<c:if test="${pageVO.prev }">
      <li class="page-item"><a class="page-link" href="lectureMain.jsp?pageNum=${pageVO.startPage - 1 }&amount=${pageVO.amount}">이전</a></li>
</c:if>
             
   <!-- 1. 페이지번호 처리 -->
   <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
      <li class="${pageVO.pageNum eq num ? 'active ' : '' }page-item">
      <a class="page-link" href="lectureMain.jsp?pageNum=${num }&amount=${pageVO.amount}">${num }</a></li>
   </c:forEach>
   
   <!-- 3. 다음버튼 활성화 여부 -->
   <c:if test="${pageVO.next }">
      <li class="page-item"><a class="page-link" href="lectureMain.jsp?pageNum=${pageVO.endPage + 1 }&amount=${pageVO.amount}">다음</a></li>
   </c:if>
  </ul>
</nav>
</div>
	<%@ include file="/include/footer.jsp"%>
</body>
</html>