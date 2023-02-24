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
	
	public static boolean insertNews(String ntitle, String ncontent, String nemail) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		String sql = "INSERT INTO news (ntitle, ncontent, email) VALUES (?, ?, ?)";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ntitle);
		pstmt.setString(2, ncontent);
		pstmt.setString(3, nemail);
		
		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		
		return result;
	}
	
	
	public static NewsDTO selectNews(int nno) {
		//뉴스 하나 조회
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		NewsDTO ndto = new NewsDTO();
		try {
		String sql = "SELECT * FROM news WHERE nno=?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, nno);
		
		rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
		}
			
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			ndto = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return ndto;
	}
	
	public static List<NewsDTO> selectAllNews() {
		//뉴스 목록 조회
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try {
		String sql = "SELECT * FROM news ORDER BY ndate DESC";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			NewsDTO ndto = new NewsDTO();
			
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
			newsList.add(ndto);
		}
			
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			newsList = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return newsList;
	}
	
	
	public static List<NewsDTO> selectAllNewsPaging(int pageNum, int amount) {
		//뉴스 목록 조회(페이징)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try {
		String sql = "SELECT * FROM news ORDER BY nno DESC limit ?, ?";
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, (pageNum - 1) * amount);
		pstmt.setInt(2, amount);
		
		rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			NewsDTO ndto = new NewsDTO();
			
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			ndto.setNdate(rs.getString(5));
			
			newsList.add(ndto);
		}
			
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			newsList = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return newsList;
	}
	
	public int getTotal() {

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
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	public static boolean updateNews(int nno, String ntitle, String ncontent) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		String sql = "UPDATE news SET ntitle=?, ncontent=? WHERE nno=?";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, ntitle);
		pstmt.setString(2, ncontent);
		pstmt.setInt(3, nno);

		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		
		return result;
	}
	
	public static boolean deleteNews(int nno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		String sql = "DELETE FROM news WHERE nno=?";
		
		try {
			conn = ConnectionPool.get();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, nno);

		
		result = pstmt.executeUpdate() == 1 ? true : false;
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
		
		return result;
	}
	
	public static List<NewsDTO> selectNewNews() {
		//메인용, 최신뉴스 4개만 가져오기
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try {
		String sql = "SELECT nno, ntitle, ncontent, name as email FROM news n, user u WHERE n.email = u.email ORDER BY ndate DESC limit 4";
		//이름 가져오고 싶어서 쿼리 통해서 email로 가져옴
		
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			NewsDTO ndto = new NewsDTO();
			
			ndto.setNno(rs.getString(1));
			ndto.setNtitle(rs.getString(2));
			ndto.setNcontent(rs.getString(3));
			ndto.setEmail(rs.getString(4));
			
			newsList.add(ndto);
		}
			
		
		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			newsList = null;
		} finally {
			close(conn, pstmt, rs);
		}
		return newsList;
	}
	
	//작성자 이메일 조회
	public static String selectEmail(int nno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		try {
			String sql = "SELECT email FROM news WHERE nno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
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
