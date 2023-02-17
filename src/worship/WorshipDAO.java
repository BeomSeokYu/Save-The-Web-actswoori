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
	
	//조회
	public static String selectOne(int wno) {
		try {
			String sql = "SELECT * FROM worship WHERE wno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			
			ResultSet rs = pstmt.executeQuery();
			
			JSONObject worship = new JSONObject();
			
			if (rs.next()) {
				worship.put("wno", rs.getString(1));
				worship.put("email", rs.getString(2));
				worship.put("wname", rs.getString(3));
				worship.put("wtitle", rs.getString(4));
				worship.put("wcontent", rs.getString(5));
				worship.put("wdate", rs.getString(6));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return worship.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 목록
	public static String selectAll() {
		try {
			String sql = "SELECT * FROM worship ORDER BY wdate DESC";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray worships = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("wno", rs.getString(1));
				obj.put("email", rs.getString(2));
				obj.put("wname", rs.getString(3));
				obj.put("wtitle", rs.getString(4));
				obj.put("wdate", rs.getString(6));
				
				worships.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return worships.toJSONString();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//페이징된 목록
	public static String selectAllPaging(int pageNum){
		try {
			String sql = "SELECT * FROM worship ORDER BY wdate DESC limit ?, ?";
			
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pageNum - 1) * 10);
			pstmt.setInt(2, pageNum * 10);
			
			ResultSet rs = pstmt.executeQuery();
			
			JSONArray worships = new JSONArray();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("wno", rs.getString(1));
				obj.put("email", rs.getString(2));
				obj.put("wname", rs.getString(3));
				obj.put("wtitle", rs.getString(4));
				obj.put("wdate", rs.getString(6));
				
				worships.add(obj);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return worships.toJSONString();
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 전체 게시글 수
	public static int getTotal() {
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) total FROM worship";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("total");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		}
		return result;
	}
}