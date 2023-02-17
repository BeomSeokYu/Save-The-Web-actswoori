package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class LectureDAO {
	
	//특강 등록
	public static boolean insert(String ltitle, String lname, String lcontent)throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO lecture (ltitle,lname,lcontent) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ltitle);
			pstmt.setString(2, lname);
			pstmt.setString(3, lcontent);
			
		return (pstmt.executeUpdate() == 1) ? true :false;	
		
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//특강 목록 전체
	public static ArrayList<LectureDTO> getallList() throws SQLException,NamingException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM lecture";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<LectureDTO> boards = new ArrayList<LectureDTO>();
			while(rs.next()) {
				boards.add(new LectureDTO(rs.getInt(1),
										  rs.getString(2),
										  rs.getString(3),
										  rs.getString(4),
										  rs.getString(5),
										  rs.getString(6)));
			}
			return boards;
		}
		
		finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}

	}	
	
	//특강 디테일
	public static LectureDTO getDetail(int lno) throws NamingException, SQLException{
		
		String sql = "SELECT * FROM lecture where lno=?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,lno);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			String ltitle = rs.getString(2);
			String lname = rs.getString(3);
			String lcontent = rs.getString(4);
			String email = rs.getString(5);
			String ldate = rs.getString(6);
		
			LectureDTO lecture = new LectureDTO(lno,ltitle,lname,lcontent,email,ldate); //새로운 객체 생성
		
			return lecture;
	  }
	
	//게시글 수정
	public static boolean update(int lno, String ltitle, String lname, String lcontent)throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE lecture SET ltitle=?,lname=?,lcontent=? WHERE lno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ltitle);
			pstmt.setString(2, lname);
			pstmt.setString(3, lcontent);
			pstmt.setInt(4, lno);
			
		return (pstmt.executeUpdate() == 1) ? true :false;	
		
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//게시글 삭제
	
}


