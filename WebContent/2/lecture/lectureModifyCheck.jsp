<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/include/header.jsp"%>
    
<%
	request.setCharacterEncoding("utf-8");
<<<<<<< Updated upstream
=======


if (sid == null) {
	response.sendRedirect("lectureMain.jsp");
	return;
}
>>>>>>> Stashed changes
	
		String lno = request.getParameter("lno");
		int lnoo = Integer.parseInt(lno);
 	
		
		String ltitle = request.getParameter("ltitle");
		String lname = request.getParameter("lname");
		String lcontent = request.getParameter("lcontent");
		
		
		if(LectureDAO.update(lnoo, ltitle, lname, lcontent)) {%>
		<script>
		window.onload = function(){ popModal2("주요 특강 수정", "수정에 성공하셨습니다", "/2/lecture/lectureDetail.jsp?lno=<%=lno%>")}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("주요 특강 수정", "수정에 실패하셨습니다", "/2/lecture/lectureDetail.jsp?lno=<%=lno%>")}
		</script>
	<%}%>
	
	<%@ include file="/include/footer.jsp"%>   
