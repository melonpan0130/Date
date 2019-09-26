package Board;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import Util.DB;

public class BoardDAO {
	
	public static int newBoard(BoardDTO board) {
		String sql = "INSERT INTO BOARD(USERID, TITLE, CONTENT, STARTTIME, ENDTIME) VALUE(?, ?, ?, ?, ?)";
		try {
			Connection conn = DB.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
		} finally {
			if(baos != null) baos.close();
			if(fis != null) fis.close();
		}
		
		return returnValue;
	}
}
