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
 * Servlet implementation class BlogFrontEndForward
 */
@WebServlet("/BlogFrontEndForward")
public class BlogFrontEndForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogFrontEndForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageIdstr = request.getParameter("pageid");
		int pageid = Integer.parseInt(pageIdstr);
		int count = 4;
		if(pageid!=1) {
			pageid = pageid -1;
			pageid = pageid*count +1;
		}
		
		Connection conn = DBConnection.CreateConnection();
		int sumRow = BlogDAO.countRow(conn);
		int maxpageid = 0;
		if(sumRow < count) {
			maxpageid = 0;
		}
		else {
			if(maxpageid %2 == 0) {
				maxpageid = sumRow/count;
			}
			else {
				maxpageid = sumRow/count +1;
			}
			
		}
		int countrow = ProductsDAO.countRow(conn);
		if(countrow > 5) {
			countrow = countrow - 5;
		}
		else countrow = 1;
		List<Products> listProduct = ProductsDAO.selectProduct(countrow, 5, conn);
		request.setAttribute("listProduct", listProduct);
		List<Blog> listBlog = BlogDAO.selectBlogFront(conn, pageid,count);
		List<Categoryforblog> listCategoryforblog = BlogDAO.selectCategoryOfBlog(conn);
		request.setAttribute("listCategoryforblog", listCategoryforblog);
		request.setAttribute("listBlog", listBlog);
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("numberpage", pageid);
		RequestDispatcher rd = request.getRequestDispatcher("View/BlogPage.jsp");
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
