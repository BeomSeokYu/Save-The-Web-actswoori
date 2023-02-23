<!-- 
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/16) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/16)
       1.0(1차 완성 23/02/16)
--> 
<%@page import="jdbc.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>      
<%
	sid = (String) session.getAttribute("sid"); // 보안 처리
	if(sid == null) {
		response.sendRedirect("postList.jsp");
		return;
	}
	
	int pno = Integer.parseInt(request.getParameter("pno"));

	if(PostDAO.deletePost(pno)) {
%>
<script>
	$(function() {
		popModal2('주보 삭제', '주보가 삭제되었습니다.', 'postList.jsp');
	});
</script>
<%
	} else {
%>
<script>
	$(function() {
		popModal2('주보 삭제', '알 수 없는 이유로 삭제하지 못했습니다.', 'postView.jsp?pno='+pno);
	});
</script>
<%
	}
	




%>

<%@ include file="/include/footer.jsp" %>      
