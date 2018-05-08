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
import DAO.CommentDAO;
import DB.DBConnection;
/**
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		String blogIdstr = request.getParameter("blogId");
		int blogId = Integer.parseInt(blogIdstr);
		Connection conn = DBConnection.CreateConnection();
		if((name.equals("0") == false)&&(email.equals("0") == false)&&(content.equals("0") == false)) {
			CommentDAO.insertCmt(conn, blogId, content, email, name);
		
		}
	
		List<BEAN.Comment> listcmt = CommentDAO.selectCmt(conn, blogId);
		request.setAttribute("listcmt", listcmt);
		RequestDispatcher rd = request.getRequestDispatcher("View/CommentResult.jsp");
		rd.forward(request, response);
	}

}
