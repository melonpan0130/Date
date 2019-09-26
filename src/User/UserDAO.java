package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Util.DB;

public class UserDAO {
	
	public static int join(UserDTO user) { 
		String sql = "INSERT INTO USER(NAME, EMAIL, PW) VALUE(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPw());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try{ pstmt.close(); }catch(Exception e) { e.printStackTrace(); }
			if(conn != null) try{ conn.close(); }catch(Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public static int login(String email, String pw) {
		String sql = "SELECT pw FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs.getString("pw"));
				System.out.println(pw);
				if(rs.getString("pw").equals(pw)) // Member
					return 0;
				else // PW is not correct
					return 1;
			} else {
				// Email is not correct
				return 2;
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{ rs.close(); }catch(Exception e) { e.printStackTrace(); }
			if(pstmt != null) try{ pstmt.close(); }catch(Exception e) { e.printStackTrace(); }
			if(conn != null) try{ conn.close(); }catch(Exception e) { e.printStackTrace(); }
		}
		return -1; // DB Error
	}
}
