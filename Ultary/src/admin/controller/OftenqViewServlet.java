package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.NoticeService;
import admin.model.service.OftenQueryService;
import admin.model.vo.PageInfo;
import admin.model.vo.OftenQuery;

/**
 * Servlet implementation class OftenqViewServlet
 */
@WebServlet("/faq.sv")
public class OftenqViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OftenqViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		OftenQueryService service = new OftenQueryService();

		// 게시글 총 개수
		int listCount = 0;			
		int currentPage; 	// 현재 페이지
		int pageLimit = 5; 	// 한 페이지에 표시될 페이징 수
		int maxPage; 		// 전체 페이지 중 마지막 페이지
		int startPage; 		// 페이징 된 페이지 중 시작 페이지
		int endPage; 		// 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 5; // 한 페이지에 보일 게시글 수
		
		// 1. 현재 페이지를 가져온다.
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} else {
			currentPage = 1;
		}
		ArrayList<OftenQuery> list = null;
		
		String option = request.getParameter("option");
		String search = request.getParameter("search");
		
		if (search != null) {
			listCount = service.getCountFilter(option, search);
			list = service.selectList(option, search, currentPage, boardLimit);
		}
		else {
			listCount = service.getCountAll();
			list = service.selectList(currentPage, boardLimit);
			option = "A";
			search = "";
		}


		maxPage = (int)((double)listCount/ boardLimit + 0.9);			
		startPage = (((int)((double) currentPage / pageLimit + 0.9) - 1)) * pageLimit + 1;
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		String page = null;
		
		if(list!= null) {
			page = "views/support/srvFaqView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi",pi);
		    request.setAttribute("option",option);
			request.setAttribute("search",search);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패하였습니다.");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
