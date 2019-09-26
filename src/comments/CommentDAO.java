package comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Board.BoardDTO;
import Util.DB;

public class CommentDAO {
	public static int newComment(CommentDTO comment) throws SQLException {
		String sql = "INSERT INTO COMMENTS(BOARDID, WRITERID, CONTENT) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comment.getBoardid());
			pstmt.setInt(2, comment.getWriterid());
			pstmt.setString(3, comment.getContent());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return -1;
	}
	
	public static int reply(CommentDTO comment) throws SQLException {
		String sql = "INSERT INTO COMMENTS(BOARDID, WRITERID, CONTENT, DEPTH, PARENTID) values(?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comment.getBoardid());
			pstmt.setInt(2, comment.getWriterid());
			pstmt.setString(3, comment.getContent());
			pstmt.setInt(4, comment.getDepth());
			pstmt.setInt(5, comment.getParentid());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return -1;
	}
	
	public static ResultSet viewComment(int boardid) throws SQLException {
		String sql = "SELECT * FROM comments WHERE boardid = ?";
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs;
			} else return null;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return null;
	}
}
