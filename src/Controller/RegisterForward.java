package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Member;
import DAO.RegisterAndLoginDAO;
import DB.DBConnection;

/**
 * Servlet implementation class RegisterForward
 */
@WebServlet("/RegisterForward")
public class RegisterForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int kt = 0;
		Connection conn = DBConnection.CreateConnection();
		for(int i = 0; i < phone.length(); i++) {
			if(Character.isLetter(phone.charAt(i))) {
				kt = 1;   //su ly phan frontend
				break;
			}
		}
		
		boolean test = RegisterAndLoginDAO.compareEmail(conn, email);
		
		if(test) {
				if(kt == 1) {
				
				request.setAttribute("msgRegister", "Number phone is wrong");
				RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
				rd.forward(request, response);
				}
				
				else {
					Member mb = new Member();
					mb.setEmail(email);
					mb.setName(name);
					mb.setPassword(password);
					mb.setPhone(phone);
				
					RegisterAndLoginDAO.InsertInformationMember(mb, conn);
					request.setAttribute("msgRegister", "Register success");
					RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
					rd.forward(request, response);
				}
		}
		
		else {
			request.setAttribute("msgRegister", "Email already exists");
			RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
			rd.forward(request, response);
		}
		
		
		
	}

}
