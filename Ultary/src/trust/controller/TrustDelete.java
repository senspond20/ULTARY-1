package trust.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trust.model.service.MatchingService;

/**
 * Servlet implementation class TrustDelete
 */
@WebServlet("/trustdelete.tu")
public class TrustDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrustDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int trnum = Integer.parseInt(request.getParameter("trnum"));
		
		int result = new MatchingService().deletetr(trnum);
		
		if(result >0) {
			response.sendRedirect("myreview.tu");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage/jsp");
			request.setAttribute("msg", "리뷰삭제 실패");
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
