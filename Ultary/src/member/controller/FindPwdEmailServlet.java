package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdEmailServlet
 */
@WebServlet("/findPwdEmail.mem")
public class FindPwdEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디, 이메일로 비밀번호 찾기
		
		//아이디 받아오기
		String memberId = request.getParameter("userId");
		System.out.println("서블릿에서 뽑은 userId :"+memberId);
		
		//email 받기
		String email = request.getParameter("email");
		System.out.println("서블릿에서 뽑은 email :"+email);
		
		//디비에서 아이디와 비번이 일치하는 회원이 있는지만 확인.
		int findPwdMember = new MemberService().findPwdMember(memberId, email);
		
		PrintWriter out = response.getWriter();
		if(findPwdMember > 0) { //회원정보가 있으면 인증메일 하고 비번업데이트하기
			out.append("success");
			
			//패드워드 업데이트에 아이디 보내주기
			String page ="WebContent/views/main/findMember/newPwdForm.jsp";
			request.setAttribute("memberId", memberId);
			request.setAttribute("email", email);
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			
			System.out.println("idcheck서블릿에서 확인하는 기존 아이디 있으면 1=>"+findPwdMember);
		}else {
			out.append("fail"); ////회원정보가 없으면 없다고 알려주기
			System.out.println("idcheck서블릿에서 확인하는 기존 아이디 없으면 0 =>"+findPwdMember);
		}
		out.flush();
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
