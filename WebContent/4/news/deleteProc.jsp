<!-- 최초작성자 : 김예건
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) -->

<%@page import="jdbc.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/header.jsp"%>   
<%
request.setCharacterEncoding("utf-8");

if (sid == null) {
	response.sendRedirect("newsAll.jsp");
	return;
}

int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.deleteNews(nno);

if (result){%>
<script>
window.onload = function(){ popModal2("삭제", "삭제되었습니다.", "/4/news/newsAll.jsp")}
</script>
<%} else {%>
<script>
window.onload =  function(){popModal2("삭제", "알 수 없는 이유로 삭제하지 못했습니다.", "/4/news/newsAll.jsp")}
</script>
<%}%>

<%@ include file="/include/footer.jsp"%>   