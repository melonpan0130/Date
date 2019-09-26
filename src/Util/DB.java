package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/date?autoReconnect=true&useSSL=false&serverTimezone=UTC ";
			String user = "root";
			String pw = "1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url, user, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
