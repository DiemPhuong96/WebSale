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
 * Servlet implementation class SearchBlog
 */
@WebServlet("/SearchBlog")
public class SearchBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBlog() {
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
		String name = request.getParameter("name");
		Connection conn = DBConnection.CreateConnection();
		List<Blog> listBlog = BlogDAO.searchBlog(conn, name);
		
		if(listBlog.size()==  0) {
			request.setAttribute("msg", "Not found");
		}
		int countrow = ProductsDAO.countRow(conn);
		if(countrow > 5) {
			countrow = countrow - 5;
		}
		else countrow = 1;
		List<Products> listProduct = ProductsDAO.selectProduct(countrow, 5, conn);
		request.setAttribute("listProduct", listProduct);
		List<Categoryforblog> listCategoryforblog = BlogDAO.selectCategoryOfBlog(conn);
		request.setAttribute("listCategoryforblog", listCategoryforblog);
		request.setAttribute("listBlog", listBlog);
		RequestDispatcher rd = request.getRequestDispatcher("View/SearchBlog.jsp");
		rd.forward(request, response);
		
	}

}
