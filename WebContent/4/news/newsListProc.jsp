
<%@page import="jdbc.NewsDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="jdk.nashorn.internal.ir.debug.JSONWriter"%>
<%@page import="jdbc.Criteria"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="sqlMap.SqlSessionManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="jdbc.GalleryDTO"%>
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
	
	List<NewsDTO> list = null;
	try {
		list = sqlSession.selectList("NewsMapper.selectNewsAllPaging", cri);
	} catch (Exception e) {
		e.printStackTrace();
	} finally{
	    sqlSession.close() ;
	}
	
	JSONArray ja = new JSONArray();
	for (NewsDTO ndto : list) {
		JSONObject jo = new JSONObject();
		jo.put("nno", ndto.getNno());
		jo.put("ntitle", ndto.getNtitle());
		jo.put("ncontent", ndto.getNcontent());
		jo.put("email", ndto.getEmail());
		jo.put("ndate", ndto.getNdate());
		ja.add(jo);
	}
	
	out.write(ja.toJSONString());
%>