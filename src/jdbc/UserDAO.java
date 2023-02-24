package jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class UserDAO {
	private final static int NO_USER = 0;
	private final static int APPROVE = 1;
	private final static int NO_APPROVE = 2;
	private final static int PASSWORD_INVAILD = 3;
	
	// 회원 가입
	public static boolean insert(String email, String password, String name, String job) {
		boolean result = false;
		String sql = "INSERT INTO user (email, password, name, job) VALUES (?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		password = base64Encode(password);
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
	public static boolean apply(String email) {
		boolean result = false;

		String sql = "UPDATE user SET approve=? WHERE email=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 정보 수정
	public static boolean edit(String email, String password, String name, String job) {
		boolean result = false;
		String sql = "UPDATE user SET password=?, name=?, job=? WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		password = base64Encode(password);
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, job);
			pstmt.setString(4, email);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
//	// 회원 목록 가져오기
//	public static List<UserDTO> selectList() {
//		ArrayList<UserDTO> list = new ArrayList<>();
//		String sql = "SELECT * FROM user ORDER BY ts DESC";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rSet = null;
//		try {
//			conn = ConnectionPool.get();
//			pstmt = conn.prepareStatement(sql);
//			rSet = pstmt.executeQuery();
//			
//			while (rSet.next()) {
////				UserDTO udto = new UserDTO(
////					rSet.getString("id"),
////					rSet.getString("password"),
////					rSet.getString("name"),
////					rSet.getString("ts")
////				); 
////				list.add(udto);
//			}
//			
//		} catch (SQLException | NamingException e) {
//			e.printStackTrace();
//			list = null;
//		} finally {
//			close(conn, pstmt, rSet);
//		}
//		
//		return list;
//	}
	
	// 회원 목록 가져오기 (AJAX)
	public static String selectList() {
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
				jo.put("password", base64Decode(rSet.getString("password")));
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
	
	// 회원 가져오기 (AJAX)
	public static String selectUser(String email) {
		JSONObject jo = new JSONObject();
		String sql = "SELECT * FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rSet = pstmt.executeQuery();
			
			while (rSet.next()) {
				jo.put("email", rSet.getString("email"));
				jo.put("name", rSet.getString("name"));
				jo.put("job", rSet.getString("job"));
				jo.put("joindate", rSet.getString("joindate"));
;
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			jo = null;
		} finally {
			close(conn, pstmt, rSet);
		}
		
		return jo.toJSONString();
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
	
	// 비밀번호 찾기
	public static boolean existPw(String email, String name) {
		boolean result = false;
		String sql = "SELECT * FROM user WHERE email=? AND name=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
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
	public static boolean delete(String email) {
		boolean result = false;
		String sql = "DELETE FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 회원 로그인
	public static int login(String email, String password) {
		int result = NO_USER;
		String sql = "SELECT email, password, approve FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rSet = pstmt.executeQuery();	
			if (rSet.next()) {	// id가 일치하고
				if (base64Decode(rSet.getString("password")).equals(password)) { // password가 일치하고
					result = rSet.getInt("approve") == APPROVE ? APPROVE : NO_APPROVE; // 승인 여부에 따라
				} else {
					result = PASSWORD_INVAILD; // 패스워드 불일치
				}
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rSet);
		}
		return result;
	}
	
	//승인된 회원 목록
	public static String selectApproved() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray users = new JSONArray();
		try {
			String sql = "SELECT * FROM user WHERE approve=1 ORDER BY joindate DESC";
				
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("email", rs.getString(1));
			obj.put("password", rs.getString(2));
			obj.put("name", rs.getString(3));
			obj.put("job", rs.getString(4));
			obj.put("joindate", rs.getString(5));
			
			users.add(obj);
			
		}
		
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
		
		return users.toJSONString();
	}
		
	//승인 대기중인 회원 목록
	public static String selectTmpList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray users = new JSONArray();
		try {
			String sql = "SELECT * FROM user WHERE approve=0 ORDER BY joindate ASC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("email", rs.getString("email"));
				obj.put("password", base64Decode(rs.getString("password")));
				obj.put("name", rs.getString("name"));
				obj.put("job", rs.getString("job"));
				obj.put("joindate", rs.getString("joindate"));
				
				users.add(obj);
				
			}
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, rs);
		}
		return users.toJSONString();
	}
		
	public static int acceptUser(String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			String sql = "Update user SET approve=1 WHERE email=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
	
		return result;
	}
	
	//승인상태 변경
	public static int acceptChange(String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "Update user SET approve=0 WHERE email=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
		
		} catch (Exception e) {
		} finally {
			close(conn, pstmt, null);
		}
	
		return result;
	}
	
	/**
     * BASE64 Encoder
     * @param str
     * @return
     */
    public static String base64Encode(String str) {
    	String result = null;
    	try {
	        Encoder encoder = Base64.getEncoder();
	        byte[] strByte = str.getBytes("UTF-8");
	        result = encoder.encodeToString(strByte);
    	} catch (IOException e) {
		}
    	return result;
    }

    /**
     * BASE64 Decoder
     * @param str
     * @return
     */
    public static String base64Decode(String str) {
        Decoder decoder = Base64.getDecoder();
        byte[] strByte = decoder.decode(str);
        String result = new String(strByte);
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
