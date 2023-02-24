<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendRedirect("/main.jsp");
	}

	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	
	String data = UserDAO.selectUser(email);
	
	JSONParser parser = new JSONParser();
	String name = "";
	String job = "";
	try {
		HashMap	json = (HashMap)parser.parse(data);
		
		name = (String) json.get("name");
		job = (String) json.get("job");
		
		System.out.println(name);
		System.out.println(job);
		
	} catch (ParseException e) {
		e.printStackTrace();
	}
	
	if (UserDAO.edit(email, pw, name, job)) {
		out.print("success");
	} else {
		out.print("fail");
	}
%>