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
import trust.model.vo.TrustReview;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/updatereview.tu")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review = request.getParameter("review");
		int score = Integer.parseInt(request.getParameter("score"));
		int trNum = Integer.parseInt(request.getParameter("trnum"));
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId();

		TrustReview tr = new TrustReview();
		tr.setTrNum(trNum);
		tr.setTrScore(score);
		tr.setTrContent(review);
		tr.setMemberId(loginUser);
	
		int result = new MatchingService().updatetr(tr);
		
		if(result>0) {
			response.sendRedirect("myreview.tu");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage/jsp");
			request.setAttribute("msg", "리뷰수정 실패");
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
