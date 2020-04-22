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
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/delete.mem")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MemberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId(); // Servlet--> Attribute
		
		int result = new MemberService().deleteMember(MemberId);
		
		
		if(result > 0) {
			request.getSession().invalidate();
			response.sendRedirect("views/main/main.jsp");
		} else {
			String page = "views/common/errorPage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("msg", "탈퇴실패");
			view.forward(request, response);
		}
		/*
		 * $('#memberD').click(function(){ var result = window.confirm('정말 탈퇴하시겠습니까?');
		 * 
		 * if(result){ location.href="<%= request.getContextPath() %>/delete.mem"; }
		 * else { alert("탈퇴 실패! 관리자에게 문의 바랍니다."); } });
		 */
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
