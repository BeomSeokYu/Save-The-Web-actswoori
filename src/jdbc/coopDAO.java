package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.naming.NamingException;
import util.ConnectionPool;

public class coopDAO {

//협력기관소식 게시판 등록
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

//협력기관소식 게시판 목록
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

//게시판 상세보기
public coopDTO select(int cno) throws SQLException, NamingException  {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	coopDTO cdto = null;
	
	try {
		String sql = "SELECT * FROM coop WHERE cno =?";

		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cno);
				
		rs = pstmt.executeQuery(); 	
		
		if(rs.next()) {	
			cdto = new coopDTO();
			cdto.setCno(rs.getInt("cno"));
			cdto.setCtitle(rs.getString("ctitle"));
			cdto.setCcontent(rs.getString("ccontent"));
			cdto.setEmail(rs.getString("email"));
			cdto.setCdate(rs.getString("cdate"));
			
		} return cdto;
		
	}finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}

}

//협력기관소식 게시판 수정
public static int update(int cno, String ctitle, String ccontent) throws SQLException, NamingException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
	String sql = "UPDATE coop SET ctitle=?, ccontent=? WHERE cno=?";

	conn = ConnectionPool.get();
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ctitle);
		pstmt.setString(2, ccontent);
		pstmt.setInt(3, cno);

		
		int result = pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
		return result; 
		
	}finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}

//게시판 글 삭제
public static int delete(int cno) throws NamingException, SQLException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		String sql = "DELETE FROM coop WHERE cno = ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
		return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
	}finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}

//페이징
public static ArrayList<coopDTO> getListpaging(int pageNum, int amount) throws NamingException, SQLException {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT * FROM coop ORDER BY cno DESC limit ?,?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,(pageNum-1)*amount);
				pstmt.setInt(2,amount);
				
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

public int getTotal() throws SQLException {

    int result = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
    String sql = "select count(*) as total from coop";
    
    conn = ConnectionPool.get();
    pstmt = conn.prepareStatement(sql);
    
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
       result = rs.getInt("total");
       
    }
    
    } catch (SQLException | NamingException e) {
       e.printStackTrace();
    } finally {
       if(rs != null) rs.close();
       if(pstmt != null) pstmt.close();
       if(conn != null) conn.close();
    }
    
    
    return result;
 }

}



