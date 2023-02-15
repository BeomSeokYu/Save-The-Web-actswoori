package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class UserDAO {

	// 회원 가입
	public static boolean insert(String email, String password, String name, String job) {
		boolean result = false;
		String sql = "INSERT INTO user (email, password, name, job) VALUES (?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, job);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 가입 승인 처리
	public static boolean apply(String id) {
		boolean result = false;

		String sql = "SELECT * FROM temp WHERE id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rSet = pstmt.executeQuery();
			
//			if (rSet.next()
//				&& UserDAO.insert(rSet.getString("id"),rSet.getString("password"),rSet.getString("name"))
//				&& TempDAO.delete(id)) {
//				conn.commit();
//				result = true;
//			} else {
//				conn.rollback();
//			}
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 정보 수정
	public static boolean edit(String id, String password, String name) {
		boolean result = false;
		String sql = "UPDATE user SET password=?, name=? WHERE id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 목록 가져오기
	public static List<UserDTO> selectList() {
		ArrayList<UserDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM user ORDER BY ts DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rSet = pstmt.executeQuery();
			
			while (rSet.next()) {
//				UserDTO udto = new UserDTO(
//					rSet.getString("id"),
//					rSet.getString("password"),
//					rSet.getString("name"),
//					rSet.getString("ts")
//				); 
//				list.add(udto);
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			list = null;
		} finally {
			close(conn, pstmt, rSet);
		}
		
		return list;
	}
	
	// 회원 목록 가져오기 (AJAX)
	public static String selectListAJAX() {
		JSONArray ja = new JSONArray();
		String sql = "SELECT * FROM user ORDER BY ts DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rSet = pstmt.executeQuery();
			
			while (rSet.next()) {
				JSONObject jo = new JSONObject();
				jo.put("id", rSet.getString("id"));
				jo.put("password", rSet.getString("password"));
				jo.put("name", rSet.getString("name"));
				jo.put("ts", rSet.getString("ts"));

				ja.add(jo);
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			ja = null;
		} finally {
			close(conn, pstmt, rSet);
		}
		
		return ja.toJSONString();
	}
	
	// 회원 확인
	public static boolean exist(String email) {
		boolean result = false;
		String sql = "SELECT * FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rSet = pstmt.executeQuery();
			
			result = rSet.next() ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rSet);
		}
		return result;
	}
	
	// 회원 탈퇴
	public static boolean delete(String id) {
		boolean result = false;
		String sql = "DELETE FROM user WHERE id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 로그인
	public static int login(String id, String password) {
		int result = 0;
		String sql = "SELECT id, password FROM user WHERE id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rSet = pstmt.executeQuery();
			if (rSet.next()) {	// id가 일치하고
				result = rSet.getString("password").equals(password)
					? 1		// password가 일치 할 경우
					: 2;	// password가 일치 하지 않을 경우
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rSet);
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
