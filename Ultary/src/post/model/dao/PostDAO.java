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
