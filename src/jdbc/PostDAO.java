/*
최초작성자 : 김지수 (jisukim.fb@gmail.com)
최초작성일 : 2023/02/15

버전  기록 : 0.1(시작 23/02/15) 
       0.5(기본작업 23/02/16) 
       0.7(추가 디자인 23/02/15)
       1.0(1차 완성 23/02/15)
*/
package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class PostDAO {
	
	// 주보 하나 상세보기
	public static PostDTO selectPost(int pno) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM post WHERE pno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
			rs = pstmt.executeQuery(); 
			
			PostDTO post = new PostDTO();
			
			if(rs.next()) {
				post = new PostDTO(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7));
			}
			return post;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	
	// List로 전체 주보 출력
	public static ArrayList<PostDTO> selectAllPostList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM post ORDER BY pdate DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			
			ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
			
			while(rs.next()) {
				posts.add(new PostDTO(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)));
				
			}return posts;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//ajax로 모든 주보 출력
	public static String selectAllPost() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM post ORDER BY pdate DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			
			JSONArray posts = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("pno", rs.getInt(1));
				obj.put("ptitle", rs.getString(2));
				obj.put("pupfolder", rs.getString(3));
				obj.put("puuid", rs.getString(4));
				obj.put("pfilename", rs.getString(5));
				obj.put("email", rs.getString(6));
				obj.put("pdate", rs.getString(7));
				posts.add(obj);
			}
			return posts.toJSONString();
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	// 주보 등록
	public static boolean insertPost(String ptitle, String pupfolder, String puuid, String pfilename, String email)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO post(ptitle, pupfolder, puuid, pfilename, email) VALUES(?,?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ptitle);
			pstmt.setString(2, pupfolder);
			pstmt.setString(3, puuid);
			pstmt.setString(4, pfilename);
			pstmt.setString(5, email);
			
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 

		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	// 주보 수정
	public static boolean updatePost(int pno, String ptitle, String pupfolder, String puuid, String pfilename)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE post SET ptitle=?, pupfolder=?, puuid=?, pfilename=? WHERE pno = ? ";
					
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ptitle);
			pstmt.setString(2, pupfolder);
			pstmt.setString(3, puuid);
			pstmt.setString(4, pfilename);
			pstmt.setInt(5, pno);
			
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 

		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	// 주보 삭제
	public static boolean deletePost(int pno)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM post WHERE pno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
			
			
		
}
