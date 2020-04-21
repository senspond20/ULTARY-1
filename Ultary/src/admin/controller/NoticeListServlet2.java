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
import admin.model.vo.Notice;
import admin.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/slist2.no")
public class NoticeListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeListServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NoticeService service = new NoticeService();
		
		int listCount = 0; // 게시글 총 개수
		int currentPage; // 현재 페이지
		int pageLimit = 5; // 한 페이지에 표시될 페이징 수
		int maxPage; // 전체 페이지 중 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 10; // 한 페이지에 보일 게시글 수

		// 1. 현재페이지를 가져온다.
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} else {
			currentPage = 1;
		}

		// 2. 검색필터 체크/ 검색개수 가져오기
		String option = "A";
		String searchKeyword = "";
		
		ArrayList<Notice> list = null;
		if (request.getParameter("option") != null && request.getParameter("search") != null) {
			option = request.getParameter("option");
			searchKeyword = request.getParameter("search");

			listCount = service.getListCountFilter(option, searchKeyword);
			list = service.selectList(option, searchKeyword, currentPage, boardLimit);
		} else {
			listCount = service.getListCountAll();
			list = service.selectList(currentPage, boardLimit);
		}

		maxPage = (int) ((double) listCount / boardLimit + 0.9);
		startPage = (((int) ((double) currentPage / pageLimit + 0.9) - 1)) * pageLimit + 1;
		endPage = pageLimit + startPage - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo
				(currentPage, listCount, pageLimit, maxPage, startPage, endPage,boardLimit);

		String page = null;
		if (list != null) {
			page = "views/admin/noticeListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("listCount", listCount);
			request.setAttribute("option", option);
			request.setAttribute("search", searchKeyword);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
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
