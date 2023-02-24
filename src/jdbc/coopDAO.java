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

public class coopDAO {

//협력기관소식 게시판 등록
public static int insert(String ctitle, String ccontent, String email) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	try {
	String sql = "INSERT INTO coop (ctitle, ccontent,email) VALUES(?,?,?)";

	conn = ConnectionPool.get();
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ctitle);
		pstmt.setString(2, ccontent);
		pstmt.setString(3, email);

		
		result = pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
    } finally {
    	close(conn, pstmt, null);
    }
	return result; 
}

//협력기관소식 게시판 목록
public static ArrayList<coopDTO> getList() {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<coopDTO> coops = new ArrayList<coopDTO>();
	try {
		String sql = "SELECT * FROM coop ORDER BY cdate DESC";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			coops.add(new coopDTO(rs.getInt(1),
								  rs.getString(2),
								  rs.getString(3),
								  rs.getString(4),
								  rs.getString(5)));

		}
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
       coops = null;
    } finally {
    	close(conn, pstmt, rs);
    }
	return coops;
}

//게시판 상세보기
public static coopDTO select(int cno) {
	
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
		}
			
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
    } finally {
    	close(conn, pstmt, rs);
    }
	return cdto;
}

//협력기관소식 게시판 수정
public static int update(int cno, String ctitle, String ccontent) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	try {
	String sql = "UPDATE coop SET ctitle=?, ccontent=? WHERE cno=?";

	conn = ConnectionPool.get();
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ctitle);
		pstmt.setString(2, ccontent);
		pstmt.setInt(3, cno);

		
		result = pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
		return result; 
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
    } finally {
    	close(conn, pstmt, null);
    }
	return result;
}

//게시판 글 삭제
public static int delete(int cno) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	try {
		String sql = "DELETE FROM coop WHERE cno = ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cno);
		
		result = pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
    } finally {
    	close(conn, pstmt, null);
    }
	
	return result;
}

//페이징
public static ArrayList<coopDTO> getListpaging(int pageNum, int amount) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<coopDTO> coops = new ArrayList<coopDTO>();
	try {
		String sql = "SELECT * FROM coop ORDER BY cno DESC limit ?,?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,(pageNum-1)*amount);
				pstmt.setInt(2,amount);
				
		rs = pstmt.executeQuery(); 
		
		
		while(rs.next()) {
			coops.add(new coopDTO(rs.getInt(1),
								  rs.getString(2),
								  rs.getString(3),
								  rs.getString(4),
								  rs.getString(5)));

		}
		
	} catch (SQLException | NamingException e) {
       e.printStackTrace();
       coops = null;
    } finally {
    	close(conn, pstmt, rs);
    }
	return coops;
}

public int getTotal() {

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
    	close(conn, pstmt, rs);
    }
    
    
    return result;
 }

//사진 목록 가져오기 (AJAX)
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



