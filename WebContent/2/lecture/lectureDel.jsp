<!-- 
최초작성자 : 김영광
최초작성일 : 2023/02/17

버전  기록 : 0.1(시작 23/02/17) 
	           0.5(기본작업 23/02/17)
	            
	           0.7(추가 디자인 23/02/18)
	           1.0(1차 완성 23/02/20)
-->
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String lno = request.getParameter("lno");
	int lnoo = Integer.parseInt(lno);
	//LectureDTO lecture = LectureDAO.getDetail(lnoo); 
	LectureDAO.delete(lnoo);
	response.sendRedirect("lectureMain.jsp");
%>
	




