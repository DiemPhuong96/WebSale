package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.About;
import DAO.AboutDAO;
import DB.DBConnection;


@WebServlet("/AboutForward")
public class AboutForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AboutForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		About about = AboutDAO.selectAbout(conn);
	
		request.setAttribute("about", about);
		RequestDispatcher rd = request.getRequestDispatcher("View/About.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
