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
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.CAns;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class TimeLIneServlet
 */
@WebServlet(name = "TimeLineServlet", urlPatterns = { "/post.tl" })
public class TimeLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeLineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService service = new PostService();
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String nickname = ((Member)request.getSession().getAttribute("loginUser")).getNickname();
		
		ArrayList<Post> pList = service.selectTList(1, memberId);
		ArrayList<PostComment> pcList = service.selectComment(memberId);
		
		ArrayList<Media> mList = service.selectTList(2, memberId);
		ArrayList<Media> proList = service.selectproimg(nickname);
		
		ArrayList<CAns> cList = service.selectCAns(memberId);
		
		String page = null;
		if(pList != null && mList != null && pcList != null && cList != null) {
			request.setAttribute("pList", pList);
			request.setAttribute("mList", mList);
			request.setAttribute("pcList", pcList);
			request.setAttribute("cList", cList);
			request.setAttribute("proList", proList);
			page = "views/myUltary/ultaryMain.jsp";
		} else {
			request.setAttribute("msg", "타임라인 조회에 실패헀습니다.");
			page = "views/common/errorPage.jsp";
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
