package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Member;
import trust.model.vo.TrustReview;

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
		if(result > 0) {
			commit(conn);
		}else {
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

	public ArrayList<Member> selectMarkMember(String loginId) {
		Connection conn = getConnection();
		
		ArrayList<Member> markList = new MemberDAO().selectMarkMember(conn, loginId);
		
		close(conn);
		return markList;
	}

}
