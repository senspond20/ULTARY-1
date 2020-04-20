package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Media;
import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class CmDetailServlet
 */
@WebServlet("/cmdetail.po")
public class CmDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		PostService service = new PostService();
		
		Post post = service.selectPostDetail(pno);
		ArrayList<Media> fileList = service.selectphoto(pno);
		
		
		if(post != null && fileList != null) {
			request.setAttribute("post", post);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/community/cm_details.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "상세보기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
