package vow;

import java.sql.*;
import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class VowDAO {
	// 등록
	public static int insert(String email, String vtitle, String vcontent) {
		try {
			String sql = "INSERT INTO vow (email, vtitle, vcontent) VALUES(?, ?, ?)";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, vtitle);
			pstmt.setString(3, vcontent);

			int result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 수정
	public static int update(int vno, String vtitle, String vcontent) {
		try {
			String sql = "UPDATE vow SET vtitle = ?, vcontent = ? WHERE vno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vtitle);
			pstmt.setString(2, vcontent);
			pstmt.setInt(3, vno);
			
			int result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 삭제
	public static int delete(int vno) { 
		try {
			String sql = "DELETE FROM vow WHERE vno = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vno);

			int result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//작성자 이메일 조회
	public static String selectEmail(int vno) {
		try {
			String sql = "SELECT email FROM vow WHERE vno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vno);
			
			ResultSet rs = pstmt.executeQuery();
			
			String email = null;
			
			if (rs.next()) {
				email = rs.getString(1);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return email;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//조회
	public static String selectOne(int vno) {
		try {
			String sql = "SELECT * FROM vow WHERE vno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vno);
			
			ResultSet rs = pstmt.executeQuery();
			
			JSONObject vow = new JSONObject();
			
			if (rs.next()) {
				vow.put("vno", rs.getString("vno"));
				vow.put("email", rs.getString("email"));
				vow.put("vtitle", rs.getString("vtitle"));
				vow.put("vcontent", rs.getString("vcontent"));
				vow.put("vdate", rs.getString("vdate"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return vow.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}