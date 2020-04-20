package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin.login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String memberid = request.getParameter("memberId");
		String password = request.getParameter("password");
		Member m = new Member(memberid, password);
		Member loginUser = new MemberService().loginMember(m);
		
		// **리퀘스트는 한번만 요청 가능하다!!! 세션을 만들어서 로그인 정보를 넣을것.
		if (loginUser != null && loginUser.getMemberId().equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			session.setMaxInactiveInterval(600);
			RequestDispatcher view = request.getRequestDispatcher("views/admin/adminMain.jsp");
			view.forward(request, response);

		} else {
			request.setAttribute("msg", "관리자로 로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}

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
