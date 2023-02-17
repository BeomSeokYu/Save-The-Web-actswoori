<%@page import="page.pageVO"%>
<%@page import="jdbc.coopDTO"%>
<%@page import="jdbc.coopDAO"%>


<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../../include/header.jsp" %>
<%
	//1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
// 첫 페이지 경우
int pageNum = 1;
int amount = 10;

// 페이지번호를 클릭하는 경우
if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
   pageNum = Integer.parseInt(request.getParameter("pageNum"));
   amount = Integer.parseInt(request.getParameter("amount"));
}


// 2. pageVO생성
coopDAO cdto = new coopDAO();

List<coopDTO> coops = coopDAO.getListpaging(pageNum, amount);
int total = cdto.getTotal(); // 전체게시글수
page.pageVO pvo = new page.pageVO(pageNum, amount, total);

// 3. 페이지네이션을 화면에 전달
request.setAttribute("pageVO", pvo);

// 화면에 가지고 나갈 list를 request에 저장 !!
request.setAttribute("coops", coops);
%>

 <div>
   <select onchange="change(this)">
      <option value="10" ${pageVO.amount eq 10 ? 'selected' : '' }>10개씩 보기</option>
      <option value="20" ${pageVO.amount eq 20 ? 'selected' : '' }>20개씩 보기</option>
      <option value="50" ${pageVO.amount eq 50 ? 'selected' : '' }>50개씩 보기</option>
      <option value="100" ${pageVO.amount eq 100 ? 'selected' : '' }>100개씩 보기</option>
   </select>
</div> 



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
		
		for(coopDTO coop : coops){	
%>
	<tr>
      <th scope="row"><%=coop.getCno() %></th>
      <td><a href="coopInfo.jsp?cno=<%=coop.getCno() %>&pageNum=${pageVO.pageNum }&amount=${pageVO.amount}"><%=coop.getCtitle() %></a></td>
      <td><%=coop.getEmail()%></td>
      <td><%=coop.getCdate() %></td>
    </tr>

<%			
	}
%>

  </tbody>
</table>
<button onclick="location.href='coopAdd.jsp'" class="btn btn-success" style="float:right;">글 등록하기</button>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination">

<!-- 2. 이전버튼 활성화 여부 -->
<c:if test="${pageVO.prev }">
      <li class="page-item"><a class="page-link" href="coopList.jsp?pageNum=${pageVO.startPage - 1 }&amount=${pageVO.amount}">이전</a></li>
</c:if>
             
   <!-- 1. 페이지번호 처리 -->
   <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
      <li class="${pageVO.pageNum eq num ? 'disabled ' : '' }page-item">
      <a class="page-link" href="coopList.jsp?pageNum=${num }&amount=${pageVO.amount}">${num }</a></li>
   </c:forEach>
   
   <!-- 3. 다음버튼 활성화 여부 -->
   <c:if test="${pageVO.next }">
      <li class="page-item"><a class="page-link" href="coopList?pageNum=${pageVO.endPage + 1 }&amount=${pageVO.amount}">다음</a></li>
   </c:if>
  </ul>
</nav>

<%@include file="../../include/footer.jsp" %>
<script>
function change(a){
	   location.href="coopList.jsp?pageNum=1&amount=" + a.value;
	}
</script>
</body>
</html>