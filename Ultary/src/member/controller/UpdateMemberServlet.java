package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.mem")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zipNo = request.getParameter("zipNo");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String addrDetail = request.getParameter("addrDetail");
		String address = zipNo+"/"+roadAddrPart1+"/"+roadAddrPart2+"/"+addrDetail;
		String pwquery = request.getParameter("pwquery");
		String pwqans = request.getParameter("pwqans");
		String trust = request.getParameter("trust");
		String trustmeans = request.getParameter("trustmeans");
		String[] trustfieldArr = request.getParameterValues("trustfield");
		String trustfield = String.join(",", trustfieldArr);
		String trustadd = request.getParameter("trustadd");
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		Member m = new Member();
		m.setNickname(nickname);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address);
		m.setPwQuery(Integer.parseInt(pwquery));
		m.setPwqAns(pwqans);
		m.setTrust(trust.charAt(0));
		
		
		m.setTrustmeans(Integer.parseInt(trustmeans));
		m.setTrustfield(trustfield);
		m.setTrustAdd(trustadd);
		m.setMemberId(memberId);
		
		int result = new MemberService().memberUpdate(m);
		
		String page = "";
		String msg = "";
		if(result > 0) {
			response.sendRedirect("views/main/main.jsp");
		} else {
			page = "views/common/errorPage.jsp";
			msg = "정보변경에 실패";
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("msg", msg);
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
