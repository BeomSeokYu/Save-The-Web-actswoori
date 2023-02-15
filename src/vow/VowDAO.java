package vow;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class VowDAO {
	public static int insert(String email, String vtitle, String vcontent) throws NamingException, SQLException { // 등록

		String sql = "INSERT INTO vow (email, vtitle, vcontent) VALUES(?, ?, ?)";

		Connection conn = ConnectionPool.get();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, vtitle);
		pstmt.setString(3, vcontent);

		int result = pstmt.executeUpdate();

		return result;
	}
	
	
}
