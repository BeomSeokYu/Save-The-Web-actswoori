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
</head>
<body>
	<%@ include file="/include/navbar.jsp"%>

<%
	//1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
	// 첫 페이지 경우
		int pageNum = 1;
		int amount = 1;
	// 페이지번호를 클릭하는 경우
		if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
   			pageNum = Integer.parseInt(request.getParameter("pageNum"));
   			amount = Integer.parseInt(request.getParameter("amount"));
		}
	// 2. pageVO생성
	LectureDAO ldto = new LectureDAO();
	
	ArrayList<LectureDTO> lectures = LectureDAO.getListpaging(pageNum, amount);
	
	int total = ldto.getTotal(); // 전체게시글수
	pageVO pvo = new pageVO(pageNum, amount, total);
	// 3. 페이지네이션을 화면에 전달
		request.setAttribute("pageVO", pvo);
	// 화면에 가지고 나갈 list를 request에 저장 !!
		request.setAttribute("lectures", lectures);
%>

	<table align=center>
		<tr>
			<th>제목</th>
			<th>설교자</th>
			<th>작성일</th>
		</tr>

		<% 
	
	//나중에 user 받아오고
	//if (UserDAO.login(id, password) == 1) {
		
	//}
	//String adminLoginCheck = session.getAttribute("sid");
	String adminLoginCheck = "";
	
	if (adminLoginCheck != null){%>
	
		<button onclick="location.href='lectureAdd.jsp'"class="btn btn-primary">글 올리기</button>

	<%	
	}
	//ArrayList<LectureDTO> lectures = LectureDAO.getallList();

	for (LectureDTO lecture : lectures) {
	%>

		<tr>
			<td colspan=2><hr></td>
		</tr>
		<td><a href="lectureDetail.jsp?lno=<%=lecture.getLno()%>"> <%=lecture.getLtitle() %></td>
		<td colspan=2><%=lecture.getLname() %></td>
		<td><small><%=lecture.getLdate() %></small></td>

		</tr>
		<%
	}
%>
	</table>
	<nav aria-label="Page navigation example">
  <ul class="pagination">
<!-- 2. 이전버튼 활성화 여부 -->
<c:if test="${pageVO.prev }">
      <li class="page-item"><a class="page-link" href="lectureMain.jsp?pageNum=${pageVO.startPage - 1 }&amount=${pageVO.amount}">이전</a></li>
</c:if>
             
   <!-- 1. 페이지번호 처리 -->
   <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
      <li class="${pageVO.pageNum eq num ? 'disabled ' : '' }page-item">
      <a class="page-link" href="lectureMain.jsp?pageNum=${num }&amount=${pageVO.amount}">${num }</a></li>
   </c:forEach>
   
   <!-- 3. 다음버튼 활성화 여부 -->
   <c:if test="${pageVO.next }">
      <li class="page-item"><a class="page-link" href="lectureMain.jsp?pageNum=${pageVO.endPage + 1 }&amount=${pageVO.amount}">다음</a></li>
   </c:if>
  </ul>
</nav>
	<%@ include file="/include/footer.jsp"%>
</body>
</html>