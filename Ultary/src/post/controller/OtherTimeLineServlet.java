package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.CAns;
import post.model.vo.MarkPost;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class OtherTimeLineServlet
 */
@WebServlet("/otherpost.tl")
public class OtherTimeLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtherTimeLineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService service = new PostService();
		String nickname = request.getParameter("nickname");
		String loginId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		ArrayList<Post> plist = service.selectpOther(nickname);
		ArrayList<PostComment> pclist = service.selectpcOther(nickname);
		ArrayList<Media> mlist = service.selectmOther(nickname);
		ArrayList<CAns> calist = service.selectcaOther(nickname);
		ArrayList<Media> proList = service.selectproimg(nickname);
		ArrayList<MarkPost> mpList = service.selectAllmp(loginId);
		
		ArrayList<Member> markList = new MemberService().selectMarkMember(loginId);
		int markscore = new MemberService().selectMarkscore(nickname);
		
		Boolean markbl = false;
		for(int i=0;i<markList.size();i++) {
			Member markMem = markList.get(i);
			if(markMem.getNickname().equals(nickname)) {
				markbl = true;
			}
		}
		
		String page = "";
		if(plist != null && pclist != null && mlist != null && calist != null && proList != null && markList != null && mpList != null) {
			request.setAttribute("plist", plist);
			request.setAttribute("pclist", pclist);
			request.setAttribute("mlist", mlist);
			request.setAttribute("nickname", nickname);
			request.setAttribute("calist", calist);
			request.setAttribute("proList", proList);
			request.setAttribute("markbl", markbl);
			request.setAttribute("markscore", markscore);
			request.setAttribute("mpList", mpList);
			page = "views/myUltary/OtherultaryMain.jsp";
		} else {
			request.setAttribute("msg", "타인 타임라인 조회에 실패했습니다.");
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
