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
import admin.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryListServlet
 */
@WebServlet("/list2.inq")
public class InquiryListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryListServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Inquiry> list = new InquiryService().selectList();
		
		String page = null;
		
		if(list != null) {
			page = "views/admin/InquiryListView.jsp";
			request.setAttribute("list", list);
		}else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "문의에 실패했습니다.");
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
