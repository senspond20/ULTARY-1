package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/pwdupdate.mem")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");//현재 비번 입력하세요 
		String passwordN = request.getParameter("passwordN");// 새 비번
		System.out.println("서블릿에서 받는  새비번"+passwordN);
		System.out.println("서블릿에서 받는  올드비번"+password);
			
		HttpSession session = request.getSession();
		Member sessionMember = (Member)session.getAttribute("loginUser");
		Member b = new Member(sessionMember.getMemberId(), password);
		//b.setPassword(passwordN);
		
		String page = "";
		String msg = "";
		//1. 현재 비밀번호 체크
		
		//2.1 현재 비밀번호가 맞는 경우
			sessionMember.setPassword(passwordN);
			
			//String password = request.getParameter("password");
			int result = new MemberService().pwdUpdate(b, passwordN);
			
			if(result > 0) { //결과가 있어야, 메인으로간다.
				response.sendRedirect(request.getContextPath());
			}else {
				System.out.println("업데이트실패");
			}
	}
		
	//	String page = "";
	//	String msg = "";
	//	if(result == 1) {
	//		response.getWriter().println("success");
	//		response.sendRedirect("views/myPage/pwdUpdate.jsp");
			/*
			 * } else if(m.password.value!=m.pwd.value){ alert("입력하신 비밀번호와 다릅니다."); return;
			 */
//		} else {
//			page = "views/myPage/pwdUpdate.jsp";
//			RequestDispatcher view = request.getRequestDispatcher(page);
//			request.setAttribute("msg", msg);
//			view.forward(request, response);
//			response.sendRedirect("views/myPage/pwdUpdate.jsp");
//			response.getWriter().print("fail"); // 비번 틀리면 원래 페이지에 머물도록 하기 완료
//		}			
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
