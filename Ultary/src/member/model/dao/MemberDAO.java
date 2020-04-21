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
import java.util.Properties;

import member.model.vo.Member;

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

	


}
