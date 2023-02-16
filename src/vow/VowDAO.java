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
	
	// 목록
	public static String selectAll() {
		try {
			String sql = "SELECT * FROM vow ORDER BY vdate DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray vows = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("vno", rs.getString(1));
				obj.put("email", rs.getString(2));
				obj.put("vtitle", rs.getString(3));
				obj.put("vdate", rs.getString(5));
				
				vows.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return vows.toJSONString();
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
				vow.put("vno", rs.getString(1));
				vow.put("email", rs.getString(2));
				vow.put("vtitle", rs.getString(3));
				vow.put("vcontent", rs.getString(4));
				vow.put("vdate", rs.getString(5));
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
