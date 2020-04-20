package trust.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import trust.model.service.MatchingService;
import trust.model.vo.TrustReview;

/**
 * Servlet implementation class Trustcol
 */
@WebServlet("/trustcol.tu")
public class Trustcol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Trustcol() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int trnum = Integer.parseInt(request.getParameter("trnum"));
		
		TrustReview tr = new MatchingService().trusReviewSerch(trnum);
		Member m = new MatchingService().DetailView(tr.getMemberId());
		
		String page ="";
		if(m != null) {
			page = "views/trustMatch/matchingcol.jsp";
			request.setAttribute("tp",tr);
			request.setAttribute("m", m);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "실패!");
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
