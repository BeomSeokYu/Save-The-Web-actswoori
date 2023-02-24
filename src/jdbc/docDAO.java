/*작성자 정보 : 최현식
작성일 정보 : 2023-02-15
버전 정보 : 1.0*/

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

public class docDAO {
	static String sql=null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	static Connection con = null;
	static boolean result = true;
	
	public static boolean insertDoc (String dtitle, String dcontent, String email) {
		sql= "insert into doctrine (dtitle, dcontent, email) values (?,?,?)";
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dtitle);
			pstmt.setString(2, dcontent);
			pstmt.setString(3, email);
			
			if(pstmt.executeUpdate()==1) result = true;
			else result = false;
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static String getAllListDoc() {
		sql="select * from doctrine";
		JSONArray feeds = new JSONArray();
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("dno", rs.getInt(1));
				obj.put("dtitle", rs.getString(2));
				obj.put("dcontent", rs.getString(3));
				obj.put("email", rs.getString(4));
				obj.put("ddate", rs.getString(5));
			
				feeds.add(obj);
			}
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return feeds.toJSONString();
	}
		
	public static String getDoc(int dno) {
		JSONObject obj = new JSONObject();
		try {
			sql="select * from doctrine where dno=?";
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				obj.put("dno", rs.getInt(1));
				obj.put("dtitle", rs.getString(2));
				obj.put("dcontent", rs.getString(3));
				obj.put("email", rs.getString(4));
				obj.put("ddate", rs.getString(5));
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}			return obj.toJSONString();
	}

	public static boolean updateDoc (String dtitle, String dcontent, int dno) {
		sql= "update doctrine set dtitle=?, dcontent=? where dno=?";
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dtitle);
			pstmt.setString(2, dcontent);
			pstmt.setInt(3, dno);
			
			if(pstmt.executeUpdate()==1) result = true;
			else result = false;
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static boolean deleteDoc (int dno) {
		sql= "delete from doctrine where dno=?";
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			
			if(pstmt.executeUpdate()==1) result = true;
			else result = false;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//작성자 이메일 조회
	public static String selectEmail(int dno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		try {
			String sql = "SELECT email FROM doctrine WHERE dno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				email = rs.getString(1);
			}
			
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return email;
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
