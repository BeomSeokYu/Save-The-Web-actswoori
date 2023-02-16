<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->


<%@page import="page.PageVO"%>
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<% //1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
// 첫 페이지 경우
int pageNum = 1;
int amount = 10;

// 페이지번호를 클릭하는 경우
if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	amount = Integer.parseInt(request.getParameter("amount"));
}


// 2. pageVO생성
NewsDAO ndao = new NewsDAO();

List<NewsDTO> newsList = NewsDAO.selectAllNewsPaging(pageNum, amount);
int total = ndao.getTotal(); // 전체게시글수
PageVO pvo = new PageVO(pageNum, amount, total);

// 3. 페이지네이션을 화면에 전달
request.setAttribute("pageVO", pvo);

// 화면에 가지고 나갈 list를 request에 저장 !!
request.setAttribute("newsList", newsList); %>

<div class="container">
<div>
	<select onchange="change(this)">
		<option value="10" ${pageVO.amount eq 10 ? 'selected' : '' }>10개씩 보기</option>
		<option value="20" ${pageVO.amount eq 20 ? 'selected' : '' }>20개씩 보기</option>
		<option value="50" ${pageVO.amount eq 50 ? 'selected' : '' }>50개씩 보기</option>
		<option value="100" ${pageVO.amount eq 100 ? 'selected' : '' }>100개씩 보기</option>
	</select>
</div>

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
  for(NewsDTO news : newsList) {
	  %>
	 <tr>
      <th scope="row"><a href="newsDetail.jsp?nno=<%= news.getNno() %>&pageNum=${pageVO.pageNum }&amount=${pageVO.amount}"><%= news.getNtitle() %></a></th>
      <td><%= news.getEmail() %></td>
      <td><%= news.getNdate() %></td>
    </tr>
	  
	  <%
	}
  %>

  </tbody>
</table>

<nav aria-label="Page navigation example">
  <ul class="pagination">

<!-- 2. 이전버튼 활성화 여부 -->
<c:if test="${pageVO.prev }">
		<li class="page-item"><a class="page-link" href="newsAll.jsp?pageNum=${pageVO.startPage - 1 }&amount=${pageVO.amount}">이전</a></li>
</c:if>
       		
	<!-- 1. 페이지번호 처리 -->
	<c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
		<li class="${pageVO.pageNum eq num ? 'disabled ' : '' }page-item">
		<a class="page-link" href="newsAll.jsp?pageNum=${num }&amount=${pageVO.amount}">${num }</a></li>
	</c:forEach>
	
	<!-- 3. 다음버튼 활성화 여부 -->
	<c:if test="${pageVO.next }">
		<li class="page-item"><a class="page-link" href="newsAll.jsp?pageNum=${pageVO.endPage + 1 }&amount=${pageVO.amount}">다음</a></li>
	</c:if>
  </ul>
</nav>
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

function change(a){
	location.href="newsAll.jsp?pageNum=1&amount=" + a.value;
}
</script>

</script>
</body>
</html>