package DAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.Slidetop;
import DB.DBConnection;
public class SlideTopDAO {
	public static List<Slidetop> SelectListSlideTop(Connection conn){
		String sql = "select* from slidetop";
		List<Slidetop> list = new ArrayList<Slidetop>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Slidetop slidetop = new Slidetop();
				slidetop.setSlideTopId(rs.getInt("slideTopId"));
				slidetop.setSlogan1(rs.getString("slogan1"));
				slidetop.setSlogan2(rs.getString("slogan2"));
				slidetop.setImage(rs.getString("image"));
				list.add(slidetop);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
		
	}
	
	public static void InsertSloganSlideTop(Connection conn, Slidetop  st) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("insert into slidetop(slogan1,slogan2) values(?,?)");
			String slogan1 =  st.getSlogan1();
			ptmt.setString(1, slogan1);
			String slogan2 = st.getSlogan2();
			ptmt.setString(2,slogan2);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static int selectSlideTopId(String slogan1, String slogan2, Connection conn) {
		int slideTopId = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select slideTopId from slidetop where slogan1= '"+slogan1+"' and slogan2 = '"+slogan2+"'");
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				slideTopId = rs.getInt("slideTopId");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return slideTopId;
	}
	
	public static  String UploadImageSlideTop(HttpServletRequest request, int slideTopId) {
		String test = null;
		ServletContext context = request.getServletContext();
		final int MaxMemorySize = 1024*1024*5;
		final int MaxRequestSize = 1024*1024*5;
		final String Adress = context.getRealPath("/ImageUpload/");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {
			test = "there is no ismutipart";
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MaxMemorySize);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(MaxRequestSize);
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			
			while(iter.hasNext()) {
				FileItem item = iter.next();
				
				if(!item.isFormField()) {
					String fileName = item.getName();
				
						SlideTopDAO.insertImageSlideTop(slideTopId, fileName);
					
					String pathFile = Adress + File.separator + fileName;
					File uploadFile = new File(pathFile);
					boolean kt = uploadFile.exists();
					
						if(kt == true) {
							test = "File exits";
						}
						else {
							
								try {
									item.write(uploadFile);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							
							test = "Success";
							
						}
				
				}
				
				else {
					test = "fail";
				}
			}
		} catch (FileUploadException e) {
		
			e.printStackTrace();
		}
	
		return test;
		
	}
	
	public static void insertImageSlideTop(int slideTopId, String image) {
		Connection conn = DBConnection.CreateConnection();
		try {
			PreparedStatement ptmt = conn.prepareStatement("update slidetop set image =? where slideTopId = "+slideTopId);
			ptmt.setString(1, image);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public static void UpdateSloganSlideTop(Connection conn, Slidetop  st, int slideTopId) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("update slidetop set slogan1 = ?, slogan2 = ? where slideTopId = "+slideTopId);
			String slogan1 =  st.getSlogan1();
			ptmt.setString(1, slogan1);
			String slogan2 = st.getSlogan2();
			ptmt.setString(2,slogan2);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteSlideTop(Connection conn, int slideTopId) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("delete from slidetop where slideTopId="+slideTopId);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
