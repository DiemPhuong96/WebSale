package Controller;

import java.io.IOException;
import java.sql.Connection;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Member;
import DAO.RegisterAndLoginDAO;
import DB.DBConnection;


@WebServlet("/LoginForward")
public class LoginForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginForward() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Member mb = new Member();
		mb.setEmail(email);
		mb.setPassword(password);
		Connection conn = DBConnection.CreateConnection();
		String test = RegisterAndLoginDAO.selectInformationMember(conn, mb);
	 
		if(test.equals("admin")) {
			int memberId = RegisterAndLoginDAO.selectMemberId(conn, mb);
			String name = RegisterAndLoginDAO.selectMemberName(conn, mb);
			HttpSession session = request.getSession(true);
			session.setAttribute("sessionName", name);
			session.setAttribute("sessionId", memberId);
			RequestDispatcher rd = request.getRequestDispatcher("AdminForward");
			rd.forward(request, response);
		}
		else if(test.equals("customer")) {
			int memberId = RegisterAndLoginDAO.selectMemberId(conn, mb);
			String name = RegisterAndLoginDAO.selectMemberName(conn, mb);
			HttpSession session = request.getSession(true);
			session.setAttribute("sessionName", name);
			session.setAttribute("sessionId", memberId);
			RequestDispatcher rd = request.getRequestDispatcher("HomeController");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("msgRegister", "Username or Password is wrong");
			RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
			rd.forward(request, response);
		}
		
	}

}
