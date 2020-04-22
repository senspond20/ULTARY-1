package trust.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import trust.model.service.MatchingService;
import trust.model.vo.TrustPost;

/**
 * Servlet implementation class TpostSendServlet
 */
@WebServlet("/Tpostsend.tu")
public class TpostSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TpostSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int petnum = Integer.parseInt(request.getParameter("petnum"));
		
		String area1 = request.getParameter("h_area1");
		String area2 = request.getParameter("h_area2");
		String area3 = request.getParameter("h_area3");
		String address = area1+" "+area2+" "+area3;
		
		Date startDate = Date.valueOf(request.getParameter("startDate"));
		Date endDate = Date.valueOf(request.getParameter("endDate"));
		int trustmeans = Integer.parseInt(request.getParameter("trustmeans"));
		String tel = request.getParameter("tel");
		String trustAdd = request.getParameter("trustAdd");
		
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId();
		
		String memberid = request.getParameter("memberid");
		
		TrustPost tp = new TrustPost(startDate,endDate,trustmeans,tel,trustAdd,memberid,loginUser,petnum);
		
		int result = new MatchingService().sendTustpost(tp);
		
		String page = "";
		
		if(result >0) {
			page = "/TpostView.tu";
			request.setAttribute("tp", tp); 
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg","게시판 등록에 실패하였습니다");
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

