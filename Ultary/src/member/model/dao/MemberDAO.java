package member.model.dao;

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
import member.model.vo.Member;
import member.model.vo.Pet;

public class MemberDAO {
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Member m, Connection conn) {
		//3  로그인에 대한 쿼리 짜기
		/*
				query : 
					select userId, userPwd (x) -> * (O)  내정보는 수정하기 때문에 다 가져오는게 좋음 
					from member
					where userId = ? and userPwd = ?
		 */
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				Member loginMember = null;
				
				String query = prop.getProperty("loginMember");
				
				//프로퍼티에 있는 쿼리 가져오기
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, m.getMemberId());
					pstmt.setString(2, m.getPassword());
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						loginMember = new Member(
								rset.getString("MEMBERID"),
								rset.getString("NICKNAME"),
								rset.getString("MEMBERNAME"),
								rset.getString("PASSWORD"),
								rset.getString("GENDER").charAt(0), //char
								rset.getString("BIRTH"),
								rset.getString("EMAIL"),
								rset.getString("PHONE"),
								rset.getDate("ENROLLDATE"),//DATE
								rset.getString("ADDRESS"),
								rset.getInt("PWQUERY"), //int 
								rset.getString("PWQANS"),
								rset.getString("TRUST").charAt(0), //char
								rset.getInt("TRUSTMEANS"),
								rset.getString("TRUSTFIELD"),
								rset.getString("TRUSTADD"),
								rset.getInt("MARKSCORE"), //int
								rset.getString("WARN").charAt(0),
								rset.getString("STATUS").charAt(0));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return loginMember;
	
	}
	
	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		//넣는 아이디에 대한 갯수를 셈
		String query = prop.getProperty("idCheck");
		
		 try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			//결과값이 0~1개
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}


	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getPassword());
			pstmt.setString(5, member.getGender()+"");
			pstmt.setString(6, member.getBirth());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getPhone());
			pstmt.setString(9, member.getAddress());
			pstmt.setInt(10, member.getPwQuery());
			pstmt.setString(11, member.getPwqAns());
			pstmt.setString(12, member.getTrust()+"");
			pstmt.setInt(13, member.getTurstmeans());
			pstmt.setString(14, member.getTrustfield());
			pstmt.setString(15, member.getTrustAdd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int nickCheck(Connection conn, String userNick) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		//넣는 닉네임에 대한 갯수를 셈
		String query = prop.getProperty("nickCheck");
		
		 try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNick);
			
			rset = pstmt.executeQuery();
			//결과값이 0~1개
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int emailCheck(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		String query = prop.getProperty("emailCheck");
		
		 try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			//결과값이 0~1개
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public String findIdCheck1(Connection conn, String membername, String email) {
		// 이름과 이메일로 검색해서 특정 아이디 찾아서 보여주기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId1 = null;
		
		String query = prop.getProperty("findIdCheck1");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, membername);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 findId1 = rset.getString("MEMBERID");
				
//				System.out.println(memberid);
//				findId1 = new Member(memberid);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return findId1;
	}
	
	
	
	public Member NaverLoginMember(Member NaverUser, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member NaverLoginMember = null;
		//네이버 로그인은 아이디(6자리)와 이메일로 검사
		
		String query = prop.getProperty("NaverLoginMember");
		
		//프로퍼티에 있는 쿼리 가져오기
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, NaverUser.getMemberId());
			pstmt.setString(2, NaverUser.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//디비에 있는 정보를 받아서  NaverLoginMember 변수에 담기
				NaverLoginMember = new Member(
						rset.getString("MEMBERID"),
						rset.getString("NICKNAME"),
						rset.getString("MEMBERNAME"),
						rset.getString("PASSWORD"),
						rset.getString("GENDER").charAt(0), //char
						rset.getString("BIRTH"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getDate("ENROLLDATE"),//DATE
						rset.getString("ADDRESS"),
						rset.getInt("PWQUERY"), //int 
						rset.getString("PWQANS"),
						rset.getString("TRUST").charAt(0), //char
						rset.getInt("TRUSTMEANS"),
						rset.getString("TRUSTFIELD"),
						rset.getString("TRUSTADD"),
						rset.getInt("MARKSCORE"), //int
						rset.getString("WARN").charAt(0),
						rset.getString("STATUS").charAt(0));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return NaverLoginMember;
	}

	public int findPwdMember(Connection conn, String memberId, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		System.out.println("DAO에서 뽑아보는 아이디넘어왔니=>"+memberId);
		
		String query = prop.getProperty("findPwdMember1");
		//select count(*) from member where MEMBERID = ? and EMAIL = ?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			//결과값이 0~1개
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public String findIdCheck2(Connection conn, String membername, String phone) {
		//이름과 전화번호로 검색해서 특정 아이디 찾아서 보여주기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId2 = null;
//		System.out.println("안녕 [" + phone+"]");
//		System.out.println("["+membername+"]");
		
//		membername = "임연화";
//		phone = "01025358387";
		
//		String query = prop.getProperty("findIdCheckPhone");
		String query = "select MEMBERID from MEMBER where MEMBERNAME = '"+membername+"' and PHONE = '"+phone+"' and status = 'Y'";
		System.out.println(query);
		Statement stmt = null;
		
		try {
			
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, membername);
//			pstmt.setString(2, phone);
			
//			rset = pstmt.executeQuery();
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			System.out.println("들어오냐?1");
			if(rset.next()) {
				System.out.println("들어오냐?2");
				findId2 = rset.getString("MEMBERID");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		
		return findId2;
	}

	public int findPwdUpdate(Connection conn, String memberId, String email, String newPassword) {
		//로그인 안한 상태임.
		//회원이 입력한 아이디, 이메일로 검색해서 비번 업데이트하기.
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		int result = 0;
		
		//findPwdUpdate=update member set password=? where memberId=? and
		String query = prop.getProperty("findPwdUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, memberId);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int findPwdQnaMember(Connection conn, String memberId, int pwquery, String pwqans) {
		//로그인 안한 상태임.
		//회원이 입력한 아이디, 비번질문, 비번답으로 검색해서 회원 확인
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		int result = 0;
		
		//findPwdMember2 = select count(*) from member where PWQUERY = ? and PWQANS = ?
		String query = prop.getProperty("findPwdQnaMember2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, pwquery);
			pstmt.setString(3, pwqans);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int memberUpdate(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("memberUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setInt(5, m.getPwQuery());
			pstmt.setString(6, m.getPwqAns());
			pstmt.setString(7, m.getTrust() + "");
			pstmt.setInt(8, m.getTrustmeans());
			pstmt.setString(9, m.getTrustfield());
			pstmt.setString(10, m.getTrustAdd());
			pstmt.setString(11, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
			
		return result;
	}
	
	public int pwdUpdate(Connection conn, Member b, String passwordN) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("pwdUpdate");
		System.out.println(passwordN);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, passwordN);
			pstmt.setString(2, b.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);	
		}
				
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
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

	public int insertPet(Connection conn, Pet p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPet");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPetName());
			pstmt.setInt(2, p.getPetage());
			pstmt.setString(3, p.getPetGender() + "");
			pstmt.setString(4, p.getPetKind() + "");
			pstmt.setString(5, p.getMemberId());
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
			
		return result;
	}

	public int chkMemeber(Connection conn, Member b, String passwordN) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		//넣는 닉네임에 대한 갯수를 셈
		String query = prop.getProperty("chkMemeber");
		
		 try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getMemberId().trim());
			pstmt.setString(2, b.getPassword().trim());
			
			rset = pstmt.executeQuery();
			//결과값이 0~1개
			if(rset.next()) {
				result = rset.getInt(1);
			}
		 } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 System.out.println("디비다녀온 결과"+result);
		return result;
	}

	public int insertPetImage(Connection conn, Media m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPetImage");
		
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

	public ArrayList<Pet> loginPet(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Pet> p = new ArrayList<Pet>();
		
		String query = prop.getProperty("loginPet");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pet pet = new Pet(rset.getInt("petnum"),
								  rset.getString("petname"),
								  rset.getInt("petage"),
								  rset.getString("petgender").charAt(0),
								  rset.getString("petkind").charAt(0),
								  rset.getString("memberid"));
				
				p.add(pet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public ArrayList<Media> loginMedia(Connection conn, String memberid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		ArrayList<Media> m = new ArrayList<Media>();
		
		String query = prop.getProperty("loginMedia");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Media media = new Media(rset.getInt("medianum"),
										rset.getString("imgroute"),
										rset.getString("imgname"),
										rset.getString("webname"),
										rset.getInt("mediause"),
										rset.getString("memberid"),
										rset.getInt("postnum"),
										rset.getInt("petnum"));
				m.add(media);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	//// 호성 시작////////////////
	
	public ArrayList<Member> selectMarkMember(Connection conn, String loginId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> markList = new ArrayList<Member>();
		
		String query = prop.getProperty("selectMarkMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setNickname(rset.getString("nickname"));
				m.setMemberId(rset.getString("memberid"));
				m.setMarkscore(rset.getInt("markscore"));
				
				markList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return markList;
	}

	public ArrayList<Member> selectMember(Connection conn, String searchtext) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchtext);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("nickname"),
									rset.getString("gender").charAt(0),
									rset.getInt("markscore")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ResultSet selectMarkMem(Connection conn, String memberid, String markmem) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMarkMem");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			pstmt.setString(2, markmem);
			
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

	public int deleteMarkMem(Connection conn, String memberid, String markmem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMarkMem");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			pstmt.setString(2, markmem);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int markDown(Connection conn, String markmem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("markDown");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, markmem);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMarkMem(Connection conn, String memberid, String markmem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMarkMem");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberid);
			pstmt.setString(2, markmem);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int markUp(Connection conn, String markmem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("markUp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, markmem);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectMarkscore(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int markscore = 0;
		
		String query = prop.getProperty("selectMarkscore");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				markscore = rset.getInt("markscore");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return markscore;
	}

	public int updateTrust(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTrust");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getTrust()+"");
			pstmt.setInt(2, m.getTrustmeans());
			pstmt.setString(3, m.getTrustfield());
			pstmt.setString(4, m.getTrustAdd());
			pstmt.setString(5, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/////////////호성 끝


}
