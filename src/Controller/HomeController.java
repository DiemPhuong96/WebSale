package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Banner;
import BEAN.Blog;
import BEAN.Products;
import BEAN.Slidetop;
import BEAN.Video;
import DAO.BannerDAO;
import DAO.BlogDAO;
import DAO.ProductsDAO;
import DAO.SlideTopDAO;
import DAO.VideoDAO;
import DB.DBConnection;


@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		List<Slidetop> list = SlideTopDAO.SelectListSlideTop(conn);
		request.setAttribute("slideTop", list);
		List<Banner> listbanner = BannerDAO.listBanner(conn);
		request.setAttribute("listBanner", listbanner);
		int countrow = ProductsDAO.countRow(conn);
		if(countrow > 8) {
			countrow = countrow - 8;
		}
		else countrow = 1;
		List<Products> listProduct = ProductsDAO.selectProduct(countrow, 8, conn);
		List<Video> listVideo = VideoDAO.selectVideo(conn);
		List<Blog> listBlog1 = BlogDAO.selectBlog(conn);
		List<Blog> listBlog = new ArrayList<Blog>();
		for(int i = 0; i< 3; i ++) {
			Blog blog = new Blog();
			blog = listBlog1.get(i);
			listBlog.add(blog);
			
		}
		request.setAttribute("listBlog",listBlog);
		request.setAttribute("listVideo", listVideo);
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher rd = request.getRequestDispatcher("View/Home.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
