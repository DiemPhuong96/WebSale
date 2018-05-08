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

import BEAN.Products;
import DAO.ProductsDAO;
import DB.DBConnection;

/**
 * Servlet implementation class SortingShop
 */
@WebServlet("/SortingShop")
public class SortingShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortingShop() {
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
		String value1 = request.getParameter("value1");
		String value2 = request.getParameter("value2");
		Connection conn = DBConnection.CreateConnection();
		int maxPrice = ProductsDAO.MaxPrice(conn);
		List<Products> listProduct = null;
		if((value1.equals("0")== false)&&(value2.equals("0")== false)) {
			if(value2.equals("50")) {
				listProduct = ProductsDAO.selectProductsSortByPrice1(conn, 0, 50, value1);
			}
			else if(value2.equals("100")) {
				listProduct = ProductsDAO.selectProductsSortByPrice1(conn, 50, 100, value1);
			}
			else if(value2.equals("150")) {
				listProduct = ProductsDAO.selectProductsSortByPrice1(conn, 100, 150,value1);
			}
			else if(value2.equals("200")) {
				listProduct = ProductsDAO.selectProductsSortByPrice1(conn, 150, 200, value1);
			}
			else {
				listProduct = ProductsDAO.selectProductsSortByPrice1(conn, 200, maxPrice, value1);
			}
		}
		else if((value1.equals("0"))&&(value2.equals("0"))){
			listProduct = ProductsDAO.selectProducts(conn);
		}
		else if(value1.equals("0")) {
			if(value2.equals("50")) {
				listProduct = ProductsDAO.selectProductsSortByPrice(conn, 0, 50);
			}
			else if(value2.equals("100")) {
				listProduct = ProductsDAO.selectProductsSortByPrice(conn, 50, 100);
			}
			else if(value2.equals("150")) {
				listProduct = ProductsDAO.selectProductsSortByPrice(conn, 100, 150);
			}
			else if(value2.equals("200")) {
				listProduct = ProductsDAO.selectProductsSortByPrice(conn, 150, 200);
			}
			else {
				listProduct = ProductsDAO.selectProductsSortByPrice(conn, 200, maxPrice);
			}
		}
		else  if(value2.equals("0")) {
				listProduct = ProductsDAO.selectProductsSort(conn, value1);
		}
		
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher rd = request.getRequestDispatcher("View/SortingShop.jsp");
		rd.forward(request, response);
		
	}

}
