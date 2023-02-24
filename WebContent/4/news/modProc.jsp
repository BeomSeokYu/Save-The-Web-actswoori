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

String ntitle = request.getParameter("title");
String ncontent = request.getParameter("content");
int nno = Integer.parseInt(request.getParameter("nno"));

boolean result = NewsDAO.updateNews(nno, ntitle, ncontent);

if (result){%>
<script>
window.onload = function(){ popModal2("교회 소식 수정", "수정에 성공하셨습니다", "/4/news/newsDetail.jsp?nno="+<%=nno%>)}
</script>
<%} else {%>
<script>
window.onload =  function(){popModal2("교회 소식 수정", "수정에 실패하셨습니다", "/4/news/newsDetail.jsp?nno="+<%=nno%>)}
</script>
<%}%>

<%@ include file="/include/footer.jsp"%>  
<script>history.forward();</script> 