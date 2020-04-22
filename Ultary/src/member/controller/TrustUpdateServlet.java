package member.controller;

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
 * Servlet implementation class TrustUpdateServlet
 */
@WebServlet("/update.trust")
public class TrustUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrustUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		char trust = request.getParameter("trust").charAt(0);
		int trustmeans = Integer.parseInt(request.getParameter("trustmeans"));
		String[] trustfieldlist = request.getParameterValues("trustfield");
		String trustfield = String.join(",", trustfieldlist);
		String trustAdd = request.getParameter("trustadd");
		String memberid = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String password = ((Member)request.getSession().getAttribute("loginUser")).getPassword();
		
		Member m = new Member();
		m.setTrust(trust);
		m.setTrustmeans(trustmeans);
		m.setTrustfield(trustfield);
		m.setTrustAdd(trustAdd);
		m.setMemberId(memberid);
		m.setPassword(password);
		
		int result = new MemberService().updateTrust(m);
		Member loginUser = new MemberService().loginMember(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(6000);
			response.sendRedirect("post.tl");
		} else {
			request.setAttribute("msg", "위탁 변경에 실패헀습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
