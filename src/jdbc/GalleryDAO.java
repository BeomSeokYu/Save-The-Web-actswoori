package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class GalleryDAO {
	// insert
	public static boolean insert(String title, String upfolder, String filename, String uuid, String email) {
		boolean result = false;
		String sql = "INSERT INTO gallery (gtitle, gupfolder, guuid, gfilename, email) VALUES (?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, upfolder);
			pstmt.setString(3, uuid);
			pstmt.setString(4, filename);
			pstmt.setString(5, email);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		return result;
	}
	
	// 사진 목록 가져오기 (AJAX)
	public static String selectAllList() {
		JSONArray ja = new JSONArray();
		String sql = "SELECT * FROM gallery ORDER BY gdate DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rSet = pstmt.executeQuery();
			
			while (rSet.next()) {
				JSONObject jo = new JSONObject();
				jo.put("gno", rSet.getString("gno"));
				jo.put("gtitle", rSet.getString("gtitle"));
				jo.put("gupfolder", rSet.getString("gupfolder"));
				jo.put("guuid", rSet.getString("guuid"));
				jo.put("gfilename", rSet.getString("gfilename"));
				jo.put("email", rSet.getString("email"));
				jo.put("gdate", rSet.getString("gdate"));
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
	
	// 회원 탈퇴
	public static boolean delete(int gno) {
		boolean result = false;
		String sql = "DELETE FROM gallery WHERE gno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gno);
			
			result = pstmt.executeUpdate() == 1 ? true : false;
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
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
