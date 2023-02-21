<%@page import="java.io.File"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="jdbc.GalleryDTO"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.Criteria"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="sqlMap.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 해당 앱 내 업로드 경로 설정
	String uploadPath = "/resources/gallery";
	// 실제 업로드 저장 경로 설정
	String savePath = application.getRealPath(uploadPath);
	
	File uploadDir = new File(uploadPath);
	if(!uploadDir.exists()){
		uploadDir.mkdirs();
	}
	File saveDir = new File(savePath);
	if(!saveDir.exists()){
		saveDir.mkdirs();
	}
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int offset = Integer.parseInt(request.getParameter("offset"));
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	Criteria cri = new Criteria(amount, pageNum, offset, type, keyword);
	
	List<GalleryDTO> list = null;
	try {
		list = sqlSession.selectList("GalleryMapper.selectGalleryAllPaging", cri);
	} catch (Exception e) {
		e.printStackTrace();
	} finally{
	    sqlSession.close() ;
	}
	
	JSONArray ja = new JSONArray();
	for (GalleryDTO gdto : list) {
		JSONObject jo = new JSONObject();
		jo.put("no", gdto.getGno());
		jo.put("title", gdto.getGtitle());
		jo.put("upfolder", gdto.getGupfolder());
		jo.put("uuid", gdto.getGuuid());
		jo.put("filename", gdto.getGfilename());
		jo.put("email", gdto.getEmail());
		jo.put("date", gdto.getGdate());
		ja.add(jo);
	}
	
	out.write(ja.toJSONString());
%>