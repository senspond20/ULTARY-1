package post.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class PostInsertServlet
 */
@WebServlet("/cminsert.po")
public class CmPostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmPostInsertServlet() {
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
			
			
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			String title = multiRequest.getParameter("title");
			String postRange = multiRequest.getParameter("postRange");
			String postContent = multiRequest.getParameter("postContent");
			String categorynum = multiRequest.getParameter("categorynum");
			String memberid = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
			
			Post p = new Post();
			p.setPostTitle(title);
			p.setPostRange(Integer.parseInt(postRange));
			p.setPostContent(postContent);
			p.setCategorynum(Integer.parseInt(categorynum));
			p.setMemberid(memberid);
			System.out.println(p);
			
			ArrayList<Media> fileList = new ArrayList<Media>();
			for(int i = originFiles.size() - 1; i >=0; i--) {
				Media m = new Media();
				m.setImgroute(savePath);
				m.setImgName(originFiles.get(i));
				m.setWebName(saveFiles.get(i));
				m.setMemberId(memberid);
				
				fileList.add(m);
			}
			
			int result = new PostService().insertPost(p, fileList);
			
			if(result > 0) {
				if(p.getCategorynum() == 1) {
					response.sendRedirect("cmnotice.po");
				} else {
				response.sendRedirect("cmAllList.po");
				}
			} else {
				for(int i=0;i<saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
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
