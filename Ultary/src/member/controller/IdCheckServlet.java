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
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheck.mem")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userId = request.getParameter("inputId");
		String userId = request.getParameter("userId");
		
		//사용중인지 확인하려 디비로 보내기
		int result =new MemberService().idCheck(userId);
	
		//새창 띄워서 바꾸는거 아니니 주석	
//		request.setAttribute("result", result);
//		request.setAttribute("checkedId", userId); //내가 방금 넘겨받은 아이디다 라고 알려주는것.
//		
//		RequestDispatcher view = request.getRequestDispatcher("views/member/idCheckForm.jsp");
//		view.forward(request, response);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.append("fail");
			
		}else {
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
