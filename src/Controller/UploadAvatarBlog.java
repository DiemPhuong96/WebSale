package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.BlogDAO;
import DB.DBConnection;

/**
 * Servlet implementation class UploadAvatarBlog
 */
@WebServlet("/UploadAvatarBlog")
public class UploadAvatarBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadAvatarBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String blogidstr = request.getParameter("blogid");
		int blogid = Integer.parseInt(blogidstr);
		Connection conn = DBConnection.CreateConnection();
		ServletContext context = request.getServletContext();
		final String address = context.getRealPath("/ImageUpload/");
		final int maxMemorySize = 1024*1024*10;
		final int maxRequestSize = 1024*1024*5;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {
			request.setAttribute("msgAvatar", "there is not  multipart/form-data");
			request.setAttribute("blogid", blogid);
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadAvatarOfBlog.jsp");
			rd.forward(request, response);
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setSizeThreshold(maxMemorySize);
		File file = new File(System.getProperty("java.io.tmpdir"));
		factory.setRepository(file);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(maxRequestSize);
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()) {
				FileItem item = iter.next();
				if(!item.isFormField()) {
					String filename = item.getName();
					String pathFile = address  + File.separator +filename;
					File uploadFile = new File(pathFile);
					boolean kt = uploadFile.exists();
					if(kt) {
						request.setAttribute("msgAvatar", "file exists");
						request.setAttribute("blogid", blogid);
						RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadAvatarOfBlog.jsp");
						rd.forward(request, response);
					}
					else {
						try {
							item.write(uploadFile);
							BlogDAO.uploadAvatarBlog(conn, filename, blogid);
							request.setAttribute("blogid", blogid);
							RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditContent.jsp");
							rd.forward(request, response);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
				}
				else {
					request.setAttribute("msgAvatar", "upload file fail");
					request.setAttribute("blogid", blogid);
					RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadAvatarOfBlog.jsp");
					rd.forward(request, response);
				}
				
			}
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
