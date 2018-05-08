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

import BEAN.Productcategory;
import BEAN.Products;
import BEAN.Size;
import DAO.ProductsDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ProductsCategoryController
 */
@WebServlet("/ProductsCategoryController")
public class ProductsCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsCategoryController() {
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
		Connection conn = DBConnection.CreateConnection();
		String categoryIdstr = request.getParameter("dropCategory");
		int categoryId = Integer.parseInt(categoryIdstr);
		List<Productcategory> list = ProductsDAO.selectProductcategory(conn, categoryId);
		List<Size> listSize = ProductsDAO.selectSize(conn, categoryId);
	
		
		String pageIdstr = request.getParameter("pageid");
		int pageid = Integer.parseInt(pageIdstr);
		int count = 8;
		int pageid1  =0;
		if(pageid!=1) {
			pageid1 = pageid -1;
			pageid1 = pageid*count +1;
		}
	
		List<Products> listPro = ProductsDAO.selectProduct(pageid1, count, conn);
		int sumRow = ProductsDAO.countRow(conn);
		int maxpageid = 0;
		if(sumRow < count) {
			maxpageid = 0;
		}
		else {
			if(maxpageid %2 != 0) {
				maxpageid = sumRow/count + 1;
			}
			else {
				maxpageid = sumRow/count;
			}
			
		}

		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listProducts", listPro);
		request.setAttribute("listprocare", list);
		request.setAttribute("numberpage", pageid);
		request.setAttribute("listSize", listSize);
		request.setAttribute("categoryId", categoryId);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ProductsCategory.jsp");
		rd.forward(request, response);
	}

}
