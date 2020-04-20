package post.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.model.vo.Media;
import post.model.dao.PostDAO;
import post.model.vo.Post;

public class PostService {

	public int insertPost(Post p, ArrayList<Media> fileList) {
		Connection conn = getConnection();
		
		PostDAO dao = new PostDAO();
		
		int result1 = dao.insertPost(conn, p);
		if(!fileList.isEmpty()) {
			int result2 = dao.insertMedia(conn, fileList);
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			if(result1 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		
		return result1;
	}

	public ArrayList selectTList(int i, String memberId) {
		
		Connection conn = getConnection();
		ArrayList list = null;
		PostDAO dao = new PostDAO();
		
		if(i == 1) {
			list = dao.selectPList(conn, memberId);
		} else {
			list = dao.selectMList(conn, memberId);
		}
		close(conn);
		
		return list;
	}

	public int insertProfile(Media m) {
		Connection conn = getConnection();
		
		int result2 = new PostDAO().deleteorigProfile(conn, m.getMemberId());
		int result1 = 0;
		
		if(result2 > 0) {
			result1 = new PostDAO().insertProfile(conn, m);
			if(result1 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		return result1;
	}

	public Media selectProImg(String memberId) {
		Connection conn = getConnection();
		
		Media proImg = new PostDAO().selectProImg(conn, memberId);
		
		close(conn);
		
		return proImg;
	}

	public int postLike(int postNum, String memberId) {
		Connection conn = getConnection();
		
		ResultSet rset = new PostDAO().selectLikePost(conn, postNum, memberId);
		int postLike;
		
		int result1 = 0;
		int result2 = 0;
		
		if(rset != null) {
			result1 = new PostDAO().likeDown(conn, postNum);
			result2 = new PostDAO().deleteLikePost(conn, postNum, memberId);
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			result1 = new PostDAO().likeUp(conn, postNum);
			result2 = new PostDAO().insertLikePost(conn, postNum, memberId);
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		postLike = new PostDAO().selectPostLike(conn, postNum);
		
		close(conn);
		return postLike;
	}
	public int getNListCount() {
		Connection conn = getConnection();
		
		int result = new PostDAO().getNListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Post> selectNList(int currentPage, int boardLimit) {
		// 커뮤니티 공지사항 전체 목록 
		Connection conn = getConnection();
		
		ArrayList<Post> nlist = new PostDAO().selectNList(conn,currentPage,boardLimit);
		
		close(conn);
		
		return nlist;
	}

	public ArrayList<Post> selectAllList(int currentPage, int boardLimit) {
		// 공지사항을 제외한 모든 글 모아보기
		Connection conn = getConnection();
		ArrayList<Post> AllList = new PostDAO().selectAllList(conn,currentPage,boardLimit);
		
		close(conn);
		
		return AllList;
	}

	public int getAllListCount() {
		Connection conn= getConnection();
		
		int result = new PostDAO().getAllListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectDlist(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostDAO().selectDlist(conn,currentPage,boardLimit);
		
		close(conn);
		
		
		return list;
	}

	public int getDlistCount() {
		Connection conn = getConnection();
		
		int result = new PostDAO().getDlistCount(conn);
		
		close(conn);
		
		
		return result;
	}

	public int getKlistCount() {
		Connection conn = getConnection();
		
		int result = new PostDAO().getKlistCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectKlist(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Post> klist = new PostDAO().selectKlist(conn,currentPage,boardLimit);
		
		close(conn);
		
		return klist;
	}

	public int getRlistCount() {
		Connection conn = getConnection();
		
		int result = new PostDAO().getRlistCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectRlist(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Post> rlist = new PostDAO().selectRlist(conn,currentPage,boardLimit);
		
		close(conn);
		
		return rlist;
	}

	public int getRelistCount() {
		Connection conn = getConnection();
		
		int result = new PostDAO().getRelistCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectRelist(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Post> relist = new PostDAO().selectRelist(conn,currentPage,boardLimit);
		
		close(conn);
		
		return relist;
	}
	
	   public Post selectPostDetail(int pno) {
		      Connection conn = getConnection();
		      PostDAO dao = new PostDAO();
		      Post post = null;
		      
		      //조회수 증가 
		      int result = dao.updatePostCount(conn,pno); 
		      
		      if(result > 0) {
		         post =dao.selectPostDetail(conn,pno);
		         if(post != null) {
		            commit(conn);
		         } else {
		            rollback(conn);
		         }
		      } else {
		         rollback(conn);
		      }
		      
		      return post;
		   }


		   public ArrayList<Media> selectphoto(int pno) {
		      Connection conn = getConnection();
		      ArrayList<Media> list = new PostDAO().selectphoto(conn,pno);
		      
		      close(conn);
		      
		      return list;
		   }
	
	
	
}
