package post.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Media;
import post.model.vo.CAns;
import post.model.vo.MarkPost;
import post.model.vo.Post;
import post.model.vo.PostComment;

public class PostDAO {
	private Properties prop = new Properties();
	
	public PostDAO() {
		String fileName = PostDAO.class.getResource("/sql/post/post-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPost(Connection conn, Post p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostContent());
			pstmt.setInt(3, p.getPostRange());
			pstmt.setInt(4, p.getCategorynum());
			pstmt.setString(5, p.getMemberid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertMedia(Connection conn, ArrayList<Media> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMedia");
		
		for(int i = 0; i<fileList.size(); i++) {
			Media m = fileList.get(i);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, m.getImgroute());
				pstmt.setString(2, m.getImgName());
				pstmt.setString(3, m.getWebName());
				pstmt.setString(4, m.getMemberId());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	public ArrayList selectPList(Connection conn, String memberId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> pList = new ArrayList<Post>();
		
		String query = prop.getProperty("selectPList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pList.add(new Post(rset.getInt("postnum"),
									rset.getString("posttitle"),
									rset.getString("postcontent"),
									rset.getInt("postlike"),
									rset.getDate("postDate"),
									rset.getInt("postclick"),
									rset.getInt("postrange"),
									rset.getInt("categorynum"),
									rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}

	public ArrayList selectMList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Media> mList = new ArrayList<Media>();
		
		String query = prop.getProperty("selectMList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mList.add(new Media(rset.getInt("medianum"),
									rset.getString("imgroute"),
									rset.getString("imgname"),
									rset.getString("webname"),
									rset.getInt("mediause"),
									rset.getString("nickname"),
									rset.getInt("postnum"),
									rset.getInt("petnum")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mList;
	}

	public int insertProfile(Connection conn, Media m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getImgroute());
			pstmt.setString(2, m.getImgName());
			pstmt.setString(3, m.getWebName());
			pstmt.setString(4, m.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Media selectProImg(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Media proImg = null;
		
		String query = prop.getProperty("selectProImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				proImg = new Media(rset.getInt("medianum"),
										rset.getString("imgroute"),
										rset.getString("imgname"),
										rset.getString("webname"),
										rset.getInt("mediause"),
										rset.getNString("memberid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return proImg;
	}

	public ResultSet selectLikePost(Connection conn, int postNum, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectLikePost");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberId);
			
			rset = pstmt.executeQuery();
			
			if(!rset.next()) {
				rset = null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rset;
	}

	public int likeDown(Connection conn, int postNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("likeDown");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLikePost(Connection conn, int postNum, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteLikePost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int likeUp(Connection conn, int postNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("likeUp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertLikePost(Connection conn, int postNum, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertLikePost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectPostLike(Connection conn, int postNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postlike = 0;
		
		String query = prop.getProperty("selectPostLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				postlike = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return postlike;
	}

	public int deleteorigProfile(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteorigProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertComment(Connection conn, PostComment pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pc.getcContent());
			pstmt.setInt(2, pc.getcRange());
			pstmt.setInt(3, pc.getPostNum());
			pstmt.setString(4, pc.getMemberid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public ArrayList<PostComment> selectCommentList(Connection conn, int postNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PostComment> list = new ArrayList<PostComment>();
		
		String query = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PostComment(rset.getInt("c_num"),
										rset.getString("c_content"),
										rset.getDate("c_date"),
										rset.getInt("c_like"),
										rset.getInt("c_range"),
										rset.getInt("postnum"),
										rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}

	public ArrayList<PostComment> selectAllComment(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PostComment> list = new ArrayList<PostComment>();
		
		String query = prop.getProperty("selectAllComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PostComment(rset.getInt("c_num"),
										rset.getString("c_content"),
										rset.getDate("c_date"),
										rset.getInt("c_like"),
										rset.getInt("c_range"),
										rset.getInt("postnum"),
										rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list;
	}

	public ResultSet selectprofile(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectprofile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(!rset.next()) {
				rset = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rset;
	}

	public ResultSet selectlikepc(Connection conn, int cNum, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectlikepc");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			pstmt.setString(2, memberId);
			
			rset = pstmt.executeQuery();
			
			if(!rset.next()) {
				rset = null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rset;
	}

	public int pcLikeDown(Connection conn, int cNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("pcLikeDown");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLikepc(Connection conn, int cNum, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteLikepc");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int pcLikeUp(Connection conn, int cNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("pcLikeUp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertLikepc(Connection conn, int cNum, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertLikepc");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectpcLikeNum(Connection conn, int cNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int clike = 0;
		
		String query = prop.getProperty("selectpcLikeNum");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				clike = rset.getInt("c_like");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return clike;
	}

	public ArrayList<Post> selectpOther(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		
		String query = prop.getProperty("selectpOther");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("postnum"),
								  rset.getString("posttitle"),
								  rset.getString("postcontent"),
								  rset.getInt("postlike"),
								  rset.getDate("postdate"),
								  rset.getInt("postclick"),
								  rset.getInt("postrange"),
								  rset.getInt("categorynum"),
								  rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<PostComment> selectpcOther(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PostComment> list = new ArrayList<PostComment>();
		
		String query = prop.getProperty("selectpcOther");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PostComment(rset.getInt("c_num"),
										 rset.getString("c_content"),
										 rset.getDate("c_date"),
										 rset.getInt("c_like"),
										 rset.getInt("c_range"),
										 rset.getInt("postnum"),
										 rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Media> selectmOther(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Media> list = new ArrayList<Media>();
		
		String query = prop.getProperty("selectmOther");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Media(rset.getInt("medianum"),
								   rset.getString("imgroute"),
								   rset.getString("imgname"),
								   rset.getString("webname"),
								   rset.getInt("mediause"),
								   rset.getString("memberid"),
								   rset.getInt("postnum"),
								   rset.getInt("petnum")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deletePost(Connection conn, int pNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCAns(Connection conn, CAns ca) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCAns");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ca.getAnsContent());
			pstmt.setInt(2, ca.getcNum());
			pstmt.setString(3, ca.getMemberid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<CAns> selectCAns(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CAns> list = new ArrayList<CAns>();
		
		String query = prop.getProperty("selectCAns");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CAns(rset.getInt("ans_num"),
								  rset.getString("ans_content"),
								  rset.getDate("ans_date"),
								  rset.getInt("c_num"),
								  rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deletePostComment(Connection conn, int cNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePostComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int deleteCAns(Connection conn, int ansNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCAns");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ansNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<CAns> selectcaOther(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CAns> list = new ArrayList<CAns>();
		
		String query = prop.getProperty("selectcaOther");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CAns(rset.getInt("ans_num"),
								  rset.getString("ans_content"),
								  rset.getDate("ans_date"),
								  rset.getInt("c_num"),
								  rset.getString("nickname")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Media> selectproimg(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Media> list = new ArrayList<Media>();
		
		String query = prop.getProperty("selectproimg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			pstmt.setString(2, nickname);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Media(rset.getString("webname"),
								   rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Post> selectMarkPost(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		
		String query = prop.getProperty("selectMarkPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("postnum"),
								  rset.getString("posttitle"),
								  rset.getString("postcontent"),
								  rset.getInt("postlike"),
								  rset.getDate("postdate"),
								  rset.getInt("postclick"),
								  rset.getInt("postrange"),
								  rset.getInt("categorynum"),
								  rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<PostComment> selectMarkpc(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PostComment> list = new ArrayList<PostComment>();
		
		String query = prop.getProperty("selectMarkpc");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new PostComment(rset.getInt("c_num"),
										rset.getString("c_content"),
										rset.getDate("c_date"),
										rset.getInt("c_like"),
										rset.getInt("c_range"),
										rset.getInt("postnum"),
										rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<CAns> selectMarkCAns(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CAns> list = new ArrayList<CAns>();
		
		String query = prop.getProperty("selectMarkCAns");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CAns(rset.getInt("ans_num"),
								  rset.getString("ans_content"),
								  rset.getDate("ans_date"),
								  rset.getInt("c_num"),
								  rset.getString("nickname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Media> selectMarkm(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Media> list = new ArrayList<Media>();
		
		String query = prop.getProperty("selectMarkm");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Media(rset.getInt("medianum"),
									rset.getString("imgroute"),
									rset.getString("imgname"),
									rset.getString("webname"),
									rset.getInt("mediause"),
									rset.getString("nickname"),
									rset.getInt("postnum"),
									rset.getInt("petnum")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Media> selectAllproimg(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Media> list = new ArrayList<Media>();
		
		String query = prop.getProperty("selectAllproimg");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				list.add(new Media(rset.getInt("medianum"),
									rset.getString("imgroute"),
									rset.getString("imgname"),
									rset.getString("webname"),
									rset.getInt("mediause"),
									rset.getString("nickname"),
									rset.getInt("postnum"),
									rset.getInt("petnum")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ResultSet selectCheckMarkPost(Connection conn, int postNum, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCheckMarkPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberid);
			
			rset = pstmt.executeQuery();
			
			if(!rset.next()) {
				rset = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return rset;
	}

	public int deleteMarkPost(Connection conn, int postNum, String memberid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMarkPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMarkPost(Connection conn, int postNum, String memberid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMarkPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, memberid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MarkPost> selectAllmp(Connection conn, String loginId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MarkPost> list = new ArrayList<MarkPost>();
		
		String query = prop.getProperty("selectAllmp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MarkPost(rset.getInt("mp_num"),
									  rset.getDate("mp_date"),
									  rset.getInt("postnum"),
									  rset.getString("nickname")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 커뮤니티 파트 /////////////////////////////////////////////////////
	public int getListCount(Connection conn,int categorynum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, categorynum);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}
	
	public ArrayList<Post> selectList(Connection conn, int currentPage, int boardLimit,int categorynum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = null;
		
		String query = prop.getProperty("getList");
		
		int startRow = (currentPage -1) * boardLimit + 1;
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, categorynum);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Post>();
			
			while(rset.next()) {
				Post post = new Post(rset.getInt("postnum"),
									 rset.getString("posttitle"),
									 rset.getString("postcontent"),
									 rset.getInt("postlike"),
									 rset.getDate("postdate"),
									 rset.getInt("postclick"),
									 rset.getInt("postrange"),
									 rset.getInt("categorynum"),
									 rset.getString("nickname"));
				
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getAllListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getAllListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	

	public ArrayList<Post> selectAllList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> AllList = null;
		
		String query = prop.getProperty("selectAllList");
		
		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			AllList = new ArrayList<Post>();
			
			while(rset.next()) {
				Post post = new Post(rset.getInt("postnum"),
									rset.getString("posttitle"),
									rset.getString("postcontent"),
									rset.getInt("postlike"),
									rset.getDate("postdate"),
									rset.getInt("postclick"),
									rset.getInt("postRange"),
									rset.getInt("categorynum"),
									rset.getString("nickname"));
				
				AllList.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return AllList;
	}

		
	public int updatePostCount(Connection conn, int pno) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("updatePostCount");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, pno);
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      return result;
	   }

	   public Post selectPostDetail(Connection conn, int pno) {
	      //쿼리 : select * from post where postnum=?
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Post post = null;
	      
	      String query = prop.getProperty("selectPostDetail");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, pno);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            post = new Post(rset.getInt("postnum"),
	                       rset.getString("posttitle"),
	                       rset.getString("postcontent"),
	                       rset.getInt("postlike"),
	                       rset.getDate("postdate"),
	                       rset.getInt("postclick"),
	                       rset.getInt("postrange"),
	                       rset.getInt("categorynum"),
	                       rset.getString("nickname"));
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return post;
	   }

	   //
	   public ArrayList<Media> selectphoto(Connection conn, int pno) {
	      // select * from media where postnum = ? order by medianum
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Media> list = null;
	      
	      String query = prop.getProperty("selectphoto");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, pno);
	         
	         rset = pstmt.executeQuery();
	         
	         list = new ArrayList<Media>();
	         
	         while(rset.next()) {
	            Media m = new Media();
	            m.setMediaNum(rset.getInt("medianum"));
	            m.setImgName(rset.getString("imgname"));
	            m.setWebName(rset.getString("webname"));
	            m.setImgroute(rset.getString("imgroute"));
	            m.setMediaUse(rset.getInt("mediause"));
	            m.setMemberId(rset.getString("memberid"));
	            m.setPostNum(rset.getInt("postnum"));
	            m.setPetNum(rset.getInt("petnum"));
	            list.add(m);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }

	 // 조건 검색
	 //////////////////페이징 처리 하기/////////////////////////
	   public int getSearchListCount(Connection conn, String searchtext, int categorynum, String searchcon, int date) {
		   PreparedStatement pstmt = null;
		   ResultSet rset = null;
		   int result=0;
		  
		   String query ="";
		   int num=0;
		   
		   if(date == 0) { // 전체 기간
				if(categorynum == 0) { // 전체게시판
					if(searchcon.equals("ct")) { // 제목 + 내용
						query = prop.getProperty("result1Count");
						num = 1;
					} else if(searchcon.equals("title")) {
						query = prop.getProperty("result2Count"); // 제목만
						num = 2;
					} else {
						query = prop.getProperty("result3Count"); // 작성자
						num = 3;
					}
				} else { // 전체 게시판 X
					if(searchcon.equals("ct")) { // 제목 + 내용
				         query = prop.getProperty("result4Count");
				         num = 4;
					} else if(searchcon.equals("title")) { // 제목만 
						query = prop.getProperty("result5Count");
						num = 5;
					} else { // 작성자
						query = prop.getProperty("result6Count");
						num = 6;
					}
				}
			} else { // 전체 기간 X
				if(categorynum == 0) { // 전체게시판
					if(searchcon.equals("ct")) { // 제목 + 내용
						query = prop.getProperty("result7Count");
						num=7;
					} else if(searchcon.equals("title")) {
						query = prop.getProperty("result8Count"); // 제목만
						num=8;
					} else {
						query = prop.getProperty("result9Count"); // 작성자
						num=9;
					}
				} else { // 전체 게시판 X
					if(searchcon.equals("ct")) { // 제목 + 내용
				         query = prop.getProperty("result10Count");
				         num=10;
					} else if(searchcon.equals("title")) { // 제목만 
						query = prop.getProperty("result11Count");
						num=11;
					} else { // 작성자
						query = prop.getProperty("result12Count");
						num=12;
					}
				}
			}
		   
		   try {
				pstmt = conn.prepareStatement(query);
				
				switch(num) {
				case 1:{
					pstmt.setString(1, searchtext);
					pstmt.setString(2, searchtext);
				};break;
				case 2 : case 3: {
					pstmt.setString(1,searchtext);
				};break;
				case 4: {
					pstmt.setInt(1, categorynum);
					pstmt.setString(2,searchtext);
					pstmt.setString(3,searchtext);
				};break;
				case 5: case 6: {
					pstmt.setInt(1, categorynum);
					pstmt.setString(2, searchtext);
				};break;
				case 7: {
					pstmt.setInt(1,date);
					pstmt.setString(2, searchtext);
					pstmt.setString(3, searchtext);
				}break;
				case 8: case 9: {
					pstmt.setInt(1, date);
					pstmt.setString(2, searchtext);
				}break;
				case 10 : {
					pstmt.setInt(1, date);
					pstmt.setInt(2, categorynum);
					pstmt.setString(3, searchtext);
					pstmt.setString(4, searchtext);
				};break;
				case 11:case 12: {
					pstmt.setInt(1, date);
					pstmt.setInt(2, categorynum);
					pstmt.setString(3, searchtext);
				};break;
				}
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt(1);
				}
		   }catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		   
		return result;
		}
	  
	//////////////////////////검색 결과 불러오기/////////////////////////////////////
	public ArrayList<Post> selectSearchList(Connection conn, String searchtext, int categorynum, String searchcon,
			int date, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = null;
		
		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		String query = "";
		int num = 0;
		
		if(date == 0) { // 전체 기간
			if(categorynum == 0) { // 전체게시판
				if(searchcon.equals("ct")) { // 제목 + 내용
					query = prop.getProperty("slist1");
					num = 1;
				} else if(searchcon.equals("title")) {
					query = prop.getProperty("slist2"); // 제목만
					num = 2;
				} else {
					query = prop.getProperty("slist3"); // 작성자
					num = 3;
				}
			} else { // 전체 게시판 X
				if(searchcon.equals("ct")) { // 제목 + 내용
			         query = prop.getProperty("slist4");
			         num = 4;
				} else if(searchcon.equals("title")) { // 제목만 
					query = prop.getProperty("slist5");
					num = 5;
				} else { // 작성자
					query = prop.getProperty("slist6");
					num = 6;
				}
			}
		} else { // 전체 기간 X
			if(categorynum == 0) { // 전체게시판
				if(searchcon.equals("ct")) { // 제목 + 내용
					query = prop.getProperty("slist7");
					num=7;
				} else if(searchcon.equals("title")) {
					query = prop.getProperty("slist8"); // 제목만
					num=8;
				} else {
					query = prop.getProperty("slist9"); // 작성자
					num=9;
				}
			} else { // 전체 게시판 X
				if(searchcon.equals("ct")) { // 제목 + 내용
			         query = prop.getProperty("slist10");
			         num=10;
				} else if(searchcon.equals("title")) { // 제목만 
					query = prop.getProperty("slist11");
					num=11;
				} else { // 작성자
					query = prop.getProperty("slist12");
					num=12;
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			switch(num) {
			case 1:{
				pstmt.setString(1, searchtext);
				pstmt.setString(2, searchtext);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			};break;
			case 2 : case 3: {
				pstmt.setString(1,searchtext);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			};break;
			case 4: {
				pstmt.setInt(1, categorynum);
				pstmt.setString(2,searchtext);
				pstmt.setString(3,searchtext);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			};break;
			case 5: case 6: {
				pstmt.setInt(1, categorynum);
				pstmt.setString(2, searchtext);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			};break;
			case 7: {
				pstmt.setInt(1,date);
				pstmt.setString(2, searchtext);
				pstmt.setString(3, searchtext);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			}break;
			case 8: case 9: {
				pstmt.setInt(1, date);
				pstmt.setString(2, searchtext);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}break;
			case 10 : {
				pstmt.setInt(1, date);
				pstmt.setInt(2, categorynum);
				pstmt.setString(3, searchtext);
				pstmt.setString(4, searchtext);
				pstmt.setInt(5, startRow);
				pstmt.setInt(6, endRow);
			};break;
			case 11:case 12: {
				pstmt.setInt(1, date);
				pstmt.setInt(2, categorynum);
				pstmt.setString(3, searchtext);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			};break;
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Post>();
			
			while(rset.next()) {
				Post p = new Post(rset.getInt("postnum"),
									rset.getString("posttitle"),
									rset.getString("postcontent"),
									rset.getInt("postlike"),
									rset.getDate("postdate"),
									rset.getInt("postclick"),
									rset.getInt("postrange"),
									rset.getInt("categorynum"),
									rset.getString("nickname"));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 모아보기 게시판 사진 가져오기
	public ArrayList<Media> selectAllMList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Media> list = null;
		
		String query = prop.getProperty("selectAllMList");
		
		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Media>();
			
			while(rset.next()) {
				Media m = new Media(rset.getInt("medianum"),
									rset.getString("imgroute"),
									rset.getString("imgname"),
									rset.getString("webname"),
									rset.getInt("mediause"),
									rset.getString("memberid"),
									rset.getInt("postnum"),
									rset.getInt("petnum"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	// POST 내용 업데이트
	public int updatePost(Connection conn, String title, String content, String postRange,int pno) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("PostUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(postRange));
			pstmt.setInt(4, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 수정을 위한 삭제,,,,
	public int deleteMedia(Connection conn, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("MediaDelete");
			
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	// 삭제 한 후의 사진 넣기
	public int deleteinsertMedia(Connection conn, ArrayList<Media> fileList,int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("DeleteInsert");
		
		for(int i = 0; i<fileList.size(); i++) {
			Media m = fileList.get(i);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, m.getImgroute());
				pstmt.setString(2, m.getImgName());
				pstmt.setString(3, m.getWebName());
				pstmt.setString(4, m.getMemberId());
				pstmt.setInt(5, pno);	
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}
	
	// 사진이 있는상태인지 없는 상태인지 조회하기 위함
	public int photostatus(Connection conn, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("photostatus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
