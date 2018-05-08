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

import BEAN.Banner;
import BEAN.Category;
import BEAN.Slidetop;
import DAO.BannerDAO;
import DAO.ProductsDAO;
import DAO.SlideTopDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ShopForward
 */
@WebServlet("/ShopForward")
public class ShopForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		Connection conn = DBConnection.CreateConnection();
		List<Slidetop> list = SlideTopDAO.SelectListSlideTop(conn);
		request.setAttribute("slideTop", list);
		List<Banner> listbanner = BannerDAO.listBanner(conn);
		request.setAttribute("listBanner", listbanner);
	
		List<Category> listCategory = ProductsDAO.selectCategory(conn);
		request.setAttribute("listCategory", listCategory);
		
		RequestDispatcher rd = request.getRequestDispatcher("View/Shop.jsp");
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
