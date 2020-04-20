package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.model.service.PostService;
import post.model.vo.PageInfo;
import post.model.vo.Post;

/**
 * Servlet implementation class CmRehomeListServlet
 */
@WebServlet("/cmrelist.po")
public class CmRehomeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmRehomeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		PostService pservice = new PostService();
		

		int listCount = pservice.getRelistCount();
		
		int currentPage;
		int pageLimit=10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 10;
		
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		maxPage = (int)((double)listCount / boardLimit + 0.9);
		
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) -1) * pageLimit + 1;
		
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		ArrayList<Post> relist = pservice.selectRelist(currentPage,boardLimit);		
	
		String page = "";
		if(relist != null) {
			page = "views/community/pet_rehome.jsp";
			request.setAttribute("relist", relist);
			request.setAttribute("pi", pi);
		}else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
