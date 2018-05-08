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
 * Servlet implementation class ProductsForward
 */
@WebServlet("/ProductsForward")
public class ProductsForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageIdstr = request.getParameter("pageid");
		int pageid = Integer.parseInt(pageIdstr);
		int count = 8;
		int numberpage = pageid;
		if(pageid!=1) {
			pageid = pageid -1;
			pageid = pageid*count +1;
		}
		
		Connection conn = DBConnection.CreateConnection();
		List<Products> list = ProductsDAO.selectProduct(pageid, count, conn);
		int sumRow = ProductsDAO.countRow(conn);
		int maxpageid = 0;
		if(sumRow < count) {
			maxpageid = 1;
		}
		else {
			if((sumRow%count)!= 0) {
				maxpageid = sumRow/count +1;
			}
			else {
				maxpageid = sumRow/count;
			}
			
		}
		List<Category> listCate = ProductsDAO.selectCategory(conn);
	
		request.setAttribute("listCate", listCate);
	
		request.setAttribute("maxpageid", maxpageid);
		request.setAttribute("listProducts", list);
		request.setAttribute("numberpage", numberpage);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ProductsAdmin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productCategoryIdstr = request.getParameter("productCategory");
		int productCategoryId = Integer.parseInt(productCategoryIdstr);
		String pricestr = request.getParameter("price");
		int price = Integer.parseInt(pricestr);
		String discountstr = request.getParameter("discount");
		int discount = Integer.parseInt(discountstr);
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String description = request.getParameter("description");
		String categoryIdstr = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(categoryIdstr);
		int size = 0;
		if(categoryId != 2) {
			String sizestr = request.getParameter("size");
			size = Integer.parseInt(sizestr);
			
		}
		Connection conn = DBConnection.CreateConnection();
		Products pro = new Products();
		pro.setColor(color);
		pro.setDescription(description);
		pro.setDiscount(discount);
		pro.setPrice(price);
		pro.setProductCategoryId(productCategoryId);
		pro.setProductName(name);
		pro.setSize(size);
		int productId = ProductsDAO.addProducts(conn, pro);
		request.setAttribute("productId", productId);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadAvatarProducts.jsp");
		rd.forward(request, response);
		}

}
