<%@page import="vow.VowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>   

<%
	request.setCharacterEncoding("utf-8");

	if (sid == null || !sid.equals(VowDAO.selectEmail(Integer.parseInt(request.getParameter("vno"))))) {
		response.sendRedirect("vSelectAll.jsp");
		return;
	}

	int vno = Integer.parseInt(request.getParameter("vno"));
	String vtitle = request.getParameter("vtitle");
	String vcontent = request.getParameter("vcontent");
	
	int result = VowDAO.update(vno, vtitle, vcontent);

	if (result == 1){%>
	<script>
	window.onload = function(){ popModal2("말씀 서원 수정", "수정에 성공하셨습니다", "/3/vow/vSelectOne.jsp?vno="+<%=vno%>)}
	</script>
<%} else {%>
	<script>
	window.onload =  function(){popModal2("말씀 서원 수정", "수정에 실패하셨습니다", "/3/vow/vSelectOne.jsp?vno="+<%=vno%>)}
	</script>
<%}%>

<%@ include file="/include/footer.jsp"%>   
<script>history.forward();</script>