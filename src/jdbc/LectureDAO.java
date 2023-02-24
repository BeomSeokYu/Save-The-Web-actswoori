/*
최초작성자 : 김영광
최초작성일 : 2023/02/16

버전  기록 : 0.1(시작 23/02/14) 
	     0.2(특강목록전체, 등록 23/02/15)
	     0.3(특강디테일 23/02/16)
	     0.4(특강 수정, 삭제 23/02/17)
	           0.7(추가 디자인 23/02/18)
	           1.0(1차 완성 23/02/20)
*/
package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class LectureDAO {
	
	//특강 등록
	public static boolean insert(String ltitle, String lname, String lcontent, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			String sql = "INSERT INTO lecture (ltitle,lname,lcontent,email) VALUES(?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ltitle);
			pstmt.setString(2, lname);
			pstmt.setString(3, lcontent);
			pstmt.setString(4, email);
			
			result =  (pstmt.executeUpdate() == 1) ? true :false;	
		
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	//특강 목록 전체
	public static ArrayList<LectureDTO> getallList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<LectureDTO> boards = new ArrayList<LectureDTO>();
		try {
			String sql = "SELECT * FROM lecture";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boards.add(new LectureDTO(rs.getInt(1),
										  rs.getString(2),
										  rs.getString(3),
										  rs.getString(4),
										  rs.getString(5),
										  rs.getString(6)));
			}
		} catch (Exception e) {
			boards = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return boards;

	}	
	
	//특강 디테일
	public static LectureDTO getDetail(int lno) {
		
		String sql = "SELECT * FROM lecture where lno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LectureDTO lecture = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,lno);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String ltitle = rs.getString(2);
			String lname = rs.getString(3);
			String lcontent = rs.getString(4);
			String email = rs.getString(5);
			String ldate = rs.getString(6);
		
			lecture = new LectureDTO(lno,ltitle,lname,lcontent,email,ldate); //새로운 객체 생성
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, rs);
		}
		return lecture;
	  }
	
	//게시글 수정
	public static boolean update(int lno, String ltitle, String lname, String lcontent) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			String sql = "UPDATE lecture SET ltitle=?,lname=?,lcontent=? WHERE lno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ltitle);
			pstmt.setString(2, lname);
			pstmt.setString(3, lcontent);
			pstmt.setInt(4, lno);
			
			result = (pstmt.executeUpdate() == 1) ? true :false;	
		
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
		
		return result;
	}
	
	//게시글 삭제
	public static boolean delete(int lno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			String sql = "DELETE FROM lecture WHERE lno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lno);
			
			result =  (pstmt.executeUpdate() == 1) ? true :false;	
		
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
		
	//작성자 이메일 조회
	public static String selectEmail(int lno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		try {
			String sql = "SELECT email FROM lecture WHERE lno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lno);
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				email = rs.getString(1);
			}
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, rs);
		}
		return email;
	}
	
	
	//페이징
	public static ArrayList<LectureDTO> getListpaging(int pageNum, int amount) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<LectureDTO> lectures = new ArrayList<LectureDTO>();
		try {
			String sql = "SELECT * FROM lecture ORDER BY lno DESC limit ?,?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1,(pageNum-1)*amount);
					pstmt.setInt(2,amount);
					
			rs = pstmt.executeQuery(); 
			
			
			while(rs.next()) {
				lectures.add(new LectureDTO(rs.getInt(1),
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4),
									  rs.getString(5),
									  rs.getString(6)));

			}
			
		} catch (Exception e) {
			lectures = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return lectures;
	}
		
	//페이지 (총 개수)
	public int getTotal() {

	    int result = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    String sql = "select count(*) as total from lecture";
	    
	    conn = ConnectionPool.get();
	    pstmt = conn.prepareStatement(sql);
	    
	    rs = pstmt.executeQuery();
	    
	    while (rs.next()) {
	       result = rs.getInt("total");
	       
	    }
	    
	    } catch (SQLException | NamingException e) {
	       e.printStackTrace();
	    } finally {
	    	close(conn, pstmt, rs);
	    }
	    
	    
	    return result;
	 }
	
	// 객체 닫기
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rSet) {
		try {
			if(rSet!=null) rSet.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

