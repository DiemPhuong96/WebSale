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

import BEAN.Category;
import BEAN.Products;
import BEAN.Slidetop;
import DAO.CategoryDAO;
import DAO.ProductsDAO;
import DAO.SlideTopDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ProductCateForward
 */
@WebServlet("/ProductCateForward")
public class ProductCateForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCateForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate = request.getParameter("cate");
		List<Products> listpro = null;
		Connection conn = DBConnection.CreateConnection();
		List<Slidetop> slideTop = SlideTopDAO.SelectListSlideTop(conn);
		List<Category> listCategory = ProductsDAO.selectCategory(conn);
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("slideTop", slideTop);
		if(cate.equals("1")) {
			listpro = CategoryDAO.selectProductOfCategory(conn, 1);
		}
		else if(cate.equals("2")) {
			listpro = CategoryDAO.selectProductOfCategory(conn, 2);
		}
		else {
			listpro = CategoryDAO.selectProductOfCategory(conn, 3);
		}
		request.setAttribute("listProduct", listpro);
		RequestDispatcher rd = request.getRequestDispatcher("View/Banner.jsp");
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
