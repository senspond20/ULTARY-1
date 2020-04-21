package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

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

	

}
