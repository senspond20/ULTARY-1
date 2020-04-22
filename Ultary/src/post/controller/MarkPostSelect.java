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
import post.model.vo.MarkPost;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class MarkPostSelect
 */
@WebServlet("/markpost.tl")
public class MarkPostSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarkPostSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		PostService service = new PostService();
		
		ArrayList<Post> plist = service.selectMarkPost(memberid);
		ArrayList<PostComment> pclist = service.selectMarkpc(memberid);
		ArrayList<CAns> calist = service.selectMarkCAns(memberid);
		ArrayList<Media> mlist = service.selectMarkm(memberid);
		ArrayList<Media> proList = service.selectAllproimg();
		
		String page = "";
		if(plist != null && pclist != null && calist != null && mlist != null && proList != null) {
			request.setAttribute("plist", plist);
			request.setAttribute("pclist", pclist);
			request.setAttribute("calist", calist);
			request.setAttribute("mlist", mlist);
			request.setAttribute("proList", proList);
			page = "views/myUltary/markPost.jsp";
		} else {
			request.setAttribute("msg", "게시물 즐겨찾기 조회에 실패");
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
