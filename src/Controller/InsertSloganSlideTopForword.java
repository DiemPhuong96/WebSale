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


@WebServlet("/InsertSloganSlideTopForword")
public class InsertSloganSlideTopForword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSloganSlideTopForword() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String slogan1 = request.getParameter("slogan1");
		String slogan2 = request.getParameter("slogan2");
		Connection conn = DBConnection.CreateConnection();
		Slidetop st = new Slidetop();
		st.setSlogan1(slogan1);
		st.setSlogan2(slogan2);
		SlideTopDAO.InsertSloganSlideTop(conn, st);
		int slideTopId = SlideTopDAO.selectSlideTopId(slogan1, slogan2, conn);
		request.setAttribute("slideTopId",slideTopId);

		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadImageSlideTop.jsp");
		rd.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
