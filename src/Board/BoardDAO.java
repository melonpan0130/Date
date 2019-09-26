package Board;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DB;

public class BoardDAO {
	
	public static int newBoard(BoardDTO board) throws SQLException {
		String sql = "INSERT INTO BOARD(USERID, TITLE, CONTENT, STARTTIME, ENDTIME) VALUE(?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getUserid());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setTimestamp(4, board.getStarttime());
			pstmt.setTimestamp(5, board.getEndtime());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static byte[] imageToByteArray(String filePath) throws Exception {
		byte[] returnValue = null;
		
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;
		
		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);
			byte[] buf = new byte[1024];
			int read = 0;
			
			while((read = fis.read(buf, 0, buf.length))!=-1) {
				baos.write(buf, 0, read);
			}
			returnValue = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnValue;
	}
	
	public static ResultSet getBoard(int boardid) throws SQLException {
		String sql = "SELECT * FROM board WHERE boardid = ?";
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
		}
		return null;
	}
}
