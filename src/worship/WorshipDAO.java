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
	
	//작성자 이메일 조회
	public static String selectEmail(int wno) {
		try {
			String sql = "SELECT email FROM worship WHERE wno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			
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
	public static String selectOne(int wno) {
		try {
			String sql = "SELECT * FROM worship WHERE wno = ?";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			
			ResultSet rs = pstmt.executeQuery();
			
			JSONObject worship = new JSONObject();
			
			if (rs.next()) {
				worship.put("wno", rs.getString("wno"));
				worship.put("email", rs.getString("email"));
				worship.put("wname", rs.getString("wname"));
				worship.put("wtitle", rs.getString("wtitle"));
				worship.put("wcontent", rs.getString("wcontent"));
				worship.put("wdate", rs.getString("wdate"));
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
}