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
import DAO.CategoryDAO;
import DB.DBConnection;

/**
 * Servlet implementation class CategoryResult
 */
@WebServlet("/CategoryResult")
public class CategoryResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value1 = request.getParameter("value1");
		String value2 = request.getParameter("value2");
		String categoryIdstr = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(categoryIdstr);
		Connection conn = DBConnection.CreateConnection();
		int maxPrice = ProductsDAO.MaxPrice(conn);
		List<Products> listProduct = null;
		if((value1.equals("0")== false)&&(value2.equals("0")== false)) {
			if(value2.equals("50")) {
				listProduct = CategoryDAO.selectProductOfCategorySortByPrice(conn, 0, 50, value1,categoryId);
			}
			else if(value2.equals("100")) {
				listProduct = CategoryDAO.selectProductOfCategorySortByPrice(conn, 50, 100, value1,categoryId);
			}
			else if(value2.equals("150")) {
				listProduct = CategoryDAO.selectProductOfCategorySortByPrice(conn, 100, 150,value1,categoryId);
			}
			else if(value2.equals("200")) {
				listProduct = CategoryDAO.selectProductOfCategorySortByPrice(conn, 150, 200, value1,categoryId);
			}
			else {
				listProduct = CategoryDAO.selectProductOfCategorySortByPrice(conn, 200, maxPrice, value1,categoryId);
			}
		}
		else if((value1.equals("0"))&&(value2.equals("0"))) {
			listProduct = CategoryDAO.SelectAllProductOfCategory(conn, categoryId);
		}
		else if(value1.equals("0")) {
			if(value2.equals("50")) {
				listProduct = CategoryDAO.selectProductsOfCategorySortByPrice1(conn, 0, 50,categoryId);
			}
			else if(value2.equals("100")) {
				listProduct = CategoryDAO.selectProductsOfCategorySortByPrice1(conn, 50, 100,categoryId);
			}
			else if(value2.equals("150")) {
				listProduct = CategoryDAO.selectProductsOfCategorySortByPrice1(conn, 100, 150,categoryId);
			}
			else if(value2.equals("200")) {
				listProduct = CategoryDAO.selectProductsOfCategorySortByPrice1(conn, 150, 200,categoryId);
			}
			else if(value2.equals("200")) {
				listProduct = CategoryDAO.selectProductsOfCategorySortByPrice1(conn, 200, maxPrice,categoryId);
			}
		}
		else  if(value2.equals("0")) {
				listProduct = CategoryDAO.selectProductsOfCategorySort(conn, value1,categoryId);
		}
	
		//List<Category> listCategory = ProductsDAO.selectCategory(conn);
		//request.setAttribute("listCategory", listCategory);
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher rd = request.getRequestDispatcher("View/SortingShop.jsp");
		rd.forward(request, response);
	}

}
