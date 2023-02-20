<%@page import="jdbc.Criteria"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="sqlMap.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	Criteria cri = new Criteria(amount, pageNum, type, keyword);
	
	try{
		out.write(sqlSession.selectOne("PostMapper.totalCount", cri).toString());
	}catch(Exception e){
	    e.printStackTrace();
	}finally{
	    sqlSession.close();
	}
%>