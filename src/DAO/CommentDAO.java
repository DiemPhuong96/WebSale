package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import BEAN.Comment;
public class CommentDAO {
	public static List<Comment> selectCmt(Connection conn, int blogId){
		List<Comment> list = new ArrayList<Comment>();
		String sql = "select* from comment where blogId ="+ blogId;
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment();
				cmt.setBlogid(rs.getInt("blogid"));
				cmt.setCommentId(rs.getInt("commentId"));
				cmt.setContent(rs.getString("content"));
				cmt.setEmail(rs.getString("email"));
				cmt.setName(rs.getString("name"));
				cmt.setDate(rs.getString("date"));
				list.add(cmt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void insertCmt(Connection conn, int blogId, String content, String email, String name) {
		String sql = "insert into comment(blogid,content,email,name,date) values(?,?,?,?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, blogId);
			ptmt.setString(2, content);
			ptmt.setString(3, email);
			ptmt.setString(4, name);
			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss: dd:mm:yy");
			String date = timeFormat.format(today);
			ptmt.setString(5, date);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
