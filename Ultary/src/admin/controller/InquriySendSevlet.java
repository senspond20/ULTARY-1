package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.InquiryService;
import admin.model.vo.Inquiry;
import member.model.vo.Member;


/**
 * Servlet implementation class InquriyInsertSevlet
 */
@WebServlet("/insert.inq")
public class InquriySendSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InquriySendSevlet() {
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

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
	//	String userId = "admin";
		
		Inquiry n = new Inquiry(title, content, userId);
		int result = new InquiryService().insertInquiry(n);

		String page = null;
		
		if (result > 0) {
			System.out.println("문의성공");
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "문의에 실패했습니다.");
		}
		
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
	

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
