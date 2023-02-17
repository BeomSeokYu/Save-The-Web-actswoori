<%@page import="jdbc.coopDTO"%>
<%@page import="jdbc.coopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<body>
<%@ include file="../../include/header.jsp" %>
 <% int cno = Integer.parseInt(request.getParameter("cno"));
	 coopDAO cdao = new coopDAO();
 	 coopDTO cdto = cdao.select(cno); %> 
	
			<div class="col-md-8">
			
			<p><span class = "font-weight-bold">제목 : </span>
			 <%=cdto.getCtitle()%></p>
			<p><span class = "font-weight-bold">내용 : </span>
			 <%=cdto.getCcontent()%></p>
			
			</div>
			<a href="coopDeleteCheck.jsp?cno=<%=cdto.getCno()%>" class="btn btn-primary" >삭제하기</a>
			<button onclick="location.href='coopUpdate.jsp?cno=<%=cdto.getCno()%>'" class="btn btn-primary">수정하기</button>
			<button onclick="location.href='coopList.jsp?pageNum=<%= request.getParameter("pageNum") %>&amount=<%= request.getParameter("amount") %>'" class="btn btn-primary">목록으로</button>

			
			

</body>
 <%@include file="../../include/footer.jsp" %>