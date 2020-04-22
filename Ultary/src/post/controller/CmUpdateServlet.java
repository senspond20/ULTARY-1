package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Media;
import post.model.service.PostService;

/**
 * Servlet implementation class CmUpdateServlet
 */
@WebServlet("/update.po")
public class CmUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int range = Integer.parseInt(request.getParameter("range"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ArrayList<Media> mlist = new PostService().selectphoto(pno);
		
		String page = "";
		
		if(mlist != null) {
			page = "views/community/cmpostUpdate.jsp";
			request.setAttribute("pno", pno);
			request.setAttribute("title",title);
			request.setAttribute("content", content);
			request.setAttribute("range", range);
			request.setAttribute("mlist",mlist);
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
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
