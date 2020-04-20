package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.InquiryService;
import admin.model.service.NoticeService;
import admin.model.vo.Inquiry;

/**
 * Servlet implementation class InquirySearchServlet
 */
@WebServlet("/search.inq")
public class InquirySearchServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquirySearchServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String option = request.getParameter("option");
		String search = request.getParameter("search");
		String check = request.getParameter("check");
		
		ArrayList<Inquiry> list = new InquiryService().selectFilter(option, search, check);
		
		
		String page = null;
		if(list != null) {
			page = "views/support/InquiryListView.jsp";
			
			request.setAttribute("list", list);
			request.setAttribute("option", option);
			request.setAttribute("search", search);
			request.setAttribute("check",check);
		}else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "실패했습니다.");
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
