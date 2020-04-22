package trust.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import member.model.vo.Pet;
import trust.model.service.MatchingService;
import trust.model.vo.TrustPost;

/**
 * Servlet implementation class TpostView
 */
@WebServlet("/TpostView.tu")
public class TpostView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TpostView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TrustPost tp = (TrustPost)request.getAttribute("tp"); 
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId(); 
		
		Pet mypet = new MatchingService().DetailPet(loginUser);
		ArrayList<TrustPost> balsin = new MatchingService().TpostBalshin(loginUser);
		ArrayList<TrustPost> susin = new MatchingService().TpostSushin(loginUser);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/trustMatch/matching05.jsp");
		request.setAttribute("mypet",mypet);
		request.setAttribute("balsin", balsin);
		request.setAttribute("susin", susin);
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
