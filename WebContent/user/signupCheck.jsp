
<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");


	String email = request.getParameter("email");
	String password = request.getParameter("password");
	//String passwordCheck = request.getParameter("passwordCheck");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	System.out.println(email);
	System.out.println(password);
	System.out.println(name);
	System.out.println(job);
	
	if (UserDAO.insert(email, password, name, job)) {
		System.out.println("등록 성공");
	}
	
	/* if (UserDAO.exist(id)) {
		System.out.println("이미 가입한 회원");
		response.getWriter().write("existUser");
	} else if(TempDAO.exist(id)) {
		System.out.println("가입 신청한 회원");
		response.getWriter().write("existTemp");
	} else {
		if (TempDAO.insert(id, password, name)) {
			System.out.println("가입 신청 성공");
			response.getWriter().write("success");
		} else {
			System.out.println("가입 신청 실패");
			response.getWriter().write("fail");
		}
	} */
	
%>