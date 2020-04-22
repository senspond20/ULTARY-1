package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import post.model.service.PostService;
import post.model.vo.PostComment;

/**
 * Servlet implementation class CommentInsertServelt
 */
@WebServlet("/insertComment.tl")
public class CommentInsertServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		int range = Integer.parseInt(request.getParameter("range"));
		
		PostComment pc = new PostComment();
		pc.setMemberid(writer);
		pc.setcContent(content);
		pc.setPostNum(pNum);
		pc.setcRange(range);
		
		ArrayList<PostComment> list = new PostService().insertComment(pc);
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
