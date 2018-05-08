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
import BEAN.Products;
import DAO.BlogDAO;
import DAO.ProductsDAO;
import DB.DBConnection;

/**
 * Servlet implementation class DetailBlog
 */
@WebServlet("/DetailBlog")
public class DetailBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String blogIdstr = request.getParameter("blogid");
		int blogid = Integer.parseInt(blogIdstr);
		Connection conn =  DBConnection.CreateConnection();
		Blog blog = BlogDAO.selectBlog(conn, blogid);
		List<Categoryforblog> listCategoryforblog = BlogDAO.selectCategoryOfBlog(conn);
		int countrow = ProductsDAO.countRow(conn);
		if(countrow > 5) {
			countrow = countrow - 5;
		}
		else countrow = 1;
		List<Products> listProduct = ProductsDAO.selectProduct(countrow, 5, conn);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("blog", blog);
		request.setAttribute("listCategoryforblog", listCategoryforblog);
		RequestDispatcher rd = request.getRequestDispatcher("View/BlogDetail.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
