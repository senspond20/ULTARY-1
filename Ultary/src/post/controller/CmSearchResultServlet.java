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
 * Servlet implementation class CmSearchResultServlet
 */
@WebServlet("/cmSearch.po")
public class CmSearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmSearchResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PostService service = new PostService();
		
		String searchtext = request.getParameter("searchtext"); // 검색내용
		int categorynum = Integer.parseInt(request.getParameter("categorynum")); // 검색범위 
		String searchcon = request.getParameter("searchcon"); // 검색조건
		int date = Integer.parseInt(request.getParameter("date")); // 날짜 범위?
		
		System.out.println(searchtext);
		System.out.println(categorynum);
		System.out.println(searchcon);
		System.out.println(date);
		
		int listCount = service.getSearchListCount(searchtext,categorynum,searchcon,date);
		
		int currentPage;			// 현재 페이지
		int pageLimit = 10;				// 한 페이지에 표시될 페이징 수
		int maxPage;				// 전체 페이지 중에서 마지막 페이지 찐막
		int startPage;				// 페이징 된 페이지 중 시작 페이지
		int endPage;				// 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 10;				// 한 페이지에 보일 게시글 수
		
		currentPage = 1;  // 페이지 이동은 url에 기술 할꺼임 list.bo?currentPage=~
		if(request.getParameter("currentPage") != null) {   // currentPage값이 존재 한다면
			currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		maxPage = (int)((double)listCount / boardLimit + 0.9);
		
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) -1) * pageLimit + 1;
		
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		ArrayList<Post> list = service.selectSearchList(searchtext,categorynum,searchcon,date,currentPage,boardLimit);
		
		String page ="";
		if(list != null) {
			page ="views/community/search_result.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("searchtext", searchtext);
			request.setAttribute("list", list);
		} else {
			page="views/common/errerPage.jsp";
			request.setAttribute("msg", "검색에 실패");
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
