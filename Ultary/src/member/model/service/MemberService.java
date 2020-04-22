package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Media;
import member.model.vo.Member;
import member.model.vo.Pet;

public class MemberService {

	public Member loginMember(Member m) {
		Connection conn = getConnection();

		Member loginMember = new MemberDAO().loginMember(m, conn);
		close(conn);

		return loginMember;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();

		int result = new MemberDAO().insertMember(conn, member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}

	public int idCheck(String userId) {
		Connection conn = getConnection();

		int result = new MemberDAO().idCheck(conn, userId);
		close(conn);
		return result;
	}

	public int nickCheck(String userNick) {
		Connection conn = getConnection();

		int result = new MemberDAO().nickCheck(conn, userNick);
		close(conn);
		return result;
	}

	public int memberEmail(String email) {
		Connection conn = getConnection();

		int result = new MemberDAO().emailCheck(conn, email);
		close(conn);

		return result;
	}


	public Member NaverLoginMember(Member NaverUser) {
		Connection conn = getConnection();

		Member NaverLoginMember = new MemberDAO().NaverLoginMember(NaverUser, conn);
		close(conn);

		return NaverLoginMember;
	}

	public String findIdMember1(String membername, String email) {
		Connection conn = getConnection();

		String findId1 = new MemberDAO().findIdCheck1(conn, membername, email);

		close(conn);
		return findId1;
	}

	public String findIdMember2(String membername, String phone) {
		Connection conn = getConnection();
		System.out.println("서비스에서 폰정보 받아옴 :"+phone);
		String findId2 = new MemberDAO().findIdCheck2(conn, membername, phone);
		System.out.println("서비스에서 다시 폰결과 보내기 :"+findId2);
		close(conn);
		return findId2;
	}

	public int findPwdMember(String memberId, String email) {
		Connection conn = getConnection();

		int result = new MemberDAO().findPwdMember(conn, memberId, email);

		close(conn);
		return result;
	}

	public int findPwdUpdate(String memberId, String email, String newPassword) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().findPwdUpdate(conn, memberId, email, newPassword);
		
		close(conn);
		return result;
	}

	public int findPwdQnaMember(String memberId, int pwquery, String pwqans) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().findPwdQnaMember(conn, memberId, pwquery, pwqans);
		
		close(conn);
		return result;
	}
	
	public int memberUpdate(Member m) {
		Connection conn = getConnection();

		int result = new MemberDAO().memberUpdate(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int pwdUpdate(Member b, String passwordN) {
		Connection conn = getConnection();
		
		//아이디와 현재비번으로 회원이 있는가 확인
		int result = new MemberDAO().chkMemeber(conn, b, passwordN);
		System.out.println("회원이면 1 = "+result);
		if (result == 1) { //있으면
			//비번 업데이트하고 
			int result1 = new MemberDAO().pwdUpdate(conn, b, passwordN);
			if (result1 == 1) {//업데이트에 성공하면
				commit(conn);

			} else {
				rollback(conn);
			}
		}
		close(conn);

		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();

		int result = new MemberDAO().deleteMember(conn, memberId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertPet(Pet pet, Media m) {
		Connection conn = getConnection();

		int result1 = new MemberDAO().insertPet(conn, pet);
		if(result1 >0) {
			int result2 = new MemberDAO().insertPetImage(conn, m);
			if(result2 > 0) {
				commit(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result1;

	}

	public ArrayList<Pet> loginPet(String memberid) {
		Connection conn = getConnection();
		
		ArrayList<Pet> p = new MemberDAO().loginPet(conn, memberid);
		
		close(conn);
		return p;
	}

	public ArrayList<Media> loginMedia(String memberid) {
		Connection conn = getConnection();
		
		ArrayList<Media> m = new MemberDAO().loginMedia(conn, memberid);
		
		close(conn);
		return m;
	}
	
	////////////////호성
	public ArrayList<Member> selectMarkMember(String loginId) {
		Connection conn = getConnection();
		
		ArrayList<Member> markList = new MemberDAO().selectMarkMember(conn, loginId);
		
		close(conn);
		return markList;
	}

	public ArrayList<Member> selectMember(String searchtext) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDAO().selectMember(conn, searchtext);
		
		close(conn);
		
		return list;
	}

	public int MarkMemInsert(String memberid, String markmem) {
		Connection conn = getConnection();
		
		ResultSet rset = new MemberDAO().selectMarkMem(conn, memberid, markmem);
		
		int result1 = 0;
		int result2 = 0;
		
		if(rset != null) {
			result1 = new MemberDAO().deleteMarkMem(conn, memberid, markmem);
			result2 = new MemberDAO().markDown(conn, markmem);
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			result1 = new MemberDAO().insertMarkMem(conn, memberid, markmem);
			result2 = new MemberDAO().markUp(conn, markmem);
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		
		return result1;
	}

	public int selectMarkscore(String nickname) {
		Connection conn = getConnection();
		
		int markscore = new MemberDAO().selectMarkscore(conn, nickname);
		
		close(conn);
		
		return markscore;
	}

	public int updateTrust(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updateTrust(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	//////////////호성 끝
}
