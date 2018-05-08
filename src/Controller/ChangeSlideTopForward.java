package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Slidetop;
import DAO.SlideTopDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ChangeSlideTopForward
 */
@WebServlet("/ChangeSlideTopForward")
public class ChangeSlideTopForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeSlideTopForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String slideTopIdstr = request.getParameter("slideTopId");
		int slideTopId = Integer.parseInt(slideTopIdstr);
		request.setAttribute("slideTopId", slideTopId);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ChageSlideTop.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String slogan1 = request.getParameter("slogan1");
		String slogan2 = request.getParameter("slogan2");
		String slideTopIdstr = request.getParameter("slideTopId");
		int slideTopId = Integer.parseInt(slideTopIdstr);
		Connection conn = DBConnection.CreateConnection();
		Slidetop st = new Slidetop();
		st.setSlogan1(slogan1);
		st.setSlogan2(slogan2);
		SlideTopDAO.UpdateSloganSlideTop(conn, st, slideTopId);
		int change = 1;
		request.setAttribute("slideTopId",slideTopId);
		request.setAttribute("change",change);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadImageSlideTop.jsp");
		rd.forward(request, response);
	}

}
