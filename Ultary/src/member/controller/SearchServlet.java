package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SearchMemServlet
 */
@WebServlet("/search.mem")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int searchselect = Integer.parseInt(request.getParameter("searchselect"));
		String searchtext = request.getParameter("searchtext");
		
		if(searchselect == 1) {
			ArrayList<Member> list = new MemberService().selectMember(searchtext);
			
			String page = "";
			if(list != null) {
				page = "views/main/mainmemsearch.jsp";
				request.setAttribute("Mlist", list);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "멤버 조회에 실패!");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else if(searchselect == 2){
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
