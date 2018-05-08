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

import DAO.VideoDAO;
import DB.DBConnection;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/VideoController")
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/NewVideo.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = DBConnection.CreateConnection();
		ServletContext context = request.getServletContext();
		final int MaxMemorySize = 1024*1024*5;
		final int MaxRequestSize = 1024*1024*5;
		String address = context.getRealPath("/ImageUpload/");
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {
			request.setAttribute("videomsg", "There is no multipart");
			
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/NewVideo.jsp");
			rd.forward(request, response);
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MaxMemorySize);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MaxRequestSize);
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Iterator<FileItem> iter = items.iterator();
		while(iter.hasNext()) {
			FileItem item = iter.next();
			if(!item.isFormField()) {
				String fileName = item.getName();
				
				String pathFile = address + File.separator +fileName;
				File uploadFile = new File(pathFile);
				boolean kt = uploadFile.exists();
				if(kt == true) {
					request.setAttribute("videomsg", "File exits");
					
					RequestDispatcher rd = request.getRequestDispatcher("View/Admin/NewVideo.jsp");
					rd.forward(request, response);
				}
				else {
					
						try {
							item.write(uploadFile);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						VideoDAO.uploadAvatarProduct(conn, fileName);
						RequestDispatcher rd = request.getRequestDispatcher("AdminForward");
						rd.forward(request, response);
					
				}
			}
			else {
				request.setAttribute("videomsg", "Upload file is fail");
				
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/NewVideo.jsp");
				rd.forward(request, response);
			}
		}
		
	}

}
