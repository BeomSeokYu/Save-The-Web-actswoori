<%@page import="worship.WorshipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="/include/header.jsp"%>   

<%
	request.setCharacterEncoding("utf-8");

	 if (sid == null || !sid.equals(WorshipDAO.selectEmail(Integer.parseInt(request.getParameter("wno"))))) {
		response.sendRedirect("wSelectAll.jsp");
		return;
	} 
	
	int wno = Integer.parseInt(request.getParameter("wno"));
	String wname = request.getParameter("wname");
	String wtitle = request.getParameter("wtitle");
	String wcontent = request.getParameter("wcontent");
	
	int result = WorshipDAO.update(wno, wname, wtitle, wcontent);

	if (result == 1){%>
		<script>
		window.onload = function(){ popModal2("예배 설교 수정", "수정에 성공하셨습니다", "/2/worship/wSelectOne.jsp?wno="+<%=wno%>)}
		</script>
	<%} else {%>
		<script>
		window.onload =  function(){popModal2("예배 설교 수정", "수정에 실패하셨습니다", "/2/worship/wSelectOne.jsp?wno="+<%=wno%>)}
		</script>
	<%}%>

	<%@ include file="/include/footer.jsp"%>   
<script>history.forward();</script>