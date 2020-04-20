package trust.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import trust.model.service.MatchingService;
import trust.model.vo.TrustPost;

/**
 * Servlet implementation class InsertReview
 */
@WebServlet("/insertReview.tu")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tpostnum = Integer.parseInt(request.getParameter("tpostnum"));
		
		
		Member m  = new MatchingService().RwriteView(tpostnum);
		
		String page = "";
		if(m != null) {
			page="views/trustMatch/matching06.jsp";
			request.setAttribute("m", m);
		}else {
			page="views/common/erroPage.jsp";
			request.setAttribute("msg", "조회 실패");
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
