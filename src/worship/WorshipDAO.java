package worship;

import java.sql.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class WorshipDAO {
	public static int insert(String email, String wtitle, String wcontent) throws NamingException, SQLException { // 등록

		String sql = "INSERT INTO worship (email, wtitle, wcontent) VALUES(?, ?, ?)";

		Connection conn = ConnectionPool.get();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, wtitle);
		pstmt.setString(3, wcontent);

		int result = pstmt.executeUpdate();

		return result;
	}
	
	
}
