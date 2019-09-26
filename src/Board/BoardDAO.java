package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Util.DB;

public class BoardDAO {
	
	public int newBoard(BoardDTO board) {
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
	
	
}
