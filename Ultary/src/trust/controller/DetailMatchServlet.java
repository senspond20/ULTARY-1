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
import member.model.vo.Pet;
import trust.model.service.MatchingService;

/**
 * Servlet implementation class DetailMatchServlet
 */
@WebServlet("/DetailMatch.tu")
public class DetailMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailMatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId();
	
		String memberid = request.getParameter("memberid");
		
		Member m = new MatchingService().DetailView(memberid);
		
		String page = null;
		if(m != null) {
			Pet pet = new MatchingService().DetailPet(loginUser);
			if(pet != null) {
				page="views/trustMatch/matching03.jsp";
				request.setAttribute("m",m);
				request.setAttribute("pet",pet);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg","pet이 없습니다");
			}
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg","실패! DetailMatchServelt 확인");
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
