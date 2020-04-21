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

import member.model.vo.Member;
import trust.model.vo.TrustReview;

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
			pstmt.setString(13, member.getTrustfield());
			pstmt.setString(14, member.getTrustAdd());
			pstmt.setInt(15, member.getTrustmeans());
			
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




}
