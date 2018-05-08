package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BEAN.About;

public class AboutDAO {
	public static void uploadAvatarAbout(Connection conn, String image){
		PreparedStatement ptmt = null;
		String sql = "update about set image =? where aboutId=1";
			try {
				ptmt = conn.prepareStatement(sql);
				
				ptmt.setString(1,image);
				
				
				ptmt.executeUpdate();
				
				
				
				ptmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}	
	
	public static void insertTitileAbout(Connection conn, String name, String content){
		PreparedStatement ptmt = null;
		String sql = "update about set name =?, content =? where aboutId=1";
	
			try {
				ptmt = conn.prepareStatement(sql);
				
				ptmt.setString(1,name);
				ptmt.setString(2, content);
				
				ptmt.executeUpdate();
				
				
				
				ptmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	
	public static About selectAbout(Connection conn){
		PreparedStatement ptmt = null;
		String sql = "select* from about about where aboutId=1";
		About about = new About();
			try {
				ptmt = conn.prepareStatement(sql);
				ResultSet rs = ptmt.executeQuery();
				while(rs.next()) {
					about.setContent(rs.getString("content"));
					about.setImage(rs.getString("image"));
					about.setName(rs.getString("name"));
				}
				
				
				
				ptmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	return about;
	}

}
