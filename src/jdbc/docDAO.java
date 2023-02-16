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
	
	public static boolean insertDoc (String dtitle, String dcontent) {
		sql= "insert into doctrine (dtitle, dcontent) values (?,?)";
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dtitle);
			pstmt.setString(2, dcontent);
			
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
		sql="select * from doctrine where dno=?";
		docDTO doc = new docDTO();
		JSONObject obj = new JSONObject();
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			rs = pstmt.executeQuery();
			obj.put("dno", rs.getInt(1));
			obj.put("dtitle", rs.getString(2));
			obj.put("dcontent", rs.getString(3));
			obj.put("email", rs.getString(4));
			obj.put("ddate", rs.getString(5));
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
		return obj.toJSONString();
	}

	public static boolean updateDoc (String dtitle, String dcontent, int dno) {
		sql= "update doctrine set dtitle=?, dcontent=? where bno=?";
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
		sql= "delete from doctrine where bno=?";
		try {
			con = ConnectionPool.get();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			
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
	

}
