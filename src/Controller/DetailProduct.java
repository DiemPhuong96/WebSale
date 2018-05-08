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

import BEAN.ImageProducts;
import BEAN.Products;
import DAO.ProductsDAO;
import DB.DBConnection;

/**
 * Servlet implementation class DetailProduct
 */
@WebServlet("/DetailProduct")
public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String prodcutIdstr = request.getParameter("productId");
			int productId = Integer.parseInt(prodcutIdstr);
			Connection conn = DBConnection.CreateConnection();
			Products product = ProductsDAO.selectDetailProducts(conn, productId);
			List<ImageProducts> listimg = ProductsDAO.selectImageOfProducts(conn, productId);
			request.setAttribute("listimg", listimg);
			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("View/DetailProduct.jsp");
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
