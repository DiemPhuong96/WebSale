package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Blog;
import BEAN.Categoryforblog;

public class BlogDAO {
	public static void insertTitleAndCategoryOfBlog(String title, int CategoryForBlogId, Connection conn) {
		String sql = "insert into Blog(Name, CategoryForBlogId) values(?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, title);
			ptmt.setInt(2, CategoryForBlogId);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void insertContentAndMetaOfBlog(String content, Connection conn, int blogid,String meta) {
		String sql = "update blog set Content = ?, Meta = ? where BlogId = "+blogid;
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, content);
			ptmt.setString(2, meta);
			ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static int selectBlogId(String title, Connection conn) {
		int id = 0;
		String sql = "select BlogId from blog where Name = '"+title+"'";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = 	ptmt.executeQuery();
			while(rs.next()) {
				id = rs.getInt("BlogId");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public static void uploadAvatarBlog(Connection conn, String image, int blogid){
		PreparedStatement ptmt = null;
		String sql = "update blog set Image =? where BlogId="+blogid;
	
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
	
	public static List<Blog> selectBlogFront(Connection conn, int start, int count){
		String sql = "select* from blog limit "+(start -1)+", "+count;
		List<Blog> list = new ArrayList<Blog>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Blog blog = new Blog();
				blog.setBlogId(rs.getInt("BlogId"));
				blog.setCategoryForBlogId(rs.getInt("CategoryForBlogId"));
				blog.setContent(rs.getString("Content"));
				blog.setImage(rs.getString("Image"));
				blog.setName(rs.getString("Name"));
				blog.setMeta(rs.getString("Meta"));
			list.add(blog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	

	public static Blog selectBlog(Connection conn, int blogid){
		String sql = "select* from blog where BlogId = "+blogid;
		Blog blog = new Blog();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();

			while(rs.next()) {
				blog.setBlogId(rs.getInt("BlogId"));
				blog.setCategoryForBlogId(rs.getInt("CategoryForBlogId"));
				blog.setContent(rs.getString("Content"));
				blog.setImage(rs.getString("Image"));
				blog.setName(rs.getString("Name"));
				blog.setMeta(rs.getString("Meta"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return blog;
	}
	

	
	
	public static List<Blog> selectBlog(Connection conn){
		String sql = "select* from blog";
		List<Blog> list = new ArrayList<Blog>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Blog blog = new Blog();
				blog.setBlogId(rs.getInt("BlogId"));
				blog.setCategoryForBlogId(rs.getInt("CategoryForBlogId"));
				blog.setContent(rs.getString("Content"));
				blog.setImage(rs.getString("Image"));
				blog.setName(rs.getString("Name"));
				blog.setMeta(rs.getString("Meta"));
			list.add(blog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Categoryforblog> selectCategoryOfBlog(Connection conn){
		String sql = "select* from categoryforblog";
		List<Categoryforblog> list = new ArrayList<Categoryforblog>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Categoryforblog categoryforblog = new Categoryforblog();
				categoryforblog.setCategoryForBlogId(rs.getInt("CategoryForBlogId"));
				categoryforblog.setName(rs.getString("Name"));
			list.add(categoryforblog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void deleteBlog(Connection conn, int blogId){
		String sql = "delete from blog where BlogId ="+blogId;
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static int countRow(Connection conn) {
		int count = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select count(*) from blog");
			ResultSet rs = ptmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	public static List<Blog> searchBlog(Connection conn, String name){
		String sql = "select* from blog where Name like '%"+name+"%'";
		List<Blog> list = new ArrayList<Blog>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Blog blog = new Blog();
				blog.setBlogId(rs.getInt("BlogId"));
				blog.setCategoryForBlogId(rs.getInt("CategoryForBlogId"));
				blog.setContent(rs.getString("Content"));
				blog.setImage(rs.getString("Image"));
				blog.setMeta(rs.getString("Meta"));
				blog.setName(rs.getString("Name"));
				list.add(blog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
