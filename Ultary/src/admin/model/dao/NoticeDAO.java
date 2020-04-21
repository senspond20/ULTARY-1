package admin.model.dao;

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

import admin.model.vo.Notice;
import admin.model.vo.PageInfo;

/*
CREATE TABLE notice(
	n_num	number	NOT NULL,
	n_title	varchar2(50)	NOT NULL,
	n_content	varchar2(2000)	NOT NULL,
	n_clicks	number	NOT NULL,
	n_date  	date	DEFAULT sysdate,
	memberid	varchar2(15)	NOT NULL
);

INSERT INTO NOTICE VALUES (SEQ_NNO.NEXTVAL, '첫번째 공지사항입니다.', '환영합니다.', 0, SYSDATE, 'admin');
INSERT INTO NOTICE VALUES (SEQ_NNO.NEXTVAL, '두번째 공지사항입니다.', '신종코로나 대응정책.', 0,SYSDATE, 'admin');
INSERT INTO NOTICE VALUES (SEQ_NNO.NEXTVAL, '세번째 공지사항입니다.', '휴업.',  0,SYSDATE, 'admin');
commit;

SELECT * FROM NOTICE ORDER BY N_NUM DESC;

select * from NOTICE;

 */
public class NoticeDAO {

	private Properties prop = new Properties();

	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/admin/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Notice> selectList(Connection conn) {

		// selectList = select N_NUM, N_TITLE, N_CONTENT, N_CLICKS, N_DATE, NICKNAME
		// from notice
		// join member using(memberid) ORDER BY DESC

		Statement stmt = null;
		ResultSet rset = null;

		ArrayList<Notice> list = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Notice>();

			while (rset.next()) {
				/*
				 * Notice no = new Notice(rset.getInt("nno"), rset.getString("ntitle"),
				 * rset.getString("ncontent"), rset.getString("nwriter"), rset.getInt("ncount"),
				 * rset.getDate("nDate"));
				 */

				Notice no = new Notice(rset.getInt("n_num"), rset.getString("n_title"), rset.getString("n_content"),
						rset.getInt("n_clicks"), rset.getDate("n_date"), rset.getString("memberid"));

				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setString(3, n.getMemberid());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateCount(Connection conn, int no) {
		// 쿼리를 먼저 써보자..
		// update notice set ncount = ncount + 1 where nno = ?
		// 위치홀더가 들어갔으니 ==> PreparedStatement
		// update를 썼으니 ==> int result
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public Notice selectNotice(Connection conn, int no) {
		// 쿼리부터 써보기
		// select * from notice where nno = ?
		// 위치홀더가 있으니 ==> PreparedStatement pstmt
		// select문이니 ==> ResultSet rset
		// select한 결과는 0~1개! 그리고 결과 값은 notice니까 ==> Notice n
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;

		String query = prop.getProperty("selectNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			if (rset.next()) { // 한 개 아니면 영 개이기 때문에 while문을 돌릴 필요 없음
				/*
				 * n = new Notice(rset.getInt("nno"), rset.getString("ntitle"),
				 * rset.getString("ncontent"), rset.getString("nwriter"), rset.getInt("ncount"),
				 * rset.getDate("ndate"));
				 */

				n = new Notice(rset.getInt("n_num"), rset.getString("n_title"), rset.getString("n_content"),
						rset.getInt("n_clicks"), rset.getDate("n_date"), rset.getString("memberid"));
			}
			// System.out.println(n);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return n;
	}

	public int updateNotice(Connection conn, Notice n) {
		// 쿼리부터 작성해보기
		// 위치홀더가 있으니 PreparedStatement
		// update니까 int result
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setInt(3, n.getN_num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteNotice(Connection conn, int nno) {
		// 쿼리 : update notice set status='N' where nno = ?
		// 위치홀더가 있으니 PreparedStatement
		// update니까 int result
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, nno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCountAll(Connection conn) {
		// select count(*) from NOTICE
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCountALl");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Notice> selectList(Connection conn, int currentPage, int boardLimit) {
		/*
		 * select N_NUM, N_TITLE, N_CONTENT, N_CLICKS, N_DATE, MEMBERID from ( select
		 * ROWNUM R, N_NUM, N_TITLE, N_CONTENT, N_CLICKS, N_DATE, MEMBERID from( SELECT
		 * * FROM NOTICE ORDER BY N_NUM DESC) ) WHERE R BETWEEN ? AND ?
		 */
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;

		String query = prop.getProperty("selectListN");

		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			list = new ArrayList<Notice>();

			while (rset.next()) {
				Notice n = new Notice(rset.getInt("n_num"), rset.getString("n_title"), rset.getString("n_content"),
						rset.getInt("n_clicks"), rset.getDate("n_date"), rset.getString("memberid"));
				list.add(n);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Notice> selectList(Connection conn, String option, String searchKeyword, int currentPage,
			int boardLimit) {
//		System.out.println(option);
//		System.out.println(searchKeyword);

		String query = null;

		// Like(?) 위치홀더에
		String keyword = "%" + searchKeyword + "%";

		if (option.equals("A")) {
			query = prop.getProperty("selectListNA");

		} else if (option.equals("T")) {
			query = prop.getProperty("selectListNT");

		} else if (option.equals("C")) {
			query = prop.getProperty("selectListNC");
		}

		// System.out.println(query);
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;

		try {

			list = new ArrayList<Notice>();

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			list = new ArrayList<Notice>();

			while (rset.next()) {
				Notice n = new Notice(rset.getInt("n_num"), rset.getString("n_title"), rset.getString("n_content"),
						rset.getInt("n_clicks"), rset.getDate("n_date"), rset.getString("memberid"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountFilter(Connection conn, String option, String searchKeyword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCountFilter");
	
		if (option.equals("T")) {
			query = query.replace("N_TITLE || N_CONTENT", "N_TITLE");
		} else if (option.equals("C")) {
			query = query.replace("N_TITLE || N_CONTENT", "N_CONTENT");
		}
		String keyword = "%" + searchKeyword + "%";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
			// System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}
