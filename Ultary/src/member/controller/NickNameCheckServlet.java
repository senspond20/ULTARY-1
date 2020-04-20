package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class NickNameCheckServlet
 */
@WebServlet("/nickNameCheck.mem")
public class NickNameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NickNameCheckServlet() {
    	 super();
         // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userNick = request.getParameter("inputNick");//이게 아닌데...
		String userNick = request.getParameter("userNick");
		
		//사용중인 닉네임인지 디비로 보내서 확인해오기
		int result = new MemberService().nickCheck(userNick);
		
//		request.setAttribute("result", result);
//		request.setAttribute("checkedNick",userNick);
//		// result는 중복확인 받아온 결과 값이고, 
//		// userNick은  입력했던 닉네임인데 그걸 확인받았다고 표시해놔야함.=checked에 담음
//		
//		RequestDispatcher view = request.getRequestDispatcher("views/member/nickNameCheckForm.jsp");
//		view.forward(request,response);
		
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
