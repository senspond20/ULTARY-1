package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/email.mem")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디와 이메일정보를 받아온다.
		//(기존회원 확인)
		//이메일값이 이미 있으면 가입할 수 없다. => 인증메일 발송 불가
		//이메일이 없으면 가입할 수 있다. => 인증메일 발송 가능
		
		//이메일 받아오기
//		String email_1 = request.getParameter("email_1"); //아이디
//		String email_2 = request.getParameter("email_2"); //뒷 메일
//		String email = email_1 + "@" + email_2;
		
		String email = request.getParameter("email");
		System.out.println("EmailCheckServlet 횐갑 email들어오는지 확인 : " + email);
		
		int result = new MemberService().memberEmail(email);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {// 이메일값이 이미 있으면 가입할 수 없다. => 인증메일 발송 불가
			out.append("fail");
		}else {			//이메일이 없으면 가입할 수 있다. => 인증메일 발송 가능
			out.append("success");
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
