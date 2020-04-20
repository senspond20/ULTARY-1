package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.InquiryService;

/**
 * Servlet implementation class InquiryAnswerServlet
 */
@WebServlet("/answer.inq")
public class InquiryAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("진입성공");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String answer = request.getParameter("answer");
		
		
		String page = null;

//		Notice n = new Notice(title, content, userId);
		int result = new InquiryService().answerInquiry(no,answer);
	//	int result = 0;
		
		if (result > 0) {
			response.sendRedirect("list.inq");
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "문의답변에 실패했습니다.");
		}
		
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
