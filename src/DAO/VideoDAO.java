package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Video;
public class VideoDAO {
	public static void uploadAvatarProduct(Connection conn, String image){
		PreparedStatement ptmt = null;
		String sql = "update video set image =?  where videoId = 1";
	
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

	public static void AddLinkVideoProduct(Connection conn, String video){
		PreparedStatement ptmt = null;
		String sql = "update video set video =?  where videoId = 1";
	
			try {
				ptmt = conn.prepareStatement(sql);
				
				ptmt.setString(1,video);
			
				
				ptmt.executeUpdate();
				
				
				
				ptmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	
	}
	
	public static List<Video> selectVideo(Connection conn) {
		String sql = "select* from video where videoId = 1";
		List<Video> list = new ArrayList<Video>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Video video = new Video();
				video.setVideo(rs.getString("video"));
				video.setImage(rs.getString("image"));
				list.add(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
