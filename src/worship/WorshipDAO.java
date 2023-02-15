package worship;

import java.sql.*;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class WorshipDAO {
	// 등록
	public static int insert(String email, String wname, String wtitle, String wcontent) {
		try {
			String sql = "INSERT INTO worship (email, wname, wtitle, wcontent) VALUES(?, ?, ?, ?)";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, wname);
			pstmt.setString(3, wtitle);
			pstmt.setString(4, wcontent);

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
	public static int update(int wno, String wname, String wtitle, String wcontent) {
		try {
			String sql = "UPDATE worship SET wname = ?, wtitle = ?, wcontent = ? WHERE wno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wname);
			pstmt.setString(2, wtitle);
			pstmt.setString(3, wcontent);
			pstmt.setInt(4, wno);
			
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
	public static int delete(int wno) { 
		try {
			String sql = "DELETE FROM worship WHERE wno = ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);

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
	public static String list() {
		try {
			String sql = "SELECT * FROM worship ORDER BY wdate DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray users = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("email", rs.getString(2));
				obj.put("wname", rs.getString(3));
				obj.put("wtitle", rs.getString(4));
				obj.put("wdate", rs.getString(6));
				
				users.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return users.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 조회
	public static String OneList(int wno) { //AJAX로 내 피드 리스트 출력 메서드
		try {
			String sql = "SELECT * FROM worship WHERE wno = ? ORDER BY wdate DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray feeds = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("email", rs.getString(2));
				obj.put("wname", rs.getString(3));
				obj.put("wtitle", rs.getString(4));
				obj.put("wcontent", rs.getString(5));
				obj.put("wdate", rs.getString(6));
				
				feeds.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return feeds.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			
			return null;
		}
	}
}