package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Blog;
import BEAN.Categoryforblog;
import DAO.BlogDAO;
import DB.DBConnection;

/**
 * Servlet implementation class BlogForward
 */
@WebServlet("/BlogForward")
public class BlogForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		List<Blog> listBlog = BlogDAO.selectBlog(conn);
		
		List<Categoryforblog> listCategoryforblog = BlogDAO.selectCategoryOfBlog(conn);
		request.setAttribute("listBlog", listBlog);
		request.setAttribute("listCategoryforblog", listCategoryforblog);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Blog.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
