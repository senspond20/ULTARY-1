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
import post.model.vo.Post;

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
	
	// 커뮤니티 파트 /////////////////////////////////////////////////////
	
	public int getNListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getNListCount");
		
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
	
	public ArrayList<Post> selectNList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> nlist = null;
		
		String query = prop.getProperty("selectNList");
		
		int startRow = (currentPage -1) * boardLimit + 1;
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			nlist = new ArrayList<Post>();
			
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
				
				nlist.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return nlist;
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

	public ArrayList<Post> selectDlist(Connection conn,int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = null;
		
		String query = prop.getProperty("selectDlist");
		
		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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

	public int getDlistCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getDlistCount");
		
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

	public int getKlistCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getKlistCount");
		
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

	public ArrayList<Post> selectKlist(Connection conn,int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> klist = null;
		
		String query = prop.getProperty("selectKlist");
		
		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			klist = new ArrayList<Post>();
			
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
				
				klist.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return klist;
	}

	public int getRlistCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getRlistCount");
		
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

	public ArrayList<Post> selectRlist(Connection conn, int currentPage, int boardLimit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> rlist = null;
		
		String query = prop.getProperty("selectRlist");
		
		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			rlist = new ArrayList<Post>();
			
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
				
				rlist.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}

	public int getRelistCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getRelistCount");
		
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

	public ArrayList<Post> selectRelist(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> relist = null;
		
		String query = prop.getProperty("selectRelist");
		

		int startRow = (currentPage - 1) * boardLimit + 1; 
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			relist = new ArrayList<Post>();
			
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
				
				relist.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return relist;
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
}
