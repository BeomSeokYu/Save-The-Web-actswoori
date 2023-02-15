package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;

public class coopDAO {
	
public static int insert(String ctitle, String ccontent) throws SQLException, NamingException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
	String sql = "INSERT INTO coop (ctitle, ccontent) VALUES(?,?)";

	conn = ConnectionPool.get();
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ctitle);
		pstmt.setString(2, ccontent);

		
		int result = pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
		return result; 
		
	}finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	}

public static ArrayList<coopDTO> getList() throws NamingException, SQLException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT * FROM coop ORDER BY cdate DESC";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); 
		
		ArrayList<coopDTO> coops = new ArrayList<coopDTO>();
		
		while(rs.next()) {
			coops.add(new coopDTO(rs.getInt(1),
								  rs.getString(2),
								  rs.getString(3),
								  rs.getString(4),
								  rs.getString(5)));

		}return coops;
		
	}finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
}