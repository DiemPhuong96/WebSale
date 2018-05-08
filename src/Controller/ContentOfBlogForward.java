package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BlogDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ContentOfBlogForward
 */
@WebServlet("/ContentOfBlogForward")
public class ContentOfBlogForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentOfBlogForward() {
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
		String content = request.getParameter("content");
		String meta = null;
		if(content.length()>155) {
			meta = content.substring(0, 156);
		}
		else meta = content;
		
		String blogidstr = request.getParameter("blogid");
		int blogid = Integer.parseInt(blogidstr);
		Connection conn = DBConnection.CreateConnection();
		BlogDAO.insertContentAndMetaOfBlog(content, conn, blogid, meta);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Home.jsp");
		rd.forward(request, response);
	}

}
