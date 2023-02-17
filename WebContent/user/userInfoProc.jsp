<%@page import="org.json.simple.JSONObject"%>
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");


	String email = request.getParameter("email");
	System.out.println(email);

	if (UserDAO.exist(email)) {
		out.write(UserDAO.selectUser(email));
	} else {
		JSONObject j = new JSONObject();
		j.put("name", null);
		out.write(j.toJSONString());
	}
	
%>