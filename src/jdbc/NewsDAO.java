package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

/*최초작성자 : 김예건
최초작성일 : 2023/02/16

버전  기록 : 1.0(시작 23/02/16)*/

public class NewsDAO {
	
	public static boolean insertNews(String ntitle, String ncontent, String nemail) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result;
		
		String sql = "INSERT INTO news (ntitle, ncontent, email) VALUES (?, ?, ?)";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ntitle);
		pstmt.setString(2, ncontent);
		pstmt.setString(3, nemail);
		
		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	
	public static NewsDTO selectNews(int nno) throws NamingException, SQLException {
		//뉴스 하나 조회
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		String sql = "SELECT * FROM news WHERE nno=?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, nno);
		
		rs = pstmt.executeQuery();
		
		NewsDTO ndto = new NewsDTO();
		
		while (rs.next()) {
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
		}
			
		return ndto;
		
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public static List<NewsDTO> selectAllNews() throws NamingException, SQLException {
		//뉴스 목록 조회
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		String sql = "SELECT * FROM news ORDER BY ndate DESC";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		List<NewsDTO> newsList = new ArrayList<NewsDTO>();
		
		while (rs.next()) {
			NewsDTO ndto = new NewsDTO();
			
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
			newsList.add(ndto);
		}
			
		return newsList;
		
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	public static List<NewsDTO> selectAllNewsPaging(int pageNum, int amount) throws NamingException, SQLException {
		//뉴스 목록 조회(페이징)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		String sql = "SELECT * FROM news ORDER BY nno DESC limit ?, ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, (pageNum - 1) * amount);
		pstmt.setInt(2, amount);
		
		rs = pstmt.executeQuery();
		
		List<NewsDTO> newsList = new ArrayList<NewsDTO>();
		
		while (rs.next()) {
			NewsDTO ndto = new NewsDTO();
			
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
			newsList.add(ndto);
		}
			
		return newsList;
		
		} finally {
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
		String sql = "select count(*) as total from news";
		
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
	
	public static boolean updateNews(int nno, String ntitle, String ncontent) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result;
		
		String sql = "UPDATE news SET ntitle=?, ncontent=? WHERE nno=?";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ntitle);
		pstmt.setString(2, ncontent);
		pstmt.setInt(3, nno);

		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	public static boolean deleteNews(int nno) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result;
		
		String sql = "DELETE FROM news WHERE nno=?";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, nno);

		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	
	
}
