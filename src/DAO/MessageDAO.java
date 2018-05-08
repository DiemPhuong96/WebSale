package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MessageDAO {
	public static void insertMassage(Connection conn, String name, String phone, String email, String messa) {
		String sql = "insert into message(name, phoneNumber, email, content) values(?,?,?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, name);
			ptmt.setString(2, phone);
			ptmt.setString(3, email);
			ptmt.setString(4, messa);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
