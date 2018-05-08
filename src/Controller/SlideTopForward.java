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

import BEAN.Slidetop;
import DAO.SlideTopDAO;
import DB.DBConnection;

/**
 * Servlet implementation class SlideTopForward
 */
@WebServlet("/SlideTopForward")
public class SlideTopForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SlideTopForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		List<Slidetop> list = SlideTopDAO.SelectListSlideTop(conn);
		request.setAttribute("listSlidetop", list);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadSlideTop.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
