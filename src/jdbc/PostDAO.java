package jdbc;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class PostDAO {
	
	// 주보 등록
	public static boolean insertPost(String ptitle, String pupfolder, String puuid, String pfilename, String email)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO post(ptitle, pupfolder, puuid, pfilename, email) VALUES(?,?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ptitle);
			pstmt.setString(2, pupfolder);
			pstmt.setString(3, puuid);
			pstmt.setString(4, pfilename);
			pstmt.setString(5, email);
			
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 

		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	// 주보 등록
	public static boolean updatePost(int pno, String ptitle, String pupfolder, String puuid, String pfilename)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE post SET ptitle=?, pupfolder=?, puuid=?, pfilename=? WHERE pno = ? ";
					
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ptitle);
			pstmt.setString(2, pupfolder);
			pstmt.setString(3, puuid);
			pstmt.setString(4, pfilename);
			pstmt.setInt(5, pno);
			
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 

		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	// 주보 삭제
	public static boolean deletePost(int pno)
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM post WHERE pno = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
			return pstmt.executeUpdate() == 1 ? true : false; //성공 1이면 true, 실패 0은 false 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
//	
//	/**사진 한 장 업로드**/
//    public Boolean uploadImage(MultipartFile image, String dirName) throws Exception {
//        Boolean result = Boolean.FALSE;
//        try{
//            File folder = new File(dirName);
//            if (!folder.exists()) folder.mkdirs();
//
//            File destination = new File(dirPath + File.separator + image.getOriginalFilename());
//            image.transferTo(destination);
//
//            result = Boolean.TRUE;
//        }catch (Exception e){
//            log.error("에러 : " + e.getMessage());
//        }finally {
//            return result;
//        }
//    }
//		
//	 /**사진 여러 장 업로드**/
//    public Boolean uploadImage(List<Multipartfile> images, String dirName) throws Exception {
//        short result = -1;
//        try{
//            File folder = new File(dirName);
//            if (!folder.exists()) folder.mkdirs();
//
//            for(MultipartFile image : images) {
//                File destination = new File(dirName + File.separator + image.getOriginalFilename());
//                image.transferTo(destination);
//
//                result++;
//            }
//        }catch (Exception e){
//            log.error("에러 : " + e.getMessage());
//        }finally {
//        	if(result == -1 || result < images.size() -1) return Boolean.FALSE;
//            else if(result == images.size() -1) return Boolean.TRUE;
//            else return Boolean.FALSE;
//        }
//    }		
				
			
		
}
