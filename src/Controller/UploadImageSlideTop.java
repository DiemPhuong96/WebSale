package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SlideTopDAO;


@WebServlet("/UploadImageSlideTop")
public class UploadImageSlideTop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UploadImageSlideTop() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String slideTopIdstr = request.getParameter("slideTopId");
	
		int slideTopId = Integer.parseInt(slideTopIdstr);
		String test = SlideTopDAO.UploadImageSlideTop(request, slideTopId);
		if(test.equals("there is no ismutipart")) {
			request.setAttribute("slideTopMsg", "not have enctypr: multipart/form-data");
			request.setAttribute("slideTopId", slideTopId);
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadImageSlideTop.jsp");
			rd.forward(request, response);
			
		}
		else {
			if(test.equals("Success")) {

				RequestDispatcher rd = request.getRequestDispatcher("SlideTopForward");
				rd.forward(request, response);
			}
			
			else {
				if(test.equals("File exits")) {
					request.setAttribute("slideTopMsg", "File exits. Require: test file again!");
					
				}
				
				else {
					request.setAttribute("slideTopMsg", "Upload file fail");
					
				}
				request.setAttribute("slideTopId", slideTopId);
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UploadImageSlideTop.jsp");
				rd.forward(request, response);
			}
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
