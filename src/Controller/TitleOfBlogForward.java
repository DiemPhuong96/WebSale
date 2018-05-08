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
 * Servlet implementation class TitleOfBlogForward
 */
@WebServlet("/TitleOfBlogForward")
public class TitleOfBlogForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitleOfBlogForward() {
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
		String title = request.getParameter("title");
		String CategoryForBlogIdstr = request.getParameter("dropCategory");
		int CategoryForBlogId = Integer.parseInt(CategoryForBlogIdstr);
		Connection conn = DBConnection.CreateConnection();
		BlogDAO.insertTitleAndCategoryOfBlog(title,CategoryForBlogId, conn);
		int blogid = BlogDAO.selectBlogId(title, conn);
		request.setAttribute("blogid", blogid);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadAvatarOfBlog.jsp");
		rd.forward(request, response);
	}

}
