package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;

/**
 * Servlet implementation class ProfileChange
 */
@WebServlet("/insertpro.tl")
public class ProfileChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileChange() {
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
				
				if(multiRequest.getFilesystemName(name)!= null) {
					saveFiles = multiRequest.getFilesystemName(name);
					originFiles = multiRequest.getOriginalFileName(name);
				}
			}
			
			Media m = new Media();
			m.setImgroute(savePath);
			m.setImgName(originFiles);
			m.setWebName(saveFiles);
			m.setMemberId(((Member)request.getSession().getAttribute("loginUser")).getMemberId());
			
			
			String originImg = request.getParameter("originImg");
			String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
			int result = new PostService().insertProfile(m);
			Media proImg = new PostService().selectProImg(memberId);
				
			if(result > 0) {
				File failedFile = new File(request.getSession().getServletContext().getRealPath("/")+"uploadFiles/"+originImg);
				failedFile.delete();
				HttpSession session = request.getSession();
				session.setAttribute("proImg", proImg);
				request.setAttribute("msg", "프로필사진 변경에 성공");
				request.getRequestDispatcher("views/common/SuccessPage.jsp").forward(request, response);
			} else {
				File failedFile = new File(savePath + saveFiles);
				failedFile.delete();
				request.setAttribute("msg", "프로필사진 변경에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
