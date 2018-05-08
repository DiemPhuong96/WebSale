package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MessageDAO;
import DB.DBConnection;


@WebServlet("/MessageForward")
public class MessageForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MessageForward() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("View/Message.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		Connection conn = DBConnection.CreateConnection();
		MessageDAO.insertMassage(conn, name, phone, email, content);
		request.setAttribute("message", "Leave massage success");
		RequestDispatcher rd = request.getRequestDispatcher("View/Message.jsp");
		rd.forward(request, response);
	}

}
