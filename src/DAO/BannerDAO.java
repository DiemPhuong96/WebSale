package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Banner;
public class BannerDAO {
	public static List<Banner> listBanner(Connection conn){
		
	List<Banner> list = new ArrayList<Banner>();
	try {
		PreparedStatement ptmt = conn.prepareStatement("select* from Banner");
		ResultSet rs = ptmt.executeQuery();
		while(rs.next()) {
			Banner bn = new Banner();
			bn.setName(rs.getString("name"));
			bn.setImage(rs.getString("image"));
			int bannerId = rs.getInt("bannerId");
			bn.setBannerId(bannerId);
			list.add(bn);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	return list;
	}
	
	public static void UpdateNameOfProduct(Connection conn, String name, int bannerId) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("update banner set name = ?where bannerId ="+bannerId);
			ptmt.setString(1, name);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void insertImageBanner(String image, Connection conn, int bannerId) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("update banner set image =? where bannerId ="+bannerId);
			ptmt.setString(1, image);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
