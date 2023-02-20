<%@page import="jdbc.PostDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="jdbc.Criteria"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="sqlMap.SqlSessionManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int offset = Integer.parseInt(request.getParameter("offset"));
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	Criteria cri = new Criteria(amount, pageNum, offset, type, keyword);
	
	List<PostDTO> list = null;
	try {
		list = sqlSession.selectList("PostMapper.selectPostAllPaging", cri);
	} catch (Exception e) {
		e.printStackTrace();
	} finally{
	    sqlSession.close() ;
	}
	
	JSONArray ja = new JSONArray();
	for (PostDTO pdto : list) {
		JSONObject jo = new JSONObject();
		jo.put("pno", pdto.getPno());
		jo.put("ptitle", pdto.getPtitle());
		jo.put("pupfolder", pdto.getPupfolder());
		jo.put("puuid", pdto.getPuuid());
		jo.put("pfilename", pdto.getPfilename());
		jo.put("email", pdto.getEmail());
		jo.put("pdate", pdto.getPdate());
		ja.add(jo);
	}
	
	out.write(ja.toJSONString());
%>