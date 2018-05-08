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


import DAO.ProductsDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ShopResult
 */
@WebServlet("/ShopResult")
public class ShopResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int counNew = 3;
		Connection conn = DBConnection.CreateConnection();

		int countrow = ProductsDAO.countRow(conn);
		int countNewProudct = 0;
		if(countrow >= counNew) {
			countNewProudct = countrow - counNew +1;
		}
		else countNewProudct = 1;
	
		
		List<Category> listCategory = ProductsDAO.selectCategory(conn);
		request.setAttribute("listCategory", listCategory);
		List<Products> listNewProduct = null;
		List<Products> listProduct = ProductsDAO.selectProducts(conn);
		
		
		

		listNewProduct = ProductsDAO.selectProduct(countNewProudct, counNew, conn);
		request.setAttribute("listNewProduct", listNewProduct);
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher rd = request.getRequestDispatcher("View/ShopResult.jsp");
		rd.forward(request, response);
	}

}
