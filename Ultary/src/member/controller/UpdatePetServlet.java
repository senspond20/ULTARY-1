package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Media;
import member.model.vo.Member;
import member.model.vo.Pet;
import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class UpdatePetServlet
 */
@WebServlet("/insert.pet")
public class UpdatePetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");	
			String savePath = root + "uploadFiles/";
				
			MultipartRequest multiRequest
			 = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			String saveFiles = "";
			String originFiles = "";
				
			Enumeration<String> files = multiRequest.getFileNames();
			if(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles = multiRequest.getFilesystemName(name);
					originFiles = multiRequest.getOriginalFileName(name);
					
				}
			}
				
			String title = multiRequest.getParameter("title");
			String postRange = multiRequest.getParameter("postRange");
			String postContent = multiRequest.getParameter("postContent");
			String categorynum = multiRequest.getParameter("categorynum");
			String memberid = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
				
			String petname = multiRequest.getParameter("petname");
			int petage = Integer.parseInt(multiRequest.getParameter("petage"));
			String petgend = multiRequest.getParameter("petgender");
			char petgender = petgend.charAt(0);
			char petkind = multiRequest.getParameter("petkind").charAt(0);
		
			Pet pet = new Pet(petname, petage, petgender, petkind, memberid);
		
			Media m = new Media(savePath, originFiles, saveFiles, memberid); 
			
			System.out.println(pet);
		
			int result = new MemberService().insertPet(pet, m);
		
			String page = "";
			String msg = "";
		
			if(result > 0) {
				//	response.sendRedirect("views/myPage/memberUpdate.jsp");
				page= "views/common/SuccessPage.jsp";	
				msg= "수정저장에 성공헀습니다.";
				request.setAttribute("msg", msg);
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
			} else {
					page= "views/common/errorPage.jsp";	
					msg= "수정저장에 실패헀습니다.";
					request.setAttribute("msg", msg);
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
				}
			}
		}
	
	private ArrayList<String> add(String filesystemName) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
