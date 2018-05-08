package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import java.util.Date;

import BEAN.Member;

public class RegisterAndLoginDAO {
	public static void InsertInformationMember(Member mb, Connection conn) {
		String sql = "insert into Member(name, password, email, phone, created, memberCategoryId) values(?,?,?,?,?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, mb.getName());
			ptmt.setString(2, mb.getPassword());
			ptmt.setString(3, mb.getEmail());
			ptmt.setString(4, mb.getPhone());
			Date today=new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss dd/MM/yy");
			String created = timeFormat.format(today);
			ptmt.setString(5, created);
			ptmt.setInt(6, 2);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String selectInformationMember(Connection conn, Member mb) {
		String sql = "select* from member";
		String test = "not find";

		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				if((mb.getEmail().equals(rs.getString("email")))&&(mb.getPassword().equals(rs.getString("password")))) {
					if(rs.getInt("memberCategoryId") == 1) {
						test = "admin";
						return test;
				
					}
					else {
						test = "customer";
						return test;
					}
				}
								
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return test;
	}
	
	public static int selectMemberId(Connection conn, Member mb) {
		int memberId = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select* from member");
			ResultSet rs = ptmt.executeQuery();
			
			while(rs.next()) {
				if((mb.getEmail().equals(rs.getString("email")))&&(mb.getPassword().equals(rs.getString("password")))) {
					memberId = rs.getInt("memberId");
				}
						
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberId;
	}

	public static String selectMemberName(Connection conn, Member mb) {
		String membername = null;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select* from member");
			ResultSet rs = ptmt.executeQuery();
			
			while(rs.next()) {
				if((mb.getEmail().equals(rs.getString("email")))&&(mb.getPassword().equals(rs.getString("password")))) {
					membername = rs.getString("name");
				}

								
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return membername;
	}
	
	
	public static boolean compareEmail(Connection conn, String email) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("select email from member");
			ResultSet rs = ptmt.executeQuery();
			
			while(rs.next()) {
				if(email.equals(rs.getString("email")));
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}

}
