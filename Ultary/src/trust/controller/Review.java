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
 * Servlet implementation class Review
 */
@WebServlet("/review.tu")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review = request.getParameter("review");
		int score = Integer.parseInt(request.getParameter("score"));
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId();
		
		TrustReview tr = new TrustReview();
		tr.setTrScore(score);
		tr.setTrContent(review);
		tr.setMemberId(loginUser);
		
		int result = new MatchingService().review(tr);
		
		String page="";
		if(result>0) {
			response.sendRedirect("myreview.tu");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg","실패! DetailMatchServelt 확인");
			view.forward(request, response);
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
