package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindIdEmailServlet
 */
@WebServlet("/findidemail.mem")
public class FindIdEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이름 받아오기
		String membername = request.getParameter("fine_ID_Name");
		
		//email 받기
		String email_1 = request.getParameter("email_1"); //아이디
		String email_2 = request.getParameter("email_2"); //직접입력시 이메일주소칸
		String email = (email_1 != null && email_2 != null) ? email_1 + "@" + email_2 : null;
		System.out.println(email);
		
		//전화번호 받아오기
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + phone2 + phone3; 
		System.out.println(phone);
		
		String page = "";
		
		if(email_1 != null && email_2 != null) {
			String findId1 = new MemberService().findIdMember1(membername, email);
			System.out.println("서블릿에서 뽑아보는 findId1 정보:"+findId1);
			
			if(email_1 != null && email_2 != null) {
				page ="views/main/findMember/findIdview.jsp";
				request.setAttribute("findId1", findId1);
			}else {
				page ="views/common/errorPage.jsp";
				request.setAttribute("msg", "이메일 아이디 조회에 실패했습니다.");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}else {
			System.out.println("폰번호 조회 if문으로 들어오는가 :" + phone);
			
			String findId2 = new MemberService().findIdMember2(membername, phone);
			
			System.out.println("서블릿에서 뽑아보는 findId2 정보:"+findId2);
			
			if(findId2 != null) {
				page ="views/main/findMember/findIdview.jsp";
				request.setAttribute("findId2", findId2);
			
			}else { //findId2 가 널이라서 자꾸 이쪽으로 들어옴.
				page ="views/common/errorPage.jsp";
				request.setAttribute("msg", "전화번호 아이디 조회에 실패했습니다.");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
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
