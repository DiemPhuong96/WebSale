package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BannerDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ChangeBannerForward
 */
@WebServlet("/ChangeBannerForward")
public class ChangeBannerForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBannerForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bannerIdstr = request.getParameter("bannerId");
		int bannerId = Integer.parseInt(bannerIdstr);
		request.setAttribute("bannerId", bannerId);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/changeProductOfBanner.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String bannerIdstr = request.getParameter("bannerId");
		int bannerId = Integer.parseInt(bannerIdstr);
		Connection conn = DBConnection.CreateConnection();
		BannerDAO.UpdateNameOfProduct(conn, name, bannerId);
		request.setAttribute("bannerId", bannerId);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadImageOfBanner.jsp");
		rd.forward(request, response);
	}

}
